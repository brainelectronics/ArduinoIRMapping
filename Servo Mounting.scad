/*
This is a servo mounting of the side servo, which is going to move the sensor in the y way
Servo dimension:
x=28mm
y=13.5mm

42.0 incl. mounting holes
distance between mounting holes (center) 35
*/

screwHole = 2.0; // mm
servoMounting();

module servoMounting($fn=100)
{
    difference()
    {
        cube([42.0, 25.0+7.5, 4.0], center=false);  // bottom
        #translate([3.5, 7.5+7, 4.0]) rotate([00,0,0]) cylinder(h = 15, d = screwHole, center = true);
        #translate([3.5+22.0, 7.5+7, 4.0]) rotate([00,0,0]) cylinder(h = 15, d = screwHole, center = true);  // mounting hole right
        #translate([3.5+11.0, 7.5+7+11.0, 4.0]) rotate([00,0,0]) cylinder(h = 15, d = screwHole, center = true); // mounting hole back
        #translate([3.5+11.0, 7.5+7-11.0, 4.0]) rotate([00,0,0]) cylinder(h = 15, d = screwHole, center = true); // mounting hole back
        
        #translate([3.5+11.0, 7.5+7, 4.0]) rotate([0,0,0]) cylinder(h = 15, d = 7.5, center = true); // center hole
    }
    
    difference()
    {
        translate([0, 0, 4.0]) cube([7.0, 7.5, 13.5], center=false);    // left holder
        #translate([3.5, 2.0, 13.5/2+4.0]) rotate([90,0,0]) cylinder(h = 15, d = screwHole, center = true);
    }
    
    difference()
    {
        translate([42.0-7.0, 0, 4.0]) cube([7.0, 7.5, 13.5], center=false);    // right holder
        #translate([3.5+35.0, 2.0, 13.5/2+4.0]) rotate([90,0,0]) cylinder(h = 15, d= screwHole, center = true);
    }
            
    
}