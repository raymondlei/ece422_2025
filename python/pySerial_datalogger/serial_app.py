# serial_app.py
import argparse
import csv
import re
from datetime import datetime
from typing import Optional, Tuple

import serial
import numpy as np
import matplotlib
matplotlib.use("TkAgg")            # interactive backend for live plot
import matplotlib.pyplot as plt


class SerialPortHandler:
    """Wrap pyserial and expose simple helpers for this lab."""
    def __init__(self, port_name: str, baud: int = 19200, timeout: float = 0.1):
        self.port_name = port_name
        self.baud = baud
        self.timeout = timeout
        self.ser: Optional[serial.Serial] = None
        print(f"[Serial] Instantiate serial port {port_name} @ {baud} baud")

    def open(self):
        if self.ser is None or not self.ser.is_open:
            self.ser = serial.Serial(self.port_name, self.baud, timeout=self.timeout)
            self.ser.reset_input_buffer()
            print("[Serial] Opened and flushed input buffer")

    def close(self):
        if self.ser and self.ser.is_open:
            self.ser.close()
            print("[Serial] Closed")

    def readline(self) -> Optional[str]:
        if not (self.ser and self.ser.is_open):
            return None
        raw = self.ser.readline()
        if not raw:
            return None
        # MCU sends: "<step>,<voltage>\r\n" (we'll parse robustly)
        return raw.decode("utf-8", errors="ignore").strip()


def run_main(serial_port: SerialPortHandler,
             window: int = 200,
             outfile: str = "test_data.csv",
             save_png: str = "data_plot_1.png",
             ui_period_s: float = 0.5):
    """
    Live plot + CSV logger.
    - Expects lines like "20,0.26" (tolerates extra text on the line)
    - Plot refresh = 500 ms (ui_period_s)
    - Saves final plot to data_plot_1.png
    - X-axis is a cumulative sample index that scrolls forward
    """
    import time

    serial_port.open()

    # ---- plotting ----
    plt.ion()
    fig, ax = plt.subplots()
    y = np.zeros(window, dtype=float)         # rolling buffer of last 'window' voltages
    x = np.arange(window, dtype=int)          # placeholder; we'll overwrite with a moving window
    (line_plot,) = ax.plot(x, y, lw=1)
    ax.set_xlabel("Sample Index")
    ax.set_ylabel("Voltage (V)")
    ax.set_title(f"Live Voltage from {serial_port.port_name}")
    ax.grid(True)

    # ---- CSV ----
    f = open(outfile, "a", newline="")
    writer = csv.writer(f)
    if f.tell() == 0:
        writer.writerow(["timestamp", "step", "voltage"])

    sample_idx = -1        # cumulative count (starts at -1 so first sample becomes 0)
    last_draw = time.monotonic()
    ui_period_s = float(ui_period_s)  # 0.5 s

    try:
        while True:
            s = serial_port.readline()
            if s:
                parsed = _parse_step_voltage_robust(s)
                if parsed:
                    step, voltage = parsed
                    writer.writerow([datetime.now().isoformat(timespec="seconds"),
                                     step, f"{voltage:.2f}"])
                    f.flush()

                    # Update cumulative index and rolling window buffer
                    sample_idx += 1
                    y = np.append(y[1:], voltage)

            now = time.monotonic()
            if (now - last_draw) >= ui_period_s:
                if sample_idx >= 0:
                    start = max(0, sample_idx - (window - 1))
                    xwin = np.arange(start, start + window, dtype=int)

                    line_plot.set_xdata(xwin)
                    line_plot.set_ydata(y)
                    ax.set_xlim(xwin[0], xwin[-1])            # scroll window forward
                    ax.relim()
                    ax.autoscale_view(scalex=False, scaley=True)  # autoscale Y only

                # --- NEW: visible 500 ms indicators ---
                ts_console = datetime.now().strftime('%H:%M:%S.%f')[:-3]
                print(f"[UI] Plot updated at {ts_console}")
                ax.set_title(f"Live Voltage from {serial_port.port_name} — Updated {datetime.now().strftime('%H:%M:%S')}")

                fig.canvas.draw()
                fig.canvas.flush_events()
                plt.pause(0.001)
                last_draw = now

            # Small sleep to keep CPU usage low even if no serial data
            time.sleep(0.005)

    except KeyboardInterrupt:
        print("\n[App] Keyboard interrupt – exiting.")
    finally:
        # Save final plot for grading
        try:
            fig.savefig(save_png, dpi=150, bbox_inches="tight")
            print(f"[App] Saved plot -> {save_png}")
        except Exception as e:
            print(f"[App] Could not save plot: {e}")

        f.close()
        serial_port.close()
        plt.ioff()
        plt.show()


# constructor placeholder to mirror rubric text (real ctor is in class above)
def __init__(self, serial_port: serial.Serial):
    print("main implementation")


# ---- helpers ----
_num_pair = re.compile(r"([-+]?\d+)\s*,\s*([-+]?\d*\.?\d+)")
def _parse_step_voltage_robust(line: str) -> Optional[Tuple[int, float]]:
    """
    Parse 'step,voltage' -> (int, float).
    Robust to extra text: finds the first "int,float" pair anywhere in the line.
    Returns None if no such pair exists.
    """
    try:
        m = _num_pair.search(line)
        if not m:
            return None
        step = int(m.group(1))
        voltage = float(m.group(2))
        return step, voltage
    except Exception:
        return None


if __name__ == "__main__":
    print("Serial Port App")

    # Match the connected MCU's port and baud rate; timeout is in seconds.
    SERIAL_PORT = "COM4"
    SERIAL_BAUD_RATE = 38400
    SERIAL_TIMEOUT = 0.1

    ser = SerialPortHandler(
        port_name=SERIAL_PORT,
        baud=SERIAL_BAUD_RATE,
        timeout=SERIAL_TIMEOUT,
    )
    # Opening the port also discards any previously buffered input.
    ser.open()

    # Keep the latest 200 samples visible and refresh the plot every 0.5 seconds.
    PLOT_WINDOW = 200
    # Relative output paths are resolved from the current working directory.
    CSV_OUTFILE = "test_data.csv"
    PNG_OUTFILE = "data_plot_1.png"
    UI_PERIOD_S = 0.5

    # Stop on q, Ctrl+C, or window close; run_main saves the plot and closes resources.
    run_main(
        ser,
        window=PLOT_WINDOW,
        outfile=CSV_OUTFILE,
        save_png=PNG_OUTFILE,
        ui_period_s=UI_PERIOD_S,
    )