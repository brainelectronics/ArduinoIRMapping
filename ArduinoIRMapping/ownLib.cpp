//
// ownLib.cpp
// Library C++ code
// ----------------------------------
// Developed with embedXcode
// http://embedXcode.weebly.com
//
// Project 		rotationController
//
// Created by 	Jonas Scharpf, 15.10.15 19:47
// 				brainelectronics
//
// Copyright 	© Jonas Scharpf, 2015
// License 		<#license#>
//
// See 			ownLib.cpp.h and ReadMe.txt for references
//


#include "ownLib.h"

void blink(uint8_t pin, uint8_t times, uint16_t ms) {
    for (uint8_t i=0; i<times; i++) {
        digitalWrite(pin, HIGH);
        delay(ms >> 1);
        digitalWrite(pin, LOW);
        delay(ms >> 1);
    }
}