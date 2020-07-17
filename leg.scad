
use <lib/shapes.scad>
use <lib/gopro.scad>

$fn = 128;

eps = 1e-8;

module hip() {
    translate([3, 0, 0]) rotate([90, 0,-90])
    linear_extrude(eps) hull() {
        square([10, 15.7], true);
        square([15, 9.1], true);
    }
}

module knee() {
    translate([12, 0, 8]) rotate([0,-45, 0])
    rotate([90, 0,-90]) squylinder(eps, 5);
}

module foot() {
    translate([20, 0, 32]) rotate([0,-90, 0])
    rotate([90, 0,-90]) squylinder(eps, 3);
}

module leg() {
    translate([-8.5, 0, 0]) gopro_female(center=true);
    hull() {
        rotate([90, 0,-90]) linear_extrude(eps) square([15, 15.7], true);
        hip();
    }
    hull() {
        hip();
        knee();
    }
    hull() {
        knee();
        foot();
    }
}

translate([8.5, 0, 0])  leg();