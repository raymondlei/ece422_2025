"""38400-baud binary echo demo for the local datapack implementation.

Install the dependency with: python -m pip install pyserial
Click Run Python File for a hardware-free loopback demo, or select a real port:
    python app_demo.py --port COM4
You can also change SERIAL_PORT below to use the Run icon with hardware.

The embedded application must use 38400 baud, 8 data bits, no parity, 1 stop bit,
and no flow control. It must echo each complete binary value unchanged, without
text, newlines, or acknowledgements. Connect compatible UART voltage levels,
cross TX/RX, and share ground. Do not connect RS-232 voltage levels to MCU pins.

Wire format (a MessagePack subset; not a full MessagePack implementation):
    None:    C0
    False:   C2
    True:    C3
    uint32:  CE + 4 unsigned big-endian bytes
    float32: CA + 4 IEEE 754 big-endian bytes
    str8:    D9 + 1 UTF-8 byte-count + that many UTF-8 bytes (0..255)
There is no additional framing: the marker determines the remaining length.
Only one request is outstanding at a time. Unknown markers, truncated packets,
and echo mismatches abort the demo rather than attempting resynchronization.
Float32 decoding may round the original Python float; echoes are compared as
bytes. Serial timeouts apply to each read/write, not the whole session.
"""

import argparse
import sys

# pySerial is installed separately; its Python import name is "serial".
import serial

from datapack.pack import DataPackingCore
from datapack.unpack import DataUnpackingCore

# Uppercase names identify settings by convention; Python still allows changes.
# "loop://" echoes bytes inside Python without accessing a physical serial port.
SERIAL_PORT = "loop://"
SERIAL_BAUD_RATE = 38400
# Read and write timeouts are measured in seconds.
SERIAL_TIMEOUT = 2.0

# Each tuple contains (display label, Python value). Only the value is transmitted.
# None means "no value"; integers starting with 0x are written in hexadecimal.
EXAMPLE_DATA = (
    ("no reading", None),
    ("output disabled", False),
    ("output enabled", True),
    ("sample counter", 0x10000),
    ("maximum counter", 0xffffffff),
    ("temperature", 23.75),
    ("fraction (float32 rounding)", 0.1),
    ("device label", "MCU ready"),
)


class SerialDataPacket:
    """Read and write datapack packets using an already-open serial port."""

    def __init__(self, port: serial.SerialBase) -> None:
        # Python calls __init__ when we create a SerialDataPacket object.
        # self refers to that object; each object's methods share its stored port.
        # This class borrows the connection. main() still opens and closes it.
        self.port: serial.SerialBase = port

    def write_packet(self, payload: bytes) -> None:
        """Write a binary packet and raise an error if the byte count is incomplete."""
        # write() returns a byte count, not a reply from the embedded device.
        written = self.port.write(payload)
        if written != len(payload):
            raise serial.SerialTimeoutException(
                f"Incomplete serial write: expected {len(payload)} bytes, wrote {written}"
            )

    # Type hints describe the expected arguments and return type; they do not
    # automatically convert values or enforce their types at runtime.
    def read_exact(self, size: int) -> bytes:
        # A serial message can arrive in pieces. bytearray is a mutable buffer,
        # so we can append each piece until we have the requested number of bytes.
        data = bytearray()
        while len(data) < size:
            # Read only the missing bytes, leaving any following packet untouched.
            chunk = self.port.read(size - len(data))
            # With a finite timeout, an empty result b"" means no bytes arrived.
            # Empty sequences are false in an "if" condition.
            if not chunk:
                raise TimeoutError(
                    f"Serial receive timed out: expected {size} bytes, got {len(data)}"
                )
            data.extend(chunk)
        # bytes is the immutable form of the buffer. A size of zero returns b"".
        return bytes(data)

    def read_packet(self) -> bytes:
        """Read exactly one supported value, even when it arrives in fragments."""
        # Binary data may contain newline bytes, so readline() cannot frame packets.
        # Instead, the first byte tells us how many more bytes belong to this value.
        marker = self.read_exact(1)
        # b"\xc0" is one byte with hexadecimal value C0, not the text "c0".
        # None and booleans fit entirely in their marker byte.
        if marker in (b"\xc0", b"\xc2", b"\xc3"):
            return marker
        # uint32 and float32 each have a four-byte value after their marker.
        if marker in (b"\xce", b"\xca"):
            return marker + self.read_exact(4)
        if marker == b"\xd9":
            length = self.read_exact(1)
            # Indexing bytes returns an integer: b"\x03"[0] is 3.
            # This length counts UTF-8 bytes, which may differ from character count.
            return marker + length + self.read_exact(length[0])
        # Do not guess a length for unknown markers: we could lose packet boundaries.
        raise ValueError(f"Unsupported datapack marker 0x{marker[0]:02x}")


def serialize_value(value: object) -> bytes:
    """Convert a Python value into datapack bytes without sending them."""
    # pack() is a static method, so no DataPackingCore instance is needed.
    # It returns a list of byte chunks; b"".join combines them without a
    # separator into the single bytes object that pySerial will transmit.
    ret : list[bytes]
    ret = []

    if value is None:
        ret = DataPackingCore.pack_nil(value)
    elif value is False:
        ret = DataPackingCore.pack_false(value)
    elif value is True:
        ret = DataPackingCore.pack_true(value)
    elif isinstance(value, int):
        ret = DataPackingCore.pack_uint32(value)
    elif isinstance(value, float):
        ret = DataPackingCore.pack_float(value)
    elif isinstance(value, str):
        ret = DataPackingCore.pack_str8(value)

    if not ret:
        raise TypeError(f"Unsupported datapack value type: {type(value).__name__}")

    return b"".join(ret)


