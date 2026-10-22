class CounterModel:
    def __init__(self):
        self._value = 0

    def get_value(self):
        return self._value

    def increment(self):
        self._value += 1

    def decrement(self):
        self._value -= 1

