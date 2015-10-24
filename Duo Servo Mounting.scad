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
use <Sensor Mounting Arm.scad>;

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
//drawServoArm();

module drawServoArm($fn=100)
{
    translate([-10, -servoHeight+5+0.1-(servoTotalLength-servoLength)/2, 0])
    {   
        //
        servoArm();
    }
}

module duoServoMounting($fn=100)
{
    // the y rotation servo holder (laying at the bottom)
    difference()
    {
        cube([servoTotalLength, servoHeight+(servoTotalLength-servoLength)/2, servoWidth], center=false);   // the servo holder
        fillet(2, servoWidth*2+1);  // rounded corner (0,0)
        translate([0, servoHeight+(servoTotalLength-servoLength)/2, 0]) rotate([0, 0, -90])fillet(2, servoWidth*2+1);  // rounded corner (end, end)
        translate([(servoTotalLength-servoLength)/2, -0.5, -0.5])
        {
            #cube([servoLength, servoHeight+1, servoWidth+1], center=false);  // the servo itself, a little bit larger than it is, to fit in ;)
        }
        translate([servoTotalLength, 0, 0]) rotate([0, 0, 90])fillet(2, servoWidth*2+1);  // rounded corner (0, end)
        translate([servoTotalLength, servoHeight+(servoTotalLength-servoLength)/2, 0]) rotate([0, 0, 180])fillet(2, servoWidth*2+1);  // rounded corner (end, end)
        
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
                #cylinder(h = (servoTotalLength-servoLength)+10, d = screwArm, center = true);    // back hole of the servo
            }
        }
        translate([(servoTotalLength-servoLength)/2+servoRotationDiffLarge, servoHeight+(servoTotalLength-servoLength)/4, servoWidth/2])
        {
            rotate([90,0,0])
            {
                #cylinder(h = (servoTotalLength-servoLength)+10, d = screwArm, center = true);    // back hole of the servo
            }
        }
    }
    
    
    // the x rotation servo holder (standing on top)
    translate([0, (servoHeight+(servoTotalLength-servoLength)/2-servoWidth)/2, servoWidth]) difference()
    {
        cube([servoTotalLength, servoWidth, servoHeight], center=false);  // the servo holder
        translate([0, 0, servoWidth])fillet(2, servoWidth*2+1);  // rounded corner (0,0)
        translate([servoTotalLength, 0, servoWidth]) rotate([0, 0, 90]) fillet(2, servoWidth*2+1);  // rounded corner (end, 0)
        translate([servoTotalLength, servoWidth, servoWidth]) rotate([0, 0, 180]) fillet(2, servoWidth*2+1);  // rounded corner (end, end)
        translate([0, servoWidth, servoWidth]) rotate([0, 0, -90]) fillet(2, servoWidth*2+1);  // rounded corner (0, end)
        
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

// get round corners
module fillet(r, h, $fn=100)
{
    translate([r / 2, r / 2, 0])
    {
        difference()
        {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);
        }
    }
}