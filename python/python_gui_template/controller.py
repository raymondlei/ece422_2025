"""Run with python -m python_gui_template.controller from the workspace root."""

import sys
import tkinter as tk
from concurrent.futures import Future, ThreadPoolExecutor
from pathlib import Path
from typing import Callable

import serial

if __name__ == "__main__" and not __package__:
    sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
    __package__ = "python_gui_template"

from .model import ExchangeResult, SerialModel
from .view import SerialView


class SerialController:
    def __init__(self, root: tk.Tk) -> None:
        self.root = root
        self.model = SerialModel()
        self.view = SerialView(root, self)
        self.executor = ThreadPoolExecutor(max_workers=1)
        self.pending: Future[ExchangeResult | None] | None = None
        self.operation = ""
        self.closing = False
        root.protocol("WM_DELETE_WINDOW", self.close)
        self.refresh("Disconnected - connect to loop:// to begin.")

    def refresh(self, status: str) -> None:
        self.view.set_state(
            self.model.port is not None, self.pending is not None, status
        )

    def start(
        self, operation: str, action: Callable[[], ExchangeResult | None]
    ) -> None:
        if self.pending is not None or self.closing:
            return
        self.operation = operation
        self.pending = self.executor.submit(action)
        self.refresh(f"{operation}...")
        self.root.after(40, self.poll)

    def connect(self) -> None:
        address = self.view.address.get()
        self.start("Connect", lambda: self.model.connect(address))

    def disconnect(self) -> None:
        self.start("Disconnect", self.model.disconnect)

    def send(self) -> None:
        if self.pending is not None or self.closing:
            return
        try:
            payload = self.model.prepare_packet(self.view.value_type.get(), self.view.value.get())
        except (ValueError, TypeError, OverflowError) as error:
            self.report_error(error)
            return
        self.view.append_log(f"TX ({len(payload)} bytes): {payload.hex(' ')}")
        self.start("Echo", lambda: self.model.exchange(payload))

    def poll(self) -> None:
        pending = self.pending
        if pending is None:
            return
        if not pending.done():
            self.root.after(40, self.poll)
            return
        self.pending = None
        try:
            result = pending.result()
        except (serial.SerialException, OSError, ValueError, TypeError, OverflowError) as error:
            self.report_error(error)
        else:
            if result is not None:
                self.view.append_log(
                    f"RX ({len(result.received)} bytes): {result.received.hex(' ')}\n"
                    f"Decoded: {result.value!r} ({type(result.value).__name__})\n"
                    "Echo verified byte-for-byte."
                )
            self.view.append_log(f"{self.operation} complete.")
            self.refresh(f"{self.operation} complete.")
        if self.closing:
            self.close()

    def report_error(self, error: Exception) -> None:
        self.view.append_log(f"ERROR: {error}")
        self.refresh(f"Error: {error}")

    def close(self) -> None:
        self.closing = True
        if self.pending is not None:
            self.refresh("Closing after the current serial operation finishes...")
            return
        try:
            self.model.disconnect()
        except (serial.SerialException, OSError) as error:
            self.closing = False
            self.report_error(error)
            return
        self.executor.shutdown(wait=True)
        self.root.destroy()


def main() -> None:
    root = tk.Tk()
    root.title("SerialDataPacket - MVC Echo Demo")
    SerialController(root)
    root.mainloop()


if __name__ == "__main__":
    main()
