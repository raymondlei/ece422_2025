from collections.abc import Callable

class DataUnpackingCore:

    @staticmethod
    def unpack_nil(data_list: list) -> object:
        if data_list[0] == b"\xc0":
            return None

    @staticmethod
    def unpack_false(data_list: list) -> object:
        if data_list[0] == b"\xc2":
            return False
    
    @staticmethod
    def unpack_true(data_list: list) -> object:
        if data_list[0] == b"\xc3":
            return True

    @staticmethod
    def unpack_uint32(data_list: list) -> object:
        # TODO: to be implemented
        return None
    
    @staticmethod
    def unpack_float(data_list: list) -> object:
        # TODO: to be implemented
        return None
    
    @staticmethod
    def unpack_str8(data_list: list) -> object:
        # TODO: to be implemented
        return None

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
