//
// File			ownLib.h
// Brief		Library header
//
// Project	 	ArduinoIRMapping
// Developed with [embedXcode](http://embedXcode.weebly.com)
//
// Author		Jonas Scharpf
// 				brainelectronics
// Date			15.10.15 19:47
// Version		<#version#>
//
// Copyright	© Jonas Scharpf, 2015
// License		<#license#>
//
// See			ReadMe.txt for references
//

// Core library - IDE-based
#if defined(ARDUINO) // Arduino 1.0 and 1.5 specific
#include "Arduino.h"
#else // error
#error Platform not defined
#endif // end IDE

#ifndef __ArduinoIRMapping__ownLib__
#define __ArduinoIRMapping__ownLib__

//
// Brief	Blink a LED
// Details	LED attached to pin is light on then light off
// Total cycle duration = ms
// Parameters:
//      pin pin to which the LED is attached
//      times number of times
//      ms cycle duration in ms
//
void blink(uint8_t pin, uint8_t times, uint16_t ms);

#endif
