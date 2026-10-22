import tkinter as tk

class CounterView(tk.Frame):
    def __init__(self, master, controller):
        super().__init__(master)
        self.controller = controller
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        self.value_label = tk.Label(self, text="0", font=("Arial", 24))
        self.value_label.pack(pady=10)

        self.increment_button = tk.Button(self, text="Increment", command=self.controller.increment)
        self.increment_button.pack(side=tk.LEFT, padx=5)

        self.decrement_button = tk.Button(self, text="Decrement", command=self.controller.decrement)
        self.decrement_button.pack(side=tk.LEFT, padx=5)

    def update_value(self, value):
        self.value_label.config(text=str(value))

