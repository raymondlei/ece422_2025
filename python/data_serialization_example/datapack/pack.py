
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