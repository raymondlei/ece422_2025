class Counter:
    prescaler: int
    top: int
    match: int
    mode: str
    step_size: int
    count: int
    current_step_size: int

    def __init__(self) -> None:
        self.prescaler = 1
        self.mode = "up_counting"
        self.match = 0
        self.top = 0
        self.step_size = 1
        self.count = 0
        self.current_step_size = self.step_size

    def inc(self):
        self.count += 1
        if self.count >= self.top:
            self.count = 0

    def dec(self):
        if self.count - 1 < 0:
            self.count = self.top

        self.count -= 1
    
    def dual_slope(self):
        if self.current_step_size > 0:
            if self.count + self.current_step_size > self.top:
                self.current_step_size *= -1  ## change to negative step size

            self.count += self.current_step_size
        else:
            if self.count < -self.current_step_size:
                self.current_step_size *= -1  ## change to positive step size
                self.count = 0
            else:
                self.count += self.current_step_size
    
    def run(self):
        if self.mode == "up_counting":
            self.inc()
        if self.mode == "down_counting":
            self.dec()
        if self.mode == "dual_slope":
            self.dual_slope()
