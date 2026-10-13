from codrone_edu.drone import *

drone = Drone()
drone.connect()

# Welcome to Python for Robolink! Write your Python code below.
r = 255
g = 0
b = 0
i = 20
drone.set_drone_LED(r, g, b, i)
drone.set_controller_LED(r, g, b, i)

battery = drone.get_battery()
print("Battery:", battery, "%")

drone.takeoff() # lift to about 80 cm and hover     
drone.hover(3)       # stay there for 3 seconds
drone.land()         # settle down

drone.drone_buzzer(440, 500)  

drone.disconnect()