#/bin/python2
#/usr/local/lib/python2.7/dist-packages
import RPi.GPIO as GPIO
import time
#use Broadcom GPIO references
GPIO.setmode(GPIO.BCM)

def RCtime (PiPin):
  measurement = 0
  # Discharge capacitor
  GPIO.setup(PiPin, GPIO.OUT)
  GPIO.output(PiPin, GPIO.LOW)
  time.sleep(0.1)

  GPIO.setup(PiPin, GPIO.IN)
  # Count loops until voltage across
  # capacitor reads high on GPIO
  while (GPIO.input(PiPin) == GPIO.LOW):
    measurement += 1

  return measurement

GPIO.setup(17,GPIO.IN)
input = GPIO.input(17)
print ("starting loop")
while True:
#  print RCtime(4)
  if(0):
    GPIO.input(17)
    print ("ON")
    time.sleep(0.1)
    print(".")

GPIO.cleanup()

