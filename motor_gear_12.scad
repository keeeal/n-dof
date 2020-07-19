
use <lib/gears.scad>

$fn = 128;

tol_x = .2;
tol_z = .4;

module motor_gear(teeth) {
    difference() {
        union() {
            simple_gear(12, 5-tol_z, 1024);
            cylinder(8, r=5);
        }
        linear_extrude(10) difference() {
            circle(2.5+tol_x);
            translate([7+tol_x, 0]) square([10, 10], true);
        }
    }
}

motor_gear(12);
