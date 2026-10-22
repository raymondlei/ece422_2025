# SerialDataPacket MVC GUI

Requires Python 3.10+ and Tkinter (included with the standard Windows Python
installer). From the workspace root:

```powershell
python -m pip install -r .\python_gui_template\requirements.txt
python -m python_gui_template.controller
```

Running `controller.py` directly also works.

1. Leave the port as `loop://` and click **Connect**. No hardware is required.
2. Select a type, enter a value, and click **Send and receive echo**.
3. Inspect TX/RX hex, packet lengths, the decoded value, and echo verification.
4. Try both bool values, None, uint32 boundaries, float32 `0.1`, and UTF-8 strings.
   Float32 can round the original value; verification compares bytes, not floats.
5. Disconnect before switching to a real port such as `COM4`.

## MVC responsibilities

- **Model** (`model.py`): owns the connection, converts typed input using the
  existing sibling `data_serialization_complete.datapack` implementation, and
  exchanges packets through `serial_data_handler.SerialDataPacket`.
- **View** (`view.py`): Tkinter widgets, input fields, status, and event log.
- **Controller** (`controller.py`): routes actions, runs serial I/O in a single
  worker, and polls results on the Tk thread. Only one request is outstanding.
  Closing waits for the current operation and closes the borrowed serial port.

`SerialDataPacket` demonstrates complete writes, fragmented reads, and
marker-based framing (not newline framing). The wire format supports None
(`C0`), False/True (`C2`/`C3`), uint32 (`CE` plus four big-endian bytes),
float32 (`CA` plus four bytes), and str8 (`D9`, UTF-8 byte count, content).
Strings are limited to 255 encoded bytes, not 255 characters.

Real hardware must echo the binary packet unchanged at **38400 baud, 8N1,
no flow control**, without text or acknowledgements. Use compatible UART voltage
levels, crossed TX/RX, and common ground; never connect RS-232 levels to MCU pins.
Read/write timeouts are one second per serial call, not a whole-operation deadline.
Timeouts, invalid markers, and echo mismatches are logged and disconnect the
port to avoid reusing a potentially misaligned stream. Reconnect before retrying.
Input validation errors are logged without disconnecting.

## Tests

From the workspace root:

```powershell
python -m unittest discover -s .\python_gui_template\test -v
```

The tests use real pySerial loopback, fragmented fake reads, and Tk widgets.
Keep this folder beside `data_serialization_complete`; the codec is reused,
not copied.
