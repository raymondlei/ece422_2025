"""Run the beginner command-line calculator."""

from calculator import calculate


def main() -> None:
    """Ask for two numbers and an operation, then show the result."""
    print("Beginner Calculator")
    print("Available operations: +, -, *, /")

    try:
        first_number = float(input("Enter the first number: "))
        operator = input("Choose an operation (+, -, *, /): ")
        second_number = float(input("Enter the second number: "))
        result = calculate(first_number, operator, second_number)
    except ValueError as error:
        print(f"Error: {error}")
        return

    print(f"Result: {result}")


if __name__ == "__main__":
    main()
