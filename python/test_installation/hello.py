"""A small example of a well-structured Python program."""


def greet_user(name: str) -> str:
	"""Return a greeting for the provided name."""
	return f"Nice to meet you, {name}!"


def add_numbers(first: int, second: int) -> int:
	"""Return the sum of two integers."""
	return first + second


def main() -> None:
	"""Run the greeting and arithmetic examples."""
	print("Hello, Python!")

	name = input("What is your name? ").strip()
	if name:
		print(greet_user(name))
	else:
		print("Nice to meet you!")

	total = add_numbers(2, 3)
	print("2 + 3 =", total)


if __name__ == "__main__":
	main()
