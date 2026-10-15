# Beginner Python Calculator

A small command-line calculator demonstrating a few useful Python basics:

- Separating arithmetic, command-line interaction, and tests into three Python files
- Keeping command-line interaction separate from reusable arithmetic logic
- Using functions, imports, and type hints
- Handling invalid input and errors
- Testing with Python's built-in `unittest` library

## Project structure

```text
.
├── calculator.py
├── main.py
├── test_calculator.py
└── README.md
```

`calculator.py` contains the arithmetic logic, while `main.py` handles user
input and output. `test_calculator.py` contains six arithmetic tests covering
addition, subtraction, multiplication, division, division by zero, and
unsupported operators. The interactive CLI is not currently covered by tests.

The calculator accepts two numbers and one of `+`, `-`, `*`, or `/`, then prints
the result. Invalid numeric input, division by zero, and unsupported operators
produce an `Error:` message instead of a result.

## Run the calculator

From this folder, run:

```text
python main.py
```

No package installation or third-party dependencies are required.

## Run the tests

From this folder, run:

```text
python -m unittest test_calculator
```

To select the arithmetic test class explicitly (the same six tests):

```text
python -m unittest test_calculator.TestCalculate
```

From the parent workspace folder, use discovery with an explicit project root:

```text
python -m unittest discover -s python_intro_example -t python_intro_example -p test_calculator.py
```

You can also run `python test_calculator.py` from this folder. No manual
`sys.path` changes are needed; the discovery top-level directory (`-t`) makes
the project's modules importable when running discovery from the workspace.
Each command above runs the same six tests.

### Use VS Code without project settings

Use **File > Open Folder** to open `python_intro_example` itself, rather than
the parent folder containing unrelated Python examples.

Select an installed Python interpreter with **Python: Select Interpreter**.
To reuse the existing parent virtual environment, choose **Enter interpreter
path** and select `..\.venv\Scripts\python.exe` (the `.venv` folder beside
`python_intro_example`).

Open **Terminal > New Terminal** and run the commands above from the project
folder. No project settings file, package installation, or `PYTHONPATH`
override is required. To run the calculator, you can also open `main.py` and
click **Run Python File in Terminal** in the editor's upper-right corner.

The **Testing** panel is optional. Configuring it with **Python: Configure
Tests**, **unittest**, the project root (`.`), and `test_*.py` may create a new
`.vscode/settings.json`. Use terminal commands if you want to avoid that file.
