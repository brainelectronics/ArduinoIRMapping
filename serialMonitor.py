import serial
import time

repeatLoop = True
port = serial.Serial("/dev/tty.usbmodem621", 9600, timeout=3.0)
while repeatLoop:
	lineRead = str(port.readline())#[2:-6]
	print ("complete line: " + lineRead)	# read everything important to the monitor
	
	if ":" in lineRead:
		sepData = ":"	# seperator between the position and distances
		sepPos = ","	# seperator between the positions

		seperatedString = lineRead.split(sepData, 1)

		positionsRead = seperatedString[0]
		distancesRead =  seperatedString[1]

		print("positions: " + seperatedString[0])
		print("distances: " + seperatedString[1])

		if "," and "x" and "y" in positionsRead:
			pos = positionsRead.split(sepPos, 1)
			posX = int(pos[0][1:])
			posY = int(pos[1][1:])
			print(posX)
			print(posY)
		else:
			pass
	else:
		pass
		
	print()

	#if "###" in lineRead:
	#	print("Detected end of measurement and will close monitor")
	#	repeatLoop = False
port.close()