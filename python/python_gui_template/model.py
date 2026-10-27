"""Packet conversion and serial connection ownership, independent of Tk."""

from dataclasses import dataclass

import serial

from datapack.pack import DataPackingCore
from datapack.unpack import DataUnpackingCore
from .serial_data_handler import SerialDataPacket


VALUE_TYPES = ("None", "bool", "uint32", "float32", "str8")


@dataclass(frozen=True)
class ExchangeResult:
    sent: bytes
    received: bytes
    value: object


class SerialModel:
    def __init__(self) -> None:
        self.port: serial.SerialBase | None = None
        self.packet_io: SerialDataPacket | None = None

    def connect(self, address: str) -> None:
        if self.port is not None:
            raise ValueError("Disconnect before opening another port.")
        address = address.strip()
        if not address:
            raise ValueError("Enter a serial port or loop://.")
        self.port = serial.serial_for_url(
            address, baudrate=38400, timeout=1.0, write_timeout=1.0,
            bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE,
            stopbits=serial.STOPBITS_ONE,
            xonxoff=False, rtscts=False, dsrdtr=False,
        )
        self.packet_io = SerialDataPacket(self.port)

    def disconnect(self) -> None:
        if self.port is not None:
            self.port.close()
        self.port = None
        self.packet_io = None

    @staticmethod
    def prepare_packet(value_type: str, text: str) -> bytes:
        value: object
        if value_type == "None":
            value = None
        elif value_type == "bool":
            if text.strip().lower() not in ("true", "false"):
                raise ValueError("A bool must be true or false.")
            value = text.strip().lower() == "true"
        elif value_type == "uint32":
            cleaned = text.strip()
            value = int(cleaned, 16 if cleaned.lower().startswith("0x") else 10)
        elif value_type == "float32":
            value = float(text)
        elif value_type == "str8":
            value = text
        else:
            raise ValueError(f"Unsupported value type: {value_type}")
        return b"".join(DataPackingCore.pack(value))

    def exchange(self, payload: bytes) -> ExchangeResult:
        if self.packet_io is None:
            raise ValueError("Connect before sending a packet.")
        try:
            self.packet_io.write_packet(payload)
            received = self.packet_io.read_packet()
            value = DataUnpackingCore.unpack([received])
            if received != payload:
                raise ValueError(
                    f"Echo mismatch: sent {payload.hex(' ')}, "
                    f"received {received.hex(' ')}"
                )
            return ExchangeResult(payload, received, value)
        except (serial.SerialException, OSError, ValueError):
            # Failed framing can leave unread bytes; reconnect before the next request.
            self.disconnect()
            raise
