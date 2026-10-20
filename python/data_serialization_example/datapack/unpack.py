
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
