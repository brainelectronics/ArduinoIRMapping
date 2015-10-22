/*
This is a xy move servo mounting for two servos (default SG90)

You can edit the servo dimensions below to fit your requirements
Also select the suitable screwHole to fit with your mounting screw. Use about -0.75mm less than the outer diameter of the actual screw to fit straight.


servoRotationDiffLarge+servoRotationDiffSmall != servoLength
*/

/*
   <-Length-->
   .=========.     ----
|O-|      X  |-O|  Width
   '========='     ----
 <----DHole---->
<- total Lenght->

   diff large
          diff small
   <-----><->
      ----o----              -----
   .______X__.                 |
|O-|         |-O|  ------      | 
   |         |     Height    Mounting Height
   |         |       |         |
   '========='     ------    ----
   <-Length-->
<- total Lenght->
*/

servoLength = 28.0; // mm
servoTotalLength = 42.0;    // mm
servoWidth = 13.5;  // mm
servoHeight = 20.0; // mm
servoMountingHeight = 37.0; // mm
servoRotationDiffSmall = 7.0;    // mm
servoRotationDiffLarge = 21.0;  // mm
distanceHole = 35.0;    // distance between center of mounting holes
screwHole = 1.5;    // mm
screwLength = 15.0; // mm
screwArm = 3.0;     // mm

duoServoMounting();

module duoServoMounting($fn=100)
{
    // the y rotation servo holder (laying at the bottom)
    difference()
    {
        cube([servoTotalLength, servoHeight+(servoTotalLength-servoLength)/2, servoWidth], center=false);   // the servo holder
        translate([(servoTotalLength-servoLength)/2, -0.5, -0.5])
        {
            #cube([servoLength, servoHeight+1, servoWidth+1], center=false);  // the servo itself, a little bit larger than it is, to fit in ;)
        }
        
        // holes
        translate([(servoTotalLength-servoLength)/4, screwLength/2, servoWidth/2])
        {
            rotate([90,0,0])
            {
                #cylinder(h = screwLength+1, d = screwHole, center = true);    // mounting hole left
            }
        }
        translate([(servoTotalLength-(servoTotalLength-servoLength)/4), screwLength/2, servoWidth/2])
        {
            rotate([90,0,0])
            {
                #cylinder(h = screwLength+1, d = screwHole, center = true);    // mounting holes right
            }
        }
        translate([(servoTotalLength-servoLength)/2+servoRotationDiffSmall, servoHeight+(servoTotalLength-servoLength)/4, servoWidth/2])
        {
            rotate([90,0,0])
            {
                #cylinder(h = (servoTotalLength-servoLength)+1, d = screwArm, center = true);    // back hole of the servo
            }
        }
        translate([(servoTotalLength-servoLength)/2+servoRotationDiffLarge, servoHeight+(servoTotalLength-servoLength)/4, servoWidth/2])
        {
            rotate([90,0,0])
            {
                #cylinder(h = (servoTotalLength-servoLength)+1, d = screwArm, center = true);    // back hole of the servo
            }
        }
    }
    
    // the x rotation servo holder (standing on top)
    translate([0, (servoHeight+(servoTotalLength-servoLength)/2)/4, servoWidth]) difference()
    {
        cube([servoTotalLength, servoWidth, servoHeight], center=false);  // the servo holder
        
        translate([(servoTotalLength-servoLength)/2, -0.5, -0.5])
        {
            #cube([servoLength, servoWidth+1, servoHeight+1], center=false);  // the servo itself, a little bit larger than it is, to fit in ;)
        }
        
        // holes
        translate([(servoTotalLength-servoLength)/4, servoWidth/2, servoHeight-screwLength/2])
        {
            #cylinder(h = screwLength+1, d = screwHole, center = true);    // mounting holes right
        }
        translate([servoTotalLength-(servoTotalLength-servoLength)/4, servoWidth/2, servoHeight-screwLength/2])
        {
            #cylinder(h = screwLength+1, d = screwHole, center = true);    // mounting holes right
        }
    }
}