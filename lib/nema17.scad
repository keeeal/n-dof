
include <MCAD/stepper.scad>

module nema17() {
    motor(Nema17, NemaShort);
}

module nema17_hole(depth=10, bolts=[1,2,3,4], tol=0) {
    linear_extrude(depth) minkowski() {
        circle(5.6+tol);
        square([31.04, 31.04], true);
    }
    translate([0, 0, -depth])
    cylinder(depth+1, r=2.5+tol);
    for (i = bolts) {
        rotate([0, 0, i*90])
        translate([31.04/2, 31.04/2, -depth])
        cylinder(depth+1, r=1.5+tol);
    }
}