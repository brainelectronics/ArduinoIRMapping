import pygame, sys
import time, serial
from pygame.locals import *
"""
BLACK = (  0,   0,   0)
WHITE = (255, 255, 255)
RED = (255,   0,   0)
GREEN = (  0, 255,   0)
"""
BLUE = (  0,   0, 255)

port = serial.Serial("/dev/tty.usbmodem621", 9600, timeout=3.0)
pygame.init()
displayWidth = 400
displayHeight = 300
DISPLAYSURF = pygame.display.set_mode((displayWidth, displayHeight))
pygame.display.set_caption('IR Sensor Monitor')
#pygame.draw.circle(DISPLAYSURF, (0, 0, 255), (300, 50), 20, 0)

while True: # main game loop
	for event in pygame.event.get():
		if event.type == QUIT:
			pygame.quit()
			sys.exit()
		elif event.type == pygame.KEYDOWN:
			if event.key == pygame.K_ESCAPE:
				pygame.quit()
				sys.exit()

	lineRead = str(port.readline())#[2:-6]
	print ("complete line: " + lineRead)	# read everything important to the monitor
	
	if ":" in lineRead:
		sepData = ":"	# seperator between the position and distances
		sepPos = ","	# seperator between the positions

		seperatedString = lineRead.split(sepData, 1)

		positionsRead = seperatedString[0]
		distanceRead =  int(seperatedString[1])

		#print("positions: " + seperatedString[0])
		#print("distances: " + seperatedString[1])

		if "," and "x" and "y" in positionsRead and (len(positionsRead)>=5):
			pos = positionsRead.split(sepPos, 1)
			posY = int(pos[0][1:])
			posX = int(pos[1][1:])
			#print("x: " + pos[0])
			#print("y: " + pos[1])
			pygame.draw.circle(
				DISPLAYSURF, (distanceRead, distanceRead, distanceRead), 
				(posX+110, displayHeight-posY-60), 5, 0)
		else:
			pass
	else:
		pass

	pygame.display.update()

