// 
// ArduinoIRMapping 
//
// moves a IR sensor around and builds a map out of the values
// Developed with [embedXcode](http://embedXcode.weebly.com)
// 
// Author	 	Jonas Scharpf
// 				brainelectronics
//
// Date			14.10.15 17:27
// Version		<#version#>
// 
// Copyright	© Jonas Scharpf, 2015
// License		<#license#>
//
// See			ReadMe.txt for references
//

// Core library for code-sense
#if defined(ARDUINO) // Arduino 1.0 and 1.5 specific
#include "Arduino.h"
#else // error
#error Platform not defined
#endif

// Include application, user and local libraries
#include "Servo.h"
#include "ownLib.h"
// Prototypes


// Define variables and constants
//
// Brief	Pins of the servos and IR sensor
// Details	twelve servo objects can be created on most arduino boards
//
uint8_t irSense = A0;
uint8_t statusLED = 13;  // blink LED pin 13
uint8_t horizontalServoPin = 5;
uint8_t verticalServoPin = 6;
uint8_t x = 0;
uint8_t y = 0;

Servo horizontalServo;  // create servo object to control the horizontal servo
Servo verticalServo;    // create servo object to control the vertical servo

//
// Brief	Setup
// Details	Define the pins the servos and sensor are connected to
//
// Add setup code 
void setup()
{
    Serial.begin(9600);
    
    pinMode(irSense, OUTPUT);
    pinMode(statusLED, OUTPUT);
    
    horizontalServo.attach(horizontalServoPin);    // attaches the horizontal servo on horizontalServoPin to the servo object
    verticalServo.attach(verticalServoPin);    // attaches the vertical servo on verticalServoPin to the servo object
    
    horizontalServo.write(0);     // tell servo to go to default position
    verticalServo.write(0);     // tell servo to go to default position
    
    delay(1000);
    
    blink(statusLED, 5, 500);   // tell user working status
}

//
// Brief	readSensor
// Details	read the IR sensor
//
// Add readSensor code
void readSensor()
{
    float irSensorVoltage = analogRead(irSense) * (5.0 / 1023.0);   // read ADC
    float distanceInCM = 306.439 + irSensorVoltage * (-512.611 + irSensorVoltage * ( 382.268 + irSensorVoltage * (-129.893 + irSensorVoltage * 16.2537)));  // convert to distance[cm]
    Serial.print(distanceInCM, 3);  // print the distance to the monitor
    Serial.print(",");
}

//
// Brief	readSensorDummy
// Details	read random dummy values
//
// Add readSensorDummy code
void readSensorDummy()
{
    Serial.println(random(20, 150));  // print the random distance to the monitor
    //Serial.print(",");
}

//
// Brief	moveServos
// Details	read the IR sensor
//
// Add moveServos code
void moveServos(uint8_t x, uint8_t y)
{
    horizontalServo.write(x);     // tell servo to go to position in variable 'x'
    verticalServo.write(y);     // tell servo to go to position in variable 'y'
}

//
// Brief	Loop
// Details	Call blink
//
// Add loop code 
void loop()
{
    for(y=0; y<180; y=y+10)    // repeat while vertical servo has not reached it's max. position
    {
        // sweep from left to right
        for (x = 0; x <= 180; x = x+10)
        {
            // tell the serial monitor the current position of the sensor
            Serial.print("y");
            Serial.print(y);
            Serial.print(",x");
            Serial.print(x);
            Serial.print(":");
            //readSensor();
            readSensorDummy();
            delay(25);  // you should wait 40-50ms until the next measurement
            moveServos(x, y);
            delay(15);  // wait until the servo is there
        }
        Serial.println();  // send "end of line" to monitor
        y = y+10;   // move the IR sensor a little bit up
        
        // sweep back from right to left
        for (x = 180; x > 0; x = x-10) // sweep from right to left
        {
            // tell the serial monitor the current position of the sensor
            Serial.print("y");
            Serial.print(y);
            Serial.print(",x");
            Serial.print(x);
            Serial.print(":");
            //readSensor();
            readSensorDummy();
            delay(25);  // you should wait 40-50ms until the next measurement
            moveServos(x, y);
            delay(15);  // wait until the servo is there
        }
        Serial.println();  // send "end of line" to monitor
    }
    moveServos(0, 0);   // move servos back to start position
    delay(500);    // move it back or just look at the image

    //Serial.println("###");  // send "end of horizontal line" to monitor
}
