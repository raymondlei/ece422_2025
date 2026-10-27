
class DataPackingCore:

    @staticmethod
    def pack_nil(obj) -> list:
        ret_list = list()
        ret_list.append(b"\xc0")
        return ret_list

    @staticmethod
    def pack_false(obj) -> list:
        ret_list = list()
        ret_list.append(b"\xc2")
        return ret_list
    
    @staticmethod
    def pack_true(obj) -> list:
        ret_list = list()
        ret_list.append(b"\xc3")
        return ret_list

    @staticmethod
    def pack_uint32(obj) -> list:
        ret_list = list()
        return ret_list
    
    @staticmethod
    def pack_float(obj) -> list:
        ret_list = list()
        return ret_list
    
    @staticmethod
    def pack_str8(obj) -> list:
        ret_list = list()
        return ret_list

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