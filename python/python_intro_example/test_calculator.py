import unittest
from unittest.mock import patch

from calculator import calculate
from main import main


class TestCalculate(unittest.TestCase):
    def test_addition(self):
        self.assertEqual(calculate(3, "+", 2), 5)

    def test_subtraction(self):
        self.assertEqual(calculate(3, "-", 2), 1)

    def test_multiplication(self):
        self.assertEqual(calculate(3, "*", 2), 6)

    def test_division(self):
        self.assertEqual(calculate(6, "/", 2), 3)

    def test_division_by_zero_raises_error(self):
        with self.assertRaises(ValueError):
            calculate(6, "/", 0)

    def test_unsupported_operator_raises_error(self):
        with self.assertRaises(ValueError):
            calculate(3, "%", 2)

if __name__ == "__main__":
    unittest.main()
