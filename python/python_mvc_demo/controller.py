import tkinter as tk
from model import CounterModel
from view import CounterView

class CounterModel:
    def __init__(self):
        self._value = 0

    def get_value(self):
        return self._value

    def increment(self):
        self._value += 1

    def decrement(self):
        self._value -= 1
        
class CounterController:
    def __init__(self, root):
        self.model = CounterModel()
        self.view = CounterView(root, self)
        self.update_view()

    def increment(self):
        self.model.increment()
        self.update_view()

    def decrement(self):
        self.model.decrement()
        self.update_view()

    def update_view(self):
        value = self.model.get_value()
        self.view.update_value(value)

def main():
    root = tk.Tk()
    root.title("MVC Counter Example")
    app = CounterController(root)
    root.mainloop()

if __name__ == "__main__":
    main()

