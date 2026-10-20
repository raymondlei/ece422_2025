import math
import sys
import unittest
from pathlib import Path

if __name__ == "__main__" and not __package__:
    # Direct execution needs the parent directory containing the datapack package.
    sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from datapack.pack import DataPackingCore
from datapack.unpack import DataUnpackingCore

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

    def test_pack_uint32_1(self):
        # [arrange]
        obj, data = self._arrange_test_case(3)

        # [assert]
        self.assertEqual(DataPackingCore.pack_uint32(obj), data)

    def test_pack_uint32_2(self):
        # [arrange]
        obj, data = self._arrange_test_case(4)

        # [assert]
        self.assertEqual(DataPackingCore.pack_uint32(obj), data)

    def test_pack_uint32_3(self):
        # [arrange]
        obj, data = self._arrange_test_case(5)

        # [assert]
        self.assertEqual(DataPackingCore.pack_uint32(obj), data)

    def test_pack_float(self):
        # [arrange]
        obj, data = self._arrange_test_case(6)

        # [assert]
        self.assertEqual(DataPackingCore.pack_float(obj), data)

    def test_pack_str_1(self):
        # [arrange]
        obj, data = self._arrange_test_case(7)

        # [assert]
        self.assertEqual(DataPackingCore.pack_str8(obj), data)

    def test_pack_str_2(self):
        # [arrange]
        obj, data = self._arrange_test_case(8)

        # [assert]
        self.assertEqual(DataPackingCore.pack_str8(obj), data)

    def test_pack_str_3(self):
        # [arrange]
        obj, data = self._arrange_test_case(9)

        # [assert]
        self.assertEqual(DataPackingCore.pack_str8(obj), data)


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

    def test_unpack_uint32_1(self):
        # [arrange]
        obj, data = self._arrange_test_case(3)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_uint32(data), obj)

    def test_unpack_uint32_2(self):
        # [arrange]
        obj, data = self._arrange_test_case(4)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_uint32(data), obj)

    def test_unpack_uint32_3(self):
        # [arrange]
        obj, data = self._arrange_test_case(5)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_uint32(data), obj)

    def test_unpack_float(self):
        # [arrange]
        obj, data = self._arrange_test_case(6)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_float(data), obj)

    def test_unpack_str_1(self):
        # [arrange]
        obj, data = self._arrange_test_case(7)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_str8(data), obj)

    def test_unpack_str_2(self):
        # [arrange]
        obj, data = self._arrange_test_case(8)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_str8(data), obj)

    def test_unpack_str_3(self):
        # [arrange]
        obj, data = self._arrange_test_case(9)

        # [assert]
        self.assertEqual(DataUnpackingCore.unpack_str8(data), obj)


class TestDataPackValidation(unittest.TestCase):

    def test_generic_dispatch_matches_vectors(self):
        for name, obj, data in single_test_vectors:
            with self.subTest(name=name, value=obj):
                self.assertEqual(DataPackingCore.pack(obj), data)
                restored = DataUnpackingCore.unpack(data)
                self.assertEqual(restored, obj)
                self.assertIs(type(restored), type(obj))

    def test_uint32_zero(self):
        data = [b"\xce\x00\x00\x00\x00"]
        self.assertEqual(DataPackingCore.pack_uint32(0), data)
        self.assertEqual(DataUnpackingCore.unpack_uint32(data), 0)

    def test_uint32_out_of_range(self):
        for value in (-1, 0x100000000):
            with self.subTest(value=value), self.assertRaises(ValueError):
                DataPackingCore.pack_uint32(value)

    def test_wrong_packer_types(self):
        cases = (
            (DataPackingCore.pack_nil, False),
            (DataPackingCore.pack_false, 0),
            (DataPackingCore.pack_true, 1),
            (DataPackingCore.pack_uint32, True),
            (DataPackingCore.pack_uint32, 1.5),
            (DataPackingCore.pack_float, "2.5"),
            (DataPackingCore.pack_str8, b"text"),
        )
        for packer, value in cases:
            with self.subTest(packer=packer.__name__), self.assertRaises(TypeError):
                packer(value)

    def test_unsupported_value_types(self):
        for value in ({}, [], b"bytes"):
            with self.subTest(value=value), self.assertRaises(TypeError):
                DataPackingCore.pack(value)

    def test_float32_precision(self):
        data = [b"\xca\x3d\xcc\xcc\xcd"]
        self.assertEqual(DataPackingCore.pack_float(0.1), data)
        restored = DataUnpackingCore.unpack_float(data)
        self.assertAlmostEqual(restored, 0.1, places=7)
        self.assertEqual(DataPackingCore.pack_float(restored), data)

    def test_float32_special_values(self):
        for value in (float("inf"), float("-inf"), -0.0):
            with self.subTest(value=value):
                data = DataPackingCore.pack_float(value)
                restored = DataUnpackingCore.unpack_float(data)
                self.assertEqual(restored, value)
                self.assertEqual(math.copysign(1, restored), math.copysign(1, value))
        self.assertTrue(math.isnan(
            DataUnpackingCore.unpack_float(DataPackingCore.pack_float(float("nan")))
        ))

    def test_float32_overflow(self):
        with self.assertRaises(OverflowError):
            DataPackingCore.pack_float(1e100)

    def test_str8_utf8_and_empty(self):
        cases = (
            ("", [b"\xd9\x00"]),
            ("\u00e9", [b"\xd9\x02\xc3\xa9"]),
            ("\u00e9" * 127 + "a", [b"\xd9\xff" + b"\xc3\xa9" * 127 + b"a"]),
            ("\x00\n", [b"\xd9\x02\x00\x0a"]),
        )
        for value, data in cases:
            with self.subTest(value=value):
                self.assertEqual(DataPackingCore.pack_str8(value), data)
                self.assertEqual(DataUnpackingCore.unpack_str8(data), value)

    def test_str8_limit_counts_encoded_bytes(self):
        for value in ("a" * 256, "\u00e9" * 128):
            with self.subTest(length=len(value)), self.assertRaises(ValueError):
                DataPackingCore.pack_str8(value)

    def test_rejects_malformed_packets(self):
        packets = (
            b"", b"\x01", b"\xc0\x00", b"\xc2\x00", b"\xc3\x00",
            b"\xce", b"\xce\x00\x01\x02", b"\xce\x00\x01\x02\x03\x04",
            b"\xca", b"\xca\x00\x01\x02", b"\xca\x00\x01\x02\x03\x04",
            b"\xd9", b"\xd9\x02a", b"\xd9\x00a", b"\xd9\x01\xff",
        )
        for packet in packets:
            with self.subTest(packet=packet), self.assertRaises(ValueError):
                DataUnpackingCore.unpack([packet])
        with self.assertRaises(ValueError):
            DataUnpackingCore.unpack([])

    def test_type_specific_decoders_reject_wrong_marker(self):
        decoders = (
            DataUnpackingCore.unpack_nil,
            DataUnpackingCore.unpack_false,
            DataUnpackingCore.unpack_true,
            DataUnpackingCore.unpack_uint32,
            DataUnpackingCore.unpack_float,
            DataUnpackingCore.unpack_str8,
        )
        for decoder in decoders:
            with self.subTest(decoder=decoder.__name__), self.assertRaises(ValueError):
                decoder([b"\x01"])

    def test_unpack_accepts_multiple_byte_chunks(self):
        self.assertEqual(DataUnpackingCore.unpack([b"\xce", b"\x00\x01", b"\x00\x00"]), 0x10000)


if __name__ == '__main__':
    unittest.main()
