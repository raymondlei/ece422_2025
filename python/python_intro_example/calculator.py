"""Basic arithmetic operations for the beginner calculator example."""


def calculate(first_number: float, operator: str, second_number: float) -> float:
    """Return the result of applying an operator to two numbers."""
    if operator == "+":
        return first_number + second_number
    if operator == "-":
        return first_number - second_number
    if operator == "*":
        return first_number * second_number
    if operator == "/":
        if second_number == 0:
            raise ValueError("You cannot divide by zero.")
        return first_number / second_number

    raise ValueError(f"Unsupported operator: {operator}")
