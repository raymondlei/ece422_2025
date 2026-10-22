import time
import tkinter as tk
import unittest
from unittest.mock import Mock

import serial

from python_gui_template.controller import SerialController
from python_gui_template.model import SerialModel
from python_gui_template.serial_data_handler import SerialDataPacket


class TestSerialModel(unittest.TestCase):
    def setUp(self):
        self.model = SerialModel()
        self.addCleanup(self.model.disconnect)

    def test_all_types_over_real_loopback(self):
        cases = (
            ("None", "", b"\xc0", None),
            ("bool", "false", b"\xc2", False),
            ("bool", "TRUE", b"\xc3", True),
            ("uint32", "0", b"\xce\x00\x00\x00\x00", 0),
            ("uint32", "0xffffffff", b"\xce\xff\xff\xff\xff", 4294967295),
            ("float32", "0.1", b"\xca\x3d\xcc\xcc\xcd", 0.10000000149011612),
            ("str8", "", b"\xd9\x00", ""),
            ("str8", "\u00e9\n", b"\xd9\x03\xc3\xa9\x0a", "\u00e9\n"),
            ("str8", "a" * 255, b"\xd9\xff" + b"a" * 255, "a" * 255),
        )
        self.model.connect("loop://")
        port = self.model.port
        self.assertEqual(port.baudrate, 38400)
        for value_type, text, expected, value in cases:
            with self.subTest(value_type=value_type, text=text):
                payload = self.model.prepare_packet(value_type, text)
                self.assertEqual(payload, expected)
                result = self.model.exchange(payload)
                self.assertEqual(result.sent, expected)
                self.assertEqual(result.received, expected)
                self.assertEqual(result.value, value)
                self.assertIs(type(result.value), type(value))
        self.assertEqual(port.in_waiting, 0)
        self.model.disconnect()
        self.assertFalse(port.is_open)
        self.assertIsNone(self.model.packet_io)

    def test_validation_does_not_disconnect(self):
        self.model.connect("loop://")
        cases = (
            ("bool", "yes"), ("uint32", "-1"), ("uint32", "4294967296"),
            ("uint32", "no"), ("float32", "no"), ("float32", "1e100"),
            ("str8", "\u00e9" * 128), ("unknown", ""),
        )
        for value_type, text in cases:
            with self.subTest(value_type=value_type, text=text):
                with self.assertRaises((ValueError, OverflowError)):
                    self.model.prepare_packet(value_type, text)
                self.assertTrue(self.model.port.is_open)
                self.assertEqual(self.model.port.in_waiting, 0)

    def test_connection_guards(self):
        with self.assertRaises(ValueError):
            self.model.connect(" ")
        with self.assertRaises(ValueError):
            self.model.exchange(b"\xc0")
        self.model.connect("loop://")
        with self.assertRaises(ValueError):
            self.model.connect("loop://")

    def test_packet_reads_fragments_and_preserves_boundaries(self):
        port = Mock(spec=serial.SerialBase)
        port.read.side_effect = [b"\xd9", b"\x03", b"a", b"bc", b"\xc3"]
        packet_io = SerialDataPacket(port)
        self.assertEqual(packet_io.read_packet(), b"\xd9\x03abc")
        self.assertEqual(packet_io.read_packet(), b"\xc3")

    def test_exchange_errors_close_connection(self):
        for failure in ("short write", "timeout", "marker", "truncated", "mismatch"):
            with self.subTest(failure=failure):
                port = Mock(spec=serial.SerialBase)
                port.write.return_value = 1
                port.read.side_effect = {
                    "short write": [b"\xc0"],
                    "timeout": [b""],
                    "marker": [b"\xff"],
                    "truncated": [b"\xce", b"\x00", b""],
                    "mismatch": [b"\xc3"],
                }[failure]
                if failure == "short write":
                    port.write.return_value = 0
                self.model.port = port
                self.model.packet_io = SerialDataPacket(port)
                with self.assertRaises((serial.SerialException, OSError, ValueError)):
                    self.model.exchange(b"\xc0")
                port.close.assert_called_once()
                self.assertIsNone(self.model.port)
                self.assertIsNone(self.model.packet_io)


class TestSerialGUI(unittest.TestCase):
    def setUp(self):
        self.root = tk.Tk()
        self.root.withdraw()
        self.controller = SerialController(self.root)
        self.addCleanup(self.cleanup)

    def wait_for_operation(self):
        deadline = time.monotonic() + 5
        while self.controller.pending is not None:
            if time.monotonic() > deadline:
                self.fail("GUI operation did not finish")
            self.root.update()
            time.sleep(0.01)

    def log(self):
        return self.controller.view.log.get("1.0", tk.END)

    def test_connect_send_validation_disconnect(self):
        view = self.controller.view
        self.assertTrue(view.send_button.instate(["disabled"]))
        view.connect_button.invoke()
        self.assertTrue(view.connect_button.instate(["disabled"]))
        self.wait_for_operation()
        self.assertTrue(view.send_button.instate(["!disabled"]))
        view.value_type.set("float32")
        view.select_type()
        view.send_button.invoke()
        self.wait_for_operation()
        self.assertIn("TX (5 bytes): ca 3d cc cc cd", self.log())
        self.assertIn("RX (5 bytes): ca 3d cc cc cd", self.log())
        self.assertIn("0.10000000149011612", self.log())
        self.assertIn("Echo verified byte-for-byte.", self.log())
        view.value_type.set("bool")
        view.value.set("invalid")
        view.send_button.invoke()
        self.assertIn("ERROR: A bool must be true or false.", self.log())
        self.assertTrue(self.controller.model.port.is_open)
        view.disconnect_button.invoke()
        self.wait_for_operation()
        self.assertIsNone(self.controller.model.port)
        self.assertTrue(view.send_button.instate(["disabled"]))
        view.clear_log()
        self.assertEqual(self.log(), "\n")

    def test_async_failure_is_visible_and_gui_can_reconnect(self):
        self.controller.view.address.set("unsupported-url://")
        self.controller.connect()
        self.wait_for_operation()
        self.assertIn("ERROR:", self.log())
        self.assertTrue(self.controller.view.connect_button.instate(["!disabled"]))
        self.assertIsNone(self.controller.model.port)

    def test_close_waits_for_worker_and_closes_port(self):
        self.controller.connect()
        self.wait_for_operation()
        port = self.controller.model.port
        self.controller.send()
        self.controller.close()
        self.assertTrue(self.controller.closing)
        self.wait_for_operation()
        self.assertFalse(port.is_open)

    def cleanup(self):
        try:
            exists = self.root.winfo_exists()
        except tk.TclError:
            return
        if exists:
            self.wait_for_operation()
            self.controller.close()


if __name__ == "__main__":
    unittest.main()