def deserialize_value(payload: bytes) -> object:
    """Reconstruct a Python value from one complete datapack packet."""
    # [payload] wraps the packet in the list expected by the datapack API.
    return DataUnpackingCore.unpack([payload])


def send_example(packet_io: SerialDataPacket, name: str, value: object) -> bytes:
    """Serialize, log, and send one example, returning the transmitted bytes."""
    payload = serialize_value(value)
    # f-strings insert values into text. !r shows their Python representation
    # (including quotes for strings); hex(' ') displays bytes as "ce 00 ...".
    # This text is only for the console, not for transmission.
    print(f"TX {name}: {value!r} -> {payload.hex(' ')}")
    
    packet_io.write_packet(payload)
    return payload


def receive_example(packet_io: SerialDataPacket, name: str, payload: bytes) -> None:
    """Receive, deserialize, and log an echo, checking it against the sent bytes."""
    # Wait for one complete echo before sending the next example.
    received = packet_io.read_packet()
    restored = deserialize_value(received)
    print(f"RX {received.hex(' ')} -> {restored!r}")
    # Compare the actual bytes: float32 can round a Python float such as 0.1,
    # so the decoded number need not exactly equal the original number.
    if received != payload:
        raise ValueError(
            f"Echo mismatch for {name}: sent {payload.hex(' ')}, "
            f"received {received.hex(' ')}"
        )


def send_float(packet_io: SerialDataPacket, name: str, value: object) -> bytes:
    """Serialize, log, and send one example, returning the transmitted bytes."""
    ret = DataPackingCore.pack_float(value)
    payload = b"".join(ret)

    # f-strings insert values into text. !r shows their Python representation
    # (including quotes for strings); hex(' ') displays bytes as "ce 00 ...".
    # This text is only for the console, not for transmission.
    print(f"TX {name}: {value!r} -> {payload.hex(' ')}")
    
    packet_io.write_packet(payload)
    return payload


def run_nil_demo(port: serial.SerialBase) -> None:

    EXAMPLE_DATA = (
        ("no reading", None)
    )

    # Create one object so sending and receiving use the same serial connection.
    packet_io = SerialDataPacket(port)

    name, value = ("no reading", None)

    """Serialize, send, receive, and check one example using an open serial port."""
    payload = b"".join(DataPackingCore.pack_nil(value))
    # f-strings insert values into text. !r shows their Python representation
    # (including quotes for strings); hex(' ') displays bytes as "ce 00 ...".
    # This text is only for the console, not for transmission.
    print(f"TX {name}: {value!r} -> {payload.hex(' ')}")
    packet_io.write_packet(payload)

    """Receive and check the echo for the example."""
    receive_example(packet_io, name, payload)
    print(f"Completed {len(EXAMPLE_DATA)} echo checks.")


def run_boolean_demo(port: serial.SerialBase) -> None:
    EXAMPLE_DATA = (
        ("output disabled", False),
        ("output enabled", True)
    )
    # Create one object so sending and receiving use the same serial connection.
    packet_io = SerialDataPacket(port)
    # The two loop variables receive the label and value from each example tuple.
    for name, value in EXAMPLE_DATA:
        """Serialize, send, receive, and check one example using an open serial port."""
        payload = send_example(packet_io, name, value)

        """Receive and check the echo for the example."""
        receive_example(packet_io, name, payload)

    print(f"Completed {len(EXAMPLE_DATA)} echo checks.")


def run_float_demo(port: serial.SerialBase) -> None:
    EXAMPLE_DATA = (
        ("temperature", 23.75),
        ("fraction (float32 rounding)", 0.1),
    )
    # Create one object so sending and receiving use the same serial connection.
    packet_io = SerialDataPacket(port)
    # The two loop variables receive the label and value from each example tuple.
    for name, value in EXAMPLE_DATA:
        """Serialize, send, receive, and check one example using an open serial port."""
        payload = send_float(packet_io, name, value)

        """Receive and check the echo for the example."""
        receive_example(packet_io, name, payload)

    print(f"Completed {len(EXAMPLE_DATA)} echo checks.")


def main() -> int:
    # argparse handles options such as --port COM4 and generates --help.
    # __doc__ is the description in the triple-quoted string at the file's top.
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--port", default=SERIAL_PORT,
        help="Serial port, such as COM4, or loop:// for a hardware-free demo",
    )
    args = parser.parse_args()

    try:
        # serial_for_url supports both real ports and the virtual loop:// port.
        # "with" closes the connection when this block ends, even on an error.
        with serial.serial_for_url(
            args.port,
            baudrate=SERIAL_BAUD_RATE,
            bytesize=serial.EIGHTBITS,
            parity=serial.PARITY_NONE,
            stopbits=serial.STOPBITS_ONE,
            timeout=SERIAL_TIMEOUT,
            write_timeout=SERIAL_TIMEOUT,
            # Disable software (XON/XOFF) and hardware (RTS/CTS, DSR/DTR) flow control.
            xonxoff=False,
            rtscts=False,
            dsrdtr=False,
        ) as port:
            print(f"Opened {args.port} at {SERIAL_BAUD_RATE} baud, 8-N-1")
            run_nil_demo(port)
            run_boolean_demo(port)
            run_float_demo(port)


    # Expected serial and packet errors reach this handler, rather than being
    # silently ignored. stderr keeps error messages separate from normal output.
    except (serial.SerialException, TimeoutError, ValueError) as error:
        print(f"Serial demo failed: {error}", file=sys.stderr)
        return 1
    return 0


# This block runs when the file is executed, but not when tests import it.
if __name__ == "__main__":
    # Pass main's result to the operating system: 0 means success, 1 means failure.
    sys.exit(main())