
  ArduinoIRMapping
  Project
  ----------------------------------
  Developed with embedXcode

  Project ArduinoIRMapping
  Created by Jonas Scharpf on 14.10.15
  Copyright © 2015 brainelectronics
  License <#license#>



  References
  ----------------------------------



  Hardware Setup
  ----------------------------------
  a GP2Y0A02YK0F and two servo motors were used in this code.
  The serovs are connected to PWM Ports D5 (horizontal) and D6 (vertical)
  The GP2Y0A02YK0F Sharp IR sensor is connected to A0
  
  
  
  Software
  ----------------------------------
  The Servo lib has been modified to work correctly with Xcode, WProgram.h is no longer needed. If you just use the .ino file

  You have to wait 40-50ms until you start the next measurement and the result of the measurement can be delayed up to 5ms
  
  If you measure distanced below 20 cm there will be problems caused by a measured value of a larger distance (see datasheet page 5)
  
  please refer to sparkfun
  Distance = 16.2537 * x^4 - 129.893 * x^3 + 382.268 * x^2 - 512.611 * x + 306.439 
  Where x = voltage read on ADC and Distance is in cm.
  or on lower powered maschines d = 306.439 + x * ( -512.611 + x * ( 382.268 + x * (-129.893 + x * 16.2537)))


  embedXcode
  embedXcode+
  ----------------------------------
  Embedded Computing on Xcode
  Copyright © Rei VILO, 2010-2014
  All rights reserved
  http://embedXcode.weebly.com

