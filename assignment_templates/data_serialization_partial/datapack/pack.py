"""Pack a small MessagePack subset, returning a list of byte chunks."""

import struct


class DataPackingCore:

    @staticmethod
    def pack(obj: object) -> list[bytes]:
        if obj is None:
            return DataPackingCore.pack_nil(obj)
        if obj is False:
            return DataPackingCore.pack_false(obj)
        if obj is True:
            return DataPackingCore.pack_true(obj)
        if isinstance(obj, int):
            return DataPackingCore.pack_uint32(obj)
        if isinstance(obj, float):
            return DataPackingCore.pack_float(obj)
        if isinstance(obj, str):
            return DataPackingCore.pack_str8(obj)
        raise TypeError(f"Unsupported datapack value type: {type(obj).__name__}")

    @staticmethod
    def pack_nil(obj: object) -> list[bytes]:
        if obj is not None:
            raise TypeError("pack_nil requires None")
        return [b"\xc0"]

    @staticmethod
    def pack_false(obj: object) -> list[bytes]:
        if obj is not False:
            raise TypeError("pack_false requires False")
        return [b"\xc2"]

    @staticmethod
    def pack_true(obj: object) -> list[bytes]:
        if obj is not True:
            raise TypeError("pack_true requires True")
        return [b"\xc3"]

    @staticmethod
    def pack_uint32(obj: object) -> list[bytes]:
        if not isinstance(obj, int) or isinstance(obj, bool):
            raise TypeError("pack_uint32 requires an integer, not a boolean")
        if not 0 <= obj <= 0xffffffff:
            raise ValueError("uint32 must be between 0 and 4294967295")
        return [b"\xce" + struct.pack(">I", obj)]

    @staticmethod
    def pack_float(obj: object) -> list[bytes]:
        """Encode an IEEE 754 float32; values may be rounded to 32-bit precision."""
        if not isinstance(obj, float):
            raise TypeError("pack_float requires a float")
        return [b"\xca" + struct.pack(">f", obj)]

    @staticmethod
    def pack_str8(obj: object) -> list[bytes]:
        if not isinstance(obj, str):
            raise TypeError("pack_str8 requires a string")
        encoded = obj.encode("utf-8")
        if len(encoded) > 255:
            raise ValueError("str8 is limited to 255 UTF-8 bytes")
        return [b"\xd9" + bytes([len(encoded)]) + encoded]