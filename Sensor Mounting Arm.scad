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

servoArm();

module servoArm($fn=100)
{
    // mounting at the servo arm
    difference()
    {
        cube([10+(servoTotalLength-servoLength)+servoRotationDiffSmall, 5, servoWidth], center=false);
        fillet(2, servoWidth*2+1);
        translate([10+(servoTotalLength-servoLength)+servoRotationDiffSmall, 0, 0]) rotate([0, 0, 90])fillet(2, servoWidth*2+1);
        translate([10+(servoTotalLength-servoLength)+servoRotationDiffSmall, 5, 0]) rotate([0, 0, 180])fillet(2, servoWidth*2+1);
    }
    
    // sensor mounting 
    translate([0, 5, 0])
    {
        difference()
        {
            cube([5, (servoTotalLength-servoLength)/2+servoMountingHeight, servoWidth], center=false);
            //translate([0, servoMountingHeight+12, 0]) rotate([0, 0, -90])fillet(2, servoWidth*2+1);
        }
    }
            
    difference()
    {
        // mounting at the back of the servo
        translate([0, 5+(servoTotalLength-servoLength)/2+servoMountingHeight, 0]) cube([10+(servoTotalLength-servoLength)+servoRotationDiffSmall, 5, servoWidth], center=false);
        translate([10+(servoTotalLength-servoLength)+servoRotationDiffSmall, servoMountingHeight+12, 0]) rotate([0, 0, 90])fillet(2, servoWidth*2+1);
        translate([10+(servoTotalLength-servoLength)+servoRotationDiffSmall, servoMountingHeight+12+5, 0]) rotate([0, 0, 180])fillet(2, servoWidth*2+1);
        translate([0, servoMountingHeight+12+5, 0]) rotate([0, 0, -90])fillet(2, servoWidth*2+1);
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