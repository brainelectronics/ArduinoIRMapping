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

try:
	port = serial.Serial("/dev/tty.usbmodem621", 9600, timeout=3.0)
except Exception as e:
	# something strange happend, show the user the problem
	print("Unbekanntes Problem:", e)
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

	try:
		lineRead = str(port.readline())#[2:-6]
		print ("complete line: " + lineRead)	# show everything read at the monitor
	except Exception as e:
		# something strange happend, show the user the problem
		print("Unbekanntes Problem:", e)
	#finally:
	#	pygame.quit()
	#	sys.exit()
	
	if len(lineRead) >= 7 and ":" in lineRead:	# check that it contains min x0,y0:0
		sepData = ":"	# seperator between the position and distances
		sepPos = ","	# seperator between the positions

		seperatedString = lineRead.split(sepData, 1)	# split the string into position and value

		positionsRead = seperatedString[0]	# the position part of the read string
		distanceRead =  int(seperatedString[1])	# the value part of the read string

		#print("positions: " + seperatedString[0])
		#print("distances: " + seperatedString[1])

		if ("," and "x" and "y") in positionsRead and (len(positionsRead)>=5):
			pos = positionsRead.split(sepPos, 1)	# split posiion
			posY = int(pos[0][1:])	# y part of the position
			posX = int(pos[1][1:])	# x part of the position
			#print("x: " + pos[0])
			#print("y: " + pos[1])
			# draw circle at the provided position in the gray scale
			# e.g. (255, 255, 255)[white] is 255 or more cm away
			# e.g. (20, 20, 20) [almost black] is about 20 cm away
			pygame.draw.circle(
				DISPLAYSURF, (distanceRead, distanceRead, distanceRead), 
				(posX+110, displayHeight-posY-60), 5, 0)
		else:
			pass
	else:	# the line read does not contain the correct/full information
		pass

	pygame.display.update()

