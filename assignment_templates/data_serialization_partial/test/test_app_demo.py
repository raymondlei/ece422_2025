import io
import sys
import unittest
from contextlib import redirect_stderr, redirect_stdout
from pathlib import Path
from unittest.mock import Mock, call, patch

import serial

if __name__ == "__main__" and not __package__:
    sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

import app_demo
from datapack.unpack import DataUnpackingCore


class TestSerialDemo(unittest.TestCase):

    def test_example_wire_bytes(self):
        expected = (
            b"\xc0", b"\xc2", b"\xc3", b"\xce\x00\x01\x00\x00",
            b"\xce\xff\xff\xff\xff", b"\xca\x41\xbe\x00\x00",
            b"\xca\x3d\xcc\xcc\xcd", b"\xd9\x09MCU ready",
        )
        self.assertEqual(len(app_demo.EXAMPLE_DATA), len(expected))
        for (_, value), packet in zip(app_demo.EXAMPLE_DATA, expected):
            with self.subTest(value=value):
                self.assertEqual(app_demo.serialize_value(value), packet)

    def test_deserialize_value(self):
        cases = (
            (b"\xc0", None),
            (b"\xc2", False),
            (b"\xc3", True),
            (b"\xce\x00\x01\x00\x00", 65536),
            (b"\xca\x41\xbe\x00\x00", 23.75),
            (b"\xca\x3d\xcc\xcc\xcd", 0.10000000149011612),
            (b"\xd9\x09MCU ready", "MCU ready"),
        )
        for packet, expected in cases:
            with self.subTest(packet=packet):
                restored = app_demo.deserialize_value(packet)
                self.assertEqual(restored, expected)
                self.assertIs(type(restored), type(expected))

    def test_serialization_helpers_reject_invalid_data(self):
        with self.assertRaises(TypeError):
            app_demo.serialize_value({})
        for packet in (b"", b"\x01", b"\xce\x00"):
            with self.subTest(packet=packet), self.assertRaises(ValueError):
                app_demo.deserialize_value(packet)

    def test_demo_loopback(self):
        output = io.StringIO()
        with serial.serial_for_url(
            "loop://", baudrate=38400, timeout=0.05, write_timeout=0.05
        ) as port, redirect_stdout(output):
            app_demo.run_demo(port)
            self.assertEqual(port.in_waiting, 0)
        self.assertIn("Completed 8 echo checks.", output.getvalue())
        self.assertIn("RX ca 41 be 00 00 -> 23.75", output.getvalue())
        self.assertFalse(port.is_open)

    def test_packet_constructor_borrows_port(self):
        port = Mock(spec=serial.SerialBase)
        packet_io = app_demo.SerialDataPacket(port)
        self.assertIs(packet_io.port, port)
        self.assertEqual(port.mock_calls, [])

    def test_packet_instances_use_their_own_ports(self):
        first_port = Mock(spec=serial.SerialBase)
        second_port = Mock(spec=serial.SerialBase)
        first_port.read.return_value = b"\xc0"
        second_port.read.return_value = b"\xc3"
        first_port.write.return_value = 1
        second_port.write.return_value = 1
        first = app_demo.SerialDataPacket(first_port)
        second = app_demo.SerialDataPacket(second_port)
        first.write_packet(b"\xc0")
        second.write_packet(b"\xc3")
        self.assertEqual(first.read_packet(), b"\xc0")
        self.assertEqual(second.read_packet(), b"\xc3")
        first_port.write.assert_called_once_with(b"\xc0")
        second_port.write.assert_called_once_with(b"\xc3")
        first_port.read.assert_called_once_with(1)
        second_port.read.assert_called_once_with(1)

    def test_write_packet_sends_payload(self):
        port = Mock(spec=serial.SerialBase)
        packet_io = app_demo.SerialDataPacket(port)
        payload = b"\xce\x00\x00\x00\x2a"
        port.write.return_value = len(payload)
        packet_io.write_packet(payload)
        port.write.assert_called_once_with(payload)
        port.read.assert_not_called()

    def test_write_packet_rejects_incomplete_write(self):
        payload = b"\xce\x00\x00\x00\x2a"
        for written in (0, 2):
            with self.subTest(written=written):
                port = Mock(spec=serial.SerialBase)
                packet_io = app_demo.SerialDataPacket(port)
                port.write.return_value = written
                with self.assertRaisesRegex(
                    serial.SerialTimeoutException,
                    f"Incomplete serial write: expected 5 bytes, wrote {written}",
                ):
                    packet_io.write_packet(payload)
                port.write.assert_called_once_with(payload)
                port.read.assert_not_called()

    def test_write_packet_propagates_serial_error(self):
        port = Mock(spec=serial.SerialBase)
        packet_io = app_demo.SerialDataPacket(port)
        error = serial.SerialException("Port disconnected")
        port.write.side_effect = error
        with self.assertRaises(serial.SerialException) as caught:
            packet_io.write_packet(b"\xc0")
        self.assertIs(caught.exception, error)

    def test_send_example_returns_transmitted_bytes_without_reading(self):
        port = Mock(spec=serial.SerialBase)
        packet_io = app_demo.SerialDataPacket(port)
        port.write.return_value = 5
        output = io.StringIO()
        with redirect_stdout(output):
            payload = app_demo.send_example(packet_io, "counter", 42)
        self.assertEqual(payload, b"\xce\x00\x00\x00\x2a")
        port.write.assert_called_once_with(payload)
        port.read.assert_not_called()
        self.assertEqual(output.getvalue(), "TX counter: 42 -> ce 00 00 00 2a\n")

    def test_receive_example_checks_echo_without_writing(self):
        port = Mock(spec=serial.SerialBase)
        packet_io = app_demo.SerialDataPacket(port)
        port.read.side_effect = [b"\xce", b"\x00\x00\x00\x2a"]
        output = io.StringIO()
        with redirect_stdout(output):
            app_demo.receive_example(packet_io, "counter", b"\xce\x00\x00\x00\x2a")
        self.assertEqual(port.read.call_args_list, [call(1), call(4)])
        port.write.assert_not_called()
        self.assertEqual(output.getvalue(), "RX ce 00 00 00 2a -> 42\n")

    def test_send_and_receive_use_same_connection(self):
        port = Mock(spec=serial.SerialBase)
        packet_io = app_demo.SerialDataPacket(port)
        port.write.return_value = 5
        port.read.side_effect = [b"\xce", b"\x00\x00\x00\x2a"]
        output = io.StringIO()
        with redirect_stdout(output):
            payload = app_demo.send_example(packet_io, "counter", 42)
            app_demo.receive_example(packet_io, "counter", payload)
        port.write.assert_called_once_with(b"\xce\x00\x00\x00\x2a")
        self.assertEqual(port.read.call_args_list, [call(1), call(4)])
        self.assertEqual(
            output.getvalue(),
            "TX counter: 42 -> ce 00 00 00 2a\nRX ce 00 00 00 2a -> 42\n",
        )

    def test_reads_consecutive_binary_packets(self):
        packets = (
            b"\xc0", b"\xc2", b"\xc3", b"\xce\x00\x00\x00\x0a",
            b"\xca\x40\x20\x00\x00", b"\xd9\x00",
            b"\xd9\x02\x00\x0a", b"\xd9\x02\xc3\xa9",
            b"\xd9\xff" + b"a" * 255,
        )
        with serial.serial_for_url("loop://", baudrate=38400, timeout=0.05) as port:
            packet_io = app_demo.SerialDataPacket(port)
            port.write(b"".join(packets))
            for packet in packets:
                with self.subTest(packet=packet):
                    self.assertEqual(packet_io.read_packet(), packet)
                    DataUnpackingCore.unpack([packet])
            self.assertEqual(port.in_waiting, 0)

    def test_fragmented_reads(self):
        port = Mock(spec=serial.SerialBase)
        packet_io = app_demo.SerialDataPacket(port)
        port.read.side_effect = [b"\xd9", b"\x03", b"a", b"bc"]
        self.assertEqual(packet_io.read_packet(), b"\xd9\x03abc")
        self.assertEqual(port.read.call_args_list, [call(1), call(1), call(3), call(2)])

    def test_receive_timeout(self):
        with serial.serial_for_url("loop://", timeout=0.01) as port:
            packet_io = app_demo.SerialDataPacket(port)
            with self.assertRaisesRegex(TimeoutError, "expected 1 bytes, got 0"):
                packet_io.read_packet()

    def test_truncated_packet(self):
        port = Mock(spec=serial.SerialBase)
        packet_io = app_demo.SerialDataPacket(port)
        port.read.side_effect = [b"\xce", b"\x00\x01", b""]
        with self.assertRaisesRegex(TimeoutError, "expected 4 bytes, got 2"):
            packet_io.read_packet()

    def test_unknown_marker(self):
        port = Mock(spec=serial.SerialBase)
        packet_io = app_demo.SerialDataPacket(port)
        port.read.return_value = b"\x01"
        with self.assertRaisesRegex(ValueError, "Unsupported datapack marker"):
            packet_io.read_packet()

    def test_short_write(self):
        port = Mock(spec=serial.SerialBase)
        port.write.return_value = 0
        with redirect_stdout(io.StringIO()):
            with self.assertRaisesRegex(serial.SerialTimeoutException, "Incomplete"):
                app_demo.run_demo(port)
        port.read.assert_not_called()

    def test_echo_mismatch(self):
        port = Mock(spec=serial.SerialBase)
        port.write.return_value = 1
        port.read.return_value = b"\xc2"
        with redirect_stdout(io.StringIO()):
            with self.assertRaisesRegex(ValueError, "Echo mismatch"):
                app_demo.run_demo(port)

    def test_main_configures_serial_port_and_closes_it(self):
        port = serial.serial_for_url("loop://", baudrate=38400, timeout=0.05)
        with patch("app_demo.serial.serial_for_url", return_value=port) as open_port:
            with patch.object(sys, "argv", ["app_demo.py", "--port", "COM4"]):
                with redirect_stdout(io.StringIO()):
                    self.assertEqual(app_demo.main(), 0)
        open_port.assert_called_once_with(
            "COM4", baudrate=38400,
            bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE,
            stopbits=serial.STOPBITS_ONE, timeout=app_demo.SERIAL_TIMEOUT,
            write_timeout=app_demo.SERIAL_TIMEOUT,
            xonxoff=False, rtscts=False, dsrdtr=False,
        )
        self.assertFalse(port.is_open)

    def test_main_reports_open_errors(self):
        errors = io.StringIO()
        with patch("app_demo.serial.serial_for_url", side_effect=serial.SerialException("busy")):
            with patch.object(sys, "argv", ["app_demo.py"]), redirect_stderr(errors):
                self.assertEqual(app_demo.main(), 1)
        self.assertIn("Serial demo failed: busy", errors.getvalue())

    def test_main_reports_receive_errors_and_closes_port(self):
        port = serial.serial_for_url("loop://", timeout=0.05)
        errors = io.StringIO()
        with patch("app_demo.serial.serial_for_url", return_value=port):
            with patch.object(app_demo.SerialDataPacket, "read_packet", side_effect=TimeoutError("no echo")):
                with patch.object(sys, "argv", ["app_demo.py"]):
                    with redirect_stdout(io.StringIO()), redirect_stderr(errors):
                        self.assertEqual(app_demo.main(), 1)
        self.assertIn("Serial demo failed: no echo", errors.getvalue())
        self.assertFalse(port.is_open)


if __name__ == "__main__":
    unittest.main()
