import serial


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
