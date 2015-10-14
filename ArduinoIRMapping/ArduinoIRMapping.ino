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
#include "LocalLibrary.h"


// Prototypes


// Define variables and constants
//
// Brief	Name of the LED
// Details	Each board has a LED but connected to a different pin
//
uint8_t myLED;


//
// Brief	Setup
// Details	Define the pin the LED is connected to
//
// Add setup code 
void setup()
{
    myLED = 13;

    pinMode(myLED, OUTPUT);     
}

//
// Brief	Loop
// Details	Call blink
//
// Add loop code 
void loop()
{
    blink(myLED, 3, 333);
    delay(1000);
}
