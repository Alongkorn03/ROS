from sensor_msgs.msg import Joy
from pyfirmata import Arduino , util
import time

def blink():
    board.digital[13].write(1)
    time.sleep(.5)
    board.digital[13].write(0)
    time.sleep(.5)

board = Arduino('/dev/ttyUSB0')
while(1):
    blink

