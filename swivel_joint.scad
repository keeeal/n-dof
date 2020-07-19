
use <lib/shapes.scad>
use <lib/nema17.scad>
use <lib/gopro.scad>

$fn = 128;

tol_x = .2;
tol_z = .4;

module male() {
    difference() {
        translate([0, 0, -20]) union() {
            chamfered_squylinder(20-tol_z, 24);
            squylinder(2, 24);
        }
        translate([0, 0, -2]) mirror([0, 0, 1])
        nema17_hole(30, [1,2,3,4], tol_x);
        translate([0, 0, -15]) {
            rotate([90, 0, 0]) translate([0, 0, -30]) squylinder(60, 12);
            rotate([0, 90, 0]) translate([0, 0, -30]) squylinder(60, 12);
        }
    }
    translate([0, 0, -2]) cylinder(2-tol_z, r=10);
    translate([0,-15, 9]) rotate([0, 90, 0]) gopro_male(1.5+tol_z, base=true);
    translate([0, 15, 9]) rotate([0, 90, 0]) gopro_male(1.5+tol_z, base=true);
}

module female() {
    difference() {
        translate([0, 0, -5]) union() {
            chamfered_squylinder(5-tol_z, 24);
            squylinder(2, 24);
            cylinder(8, r=5);
        }
        translate([0, 0, -6]) linear_extrude(10) difference() {
            circle(2.5+tol_x);
            translate([7+tol_x, 0]) square([10, 10], true);
        }
    }
    translate([0,-15, 9]) rotate([0, 90, 0]) gopro_female(1.5+tol_z, base=true);
    translate([0, 15, 9]) rotate([0, 90, 0]) gopro_female(1.5+tol_z, base=true);
}

male();
//female();
