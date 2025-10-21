'''
Python Demo code

Demonstrate dual-slope counting

Known bug: double zero when transitioning from down-counting to up-counting
'''

from counter import Counter


if __name__ == '__main__':

    print("Program started")

    ## initialize object
    _counter_inst = Counter()

    ## override values
    _counter_inst.top = 10
    _counter_inst.mode = "down_counting"

    print(_counter_inst.count)  ## output
    for iter in range(30):  ## repeat the process multiple times
        _counter_inst.run()  ## process
        print(_counter_inst.count)  ## output

    print("Program ended")
    