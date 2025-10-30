import unittest
import sys
import os

# Add the parent directory to the Python path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from datapack import DataPackingCore, DataUnpackingCore

single_test_vectors = [
    # None
    ["nil", None, [b"\xc0"]],

    # Booleans
    ["bool false", False, [b"\xc2"]],
    ["bool true", True, [b"\xc3"]],

    # 32-bit uint
    ["32-bit uint", 0x10000, [b"\xce\x00\x01\x00\x00"]],
    ["32-bit uint", 0x200000, [b"\xce\x00\x20\x00\x00"]],
    ["32-bit uint", 0xffffffff, [b"\xce\xff\xff\xff\xff"]],

    # single-precision float
    ["float precision single", 2.5, [b"\xca\x40\x20\x00\x00"]],

    # 8-bit String
    ["8-bit string", u"b" * 32, [b"\xd9\x20" + b"b" * 32]],
    ["8-bit string", u"c" * 100, [b"\xd9\x64" + b"c" * 100]],
    ["8-bit string", u"d" * 255, [b"\xd9\xff" + b"d" * 255]],
]

# subclassing unittest.TestCase
class TestDataPacking(unittest.TestCase):

    def _msg(self, name, obj_repr):
        print("\tTesting {:s}: object {:s}".format(
                  name, obj_repr if len(obj_repr) < 24 else obj_repr[0:24] + "..."))

    def _arrange_test_case(self, test_case_index: int):
        name, obj, data = single_test_vectors[test_case_index]
        obj_repr = repr(obj)
        self._msg(name, obj_repr)
        return obj, data
        
    def test_pack_nil(self):
        # [arrange]
        obj, data = self._arrange_test_case(0)

        # [assert]
        self.assertEqual(DataPackingCore.pack_nil(obj), data)

    def test_pack_false(self):
        # [arrange]
        obj, data = self._arrange_test_case(1)

        # [assert]
        self.assertEqual(DataPackingCore.pack_false(obj), data)

    def test_pack_true(self):
        # [arrange]
        obj, data = self._arrange_test_case(2)

        # [assert]
        self.assertEqual(DataPackingCore.pack_true(obj), data)

    # def test_pack_uint32_1(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(3)

    #     # [assert]
    #     self.assertEqual(DataPackingCore.pack_uint32(obj), data)

    # def test_pack_uint32_2(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(4)

    #     # [assert]
    #     self.assertEqual(DataPackingCore.pack_uint32(obj), data)

    # def test_pack_uint32_3(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(5)

    #     # [assert]
    #     self.assertEqual(DataPackingCore.pack_uint32(obj), data)

    # def test_pack_float(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(6)

    #     # [assert]
    #     self.assertEqual(DataPackingCore.pack_float(obj), data)

    # def test_pack_str_1(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(7)

    #     # [assert]
    #     self.assertEqual(DataPackingCore.pack_str8(obj), data)

    # def test_pack_str_2(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(8)

    #     # [assert]
    #     self.assertEqual(DataPackingCore.pack_str8(obj), data)

    # def test_pack_str_3(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(9)

    #     # [assert]
    #     self.assertEqual(DataPackingCore.pack_str8(obj), data)


# subclassing unittest.TestCase
class TestDataUnPacking(unittest.TestCase):

    def _msg(self, name, obj_repr):
        print("\tTesting {:s}: object {:s}".format(
                  name, obj_repr if len(obj_repr) < 24 else obj_repr[0:24] + "..."))

    def _arrange_test_case(self, test_case_index: int):
        name, obj, data = single_test_vectors[test_case_index]
        obj_repr = repr(obj)
        self._msg(name, obj_repr)
        return obj, data
        
    def test_unpack_nil(self):
        # [arrange]
        obj, data = self._arrange_test_case(0)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_nil(data), obj)

    def test_unpack_false(self):
        # [arrange]
        obj, data = self._arrange_test_case(1)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_false(data), obj)

    def test_unpack_true(self):
        # [arrange]
        obj, data = self._arrange_test_case(2)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_true(data), obj)

    # def test_unpack_uint32_1(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(3)

    #     # [assert]
    #     self.assertEqual(DataUnpackingCore.unpack_uint32(data), obj)

    # def test_unpack_uint32_2(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(4)

    #     # [assert]
    #     self.assertEqual(DataUnpackingCore.unpack_uint32(data), obj)

    # def test_unpack_uint32_3(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(5)

    #     # [assert]
    #     self.assertEqual(DataUnpackingCore.unpack_uint32(data), obj)

    # def test_unpack_float(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(6)

    #     # [assert]
    #     self.assertEqual(DataUnpackingCore.unpack_float(data), obj)

    # def test_unpack_str_1(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(7)

    #     # [assert]
    #     self.assertEqual(DataUnpackingCore.unpack_str8(data), obj)

    # def test_unpack_str_2(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(8)

    #     # [assert]
    #     self.assertEqual(DataUnpackingCore.unpack_str8(data), obj)

    # def test_unpack_str_3(self):
    #     # [arrange]
    #     obj, data = self._arrange_test_case(9)

    #     # [assert]
    #     self.assertEqual(DataUnpackingCore.unpack_str8(data), obj)


if __name__ == '__main__':
    unittest.main()
