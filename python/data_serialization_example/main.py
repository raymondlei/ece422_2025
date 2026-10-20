"""Boolean round-trip example using the local datapack implementation."""

from datapack.pack import DataPackingCore
from datapack.unpack import DataUnpackingCore


def main():
	value = True

	packed_value = DataPackingCore.pack_true(value)
	restored_value = DataUnpackingCore.unpack_true(packed_value)

	print("Original:", value)
	print("Packed:", packed_value)
	print("Unpacked:", restored_value)
	assert restored_value == value


if __name__ == "__main__":
	main()
