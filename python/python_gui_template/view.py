"""Tk widgets only; packet and connection logic live in the model."""

import tkinter as tk
from tkinter import scrolledtext, ttk
from typing import TYPE_CHECKING

from .model import VALUE_TYPES

if TYPE_CHECKING:
    from .controller import SerialController


class SerialView(ttk.Frame):
    def __init__(self, master: tk.Tk, controller: "SerialController") -> None:
        super().__init__(master, padding=12)
        self.pack(fill=tk.BOTH, expand=True)
        self.columnconfigure(1, weight=1)
        self.rowconfigure(6, weight=1)

        self.address = tk.StringVar(value="loop://")
        self.value_type = tk.StringVar(value="uint32")
        self.value = tk.StringVar(value="65536")
        self.status = tk.StringVar(value="Disconnected")
        ttk.Label(self, text="Serial port / URL").grid(row=0, column=0, sticky="w")
        
        self.port_entry = ttk.Entry(self, textvariable=self.address)
        self.port_entry.grid(row=0, column=1, sticky="ew", padx=8)

        self.connect_button = ttk.Button(self, text="Connect", command=controller.connect)
        self.connect_button.grid(row=0, column=2)

        self.disconnect_button = ttk.Button(self, text="Disconnect", command=controller.disconnect)
        self.disconnect_button.grid(row=0, column=3, padx=(8, 0))
        ttk.Label(self, text="38400 baud, 8N1 | loop:// needs no hardware; real devices must echo bytes.")\
            .grid(row=1, column=0, columnspan=4, sticky="w", pady=8)
        ttk.Label(self, text="Value type").grid(row=2, column=0, sticky="w")

        self.type_box = ttk.Combobox(self, textvariable=self.value_type, values=VALUE_TYPES, state="readonly")
        self.type_box.grid(row=2, column=1, sticky="ew", padx=8)
        self.type_box.bind("<<ComboboxSelected>>", self.select_type)

        ttk.Label(self, text="Value").grid(row=3, column=0, sticky="w", pady=8)

        self.value_entry = ttk.Entry(self, textvariable=self.value)
        self.value_entry.grid(row=3, column=1, sticky="ew", padx=8)
        self.send_button = ttk.Button(self, text="Send and receive echo", command=controller.send)
        self.send_button.grid(row=3, column=2, columnspan=2)

        ttk.Label(self,text="bool: true/false | uint32: 0..4294967295 (or 0x...) | str8: <=255 UTF-8 bytes",)\
            .grid(row=4, column=0, columnspan=4, sticky="w")
        ttk.Label(self, textvariable=self.status)\
            .grid(row=5, column=0, columnspan=4, sticky="w", pady=8)
        
        self.log = scrolledtext.ScrolledText(self, width=85, height=16, state="disabled", wrap=tk.WORD)
        self.log.grid(row=6, column=0, columnspan=4, sticky="nsew")

        ttk.Button(self, text="Clear log", command=self.clear_log)\
            .grid(row=7, column=3, sticky="e", pady=(8, 0))

    def select_type(self, _event: object = None) -> None:
        examples = {
            "None": "", "bool": "true", "uint32": "65536",
            "float32": "0.1", "str8": "MCU ready",
        }
        self.value.set(examples[self.value_type.get()])

    def set_state(self, connected: bool, busy: bool, status: str) -> None:
        self.status.set(status)
        self.connect_button.configure(state="disabled" if busy or connected else "normal")
        self.disconnect_button.configure(state="normal" if connected and not busy else "disabled")
        self.send_button.configure(state="normal" if connected and not busy else "disabled")
        self.port_entry.configure(state="disabled" if busy or connected else "normal")
        self.type_box.configure(state="disabled" if busy else "readonly")
        self.value_entry.configure(state="disabled" if busy else "normal")

    def append_log(self, message: str) -> None:
        self.log.configure(state="normal")
        self.log.insert(tk.END, message + "\n")
        self.log.see(tk.END)
        self.log.configure(state="disabled")

    def clear_log(self) -> None:
        self.log.configure(state="normal")
        self.log.delete("1.0", tk.END)
        self.log.configure(state="disabled")
