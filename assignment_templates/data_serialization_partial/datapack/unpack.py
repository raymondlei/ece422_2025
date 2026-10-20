"""Unpack exactly one datapack value, rejecting malformed or extra bytes."""

import struct
from collections.abc import Callable


def _payload(data_list: list[bytes], marker: int, size: int | None = None) -> bytes:
    data = b"".join(data_list)
    if not data or data[0] != marker:
        raise ValueError(f"Expected datapack marker 0x{marker:02x}")
    if size is not None and len(data) != size:
        raise ValueError(f"Marker 0x{marker:02x} requires {size} bytes, got {len(data)}")
    return data


class DataUnpackingCore:

    @staticmethod
    def unpack(data_list: list[bytes]) -> object:
        data = b"".join(data_list)
        if not data:
            raise ValueError("Cannot unpack an empty payload")
        decoders: dict[int, Callable[[list[bytes]], object]] = {
            0xc0: DataUnpackingCore.unpack_nil,
            0xc2: DataUnpackingCore.unpack_false,
            0xc3: DataUnpackingCore.unpack_true,
            0xce: DataUnpackingCore.unpack_uint32,
            0xca: DataUnpackingCore.unpack_float,
            0xd9: DataUnpackingCore.unpack_str8,
        }
        decoder = decoders.get(data[0])
        if decoder is None:
            raise ValueError(f"Unsupported datapack marker 0x{data[0]:02x}")
        return decoder([data])

    @staticmethod
    def unpack_nil(data_list: list[bytes]) -> None:
        _payload(data_list, 0xc0, 1)
        return None

    @staticmethod
    def unpack_false(data_list: list[bytes]) -> bool:
        _payload(data_list, 0xc2, 1)
        return False

    @staticmethod
    def unpack_true(data_list: list[bytes]) -> bool:
        _payload(data_list, 0xc3, 1)
        return True

    @staticmethod
    def unpack_uint32(data_list: list[bytes]) -> int:
        data = _payload(data_list, 0xce, 5)
        return struct.unpack(">I", data[1:])[0]

    @staticmethod
    def unpack_float(data_list: list[bytes]) -> float:
        data = _payload(data_list, 0xca, 5)
        return struct.unpack(">f", data[1:])[0]

    @staticmethod
    def unpack_str8(data_list: list[bytes]) -> str:
        data = _payload(data_list, 0xd9)
        if len(data) < 2:
            raise ValueError("str8 is missing its length byte")
        expected = 2 + data[1]
        if len(data) != expected:
            raise ValueError(f"str8 requires {expected} bytes, got {len(data)}")
        return data[2:].decode("utf-8")
