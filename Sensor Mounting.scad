/*
This is a mounting adaptor for the Sharp IR Sensor and the Servo Arm
*/

adaptor();

module adaptor($fn=100)
{
    difference()
    {
        cube([44.5, 9.0, 9.0], center = false);
        translate([(44.5-37.0)/2, 4.5, 4.5]) rotate([90, 0, 0])#cylinder(h = 15, d = 3.2, center = true);   // left sensor
        translate([(44.5-37.0)/2+37.0, 4.5, 4.5]) rotate([90, 0, 0])#cylinder(h = 15, d = 3.2, center = true);  // right sensor
        
        translate([(44.5-27.0)/2, 4.5, 4.5]) rotate([0, 0, 0])#cylinder(h = 15, d = 3.2, center = true);  // left servo
        translate([(44.5-27.0)/2+27.0, 4.5, 4.5]) rotate([0, 0, 0])#cylinder(h = 15, d = 3.2, center = true);  // right servo
    }
}