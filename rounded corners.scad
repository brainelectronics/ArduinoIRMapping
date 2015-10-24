fillet(2, 20);

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