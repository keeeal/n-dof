
use <lib/shapes.scad>
use <lib/gears.scad>
use <lib/nema17.scad>
use <lib/gopro.scad>

$fn = 128;

tol_x = .2;
tol_z = .4;

module male() {
    difference() {
        union() {
            translate([0, 0, -5]) hull() {
                chamfered_cylinder(5-tol_z, 20, 20);
                translate([-47, 0, 0]) chamfered_cylinder(5-tol_z, 10, 10);
            }
            translate([0, 0, -15]) hull() {
                chamfered_cylinder(5-tol_z, 20, 20);
                translate([-47, 0, 0]) chamfered_cylinder(5-tol_z, 10, 10);
            }
            translate([-43, 0, -20]) rotate([0, 0, 45]) {
                 chamfered_squylinder(25-tol_z, 24);
                 squylinder(2, 24);
            }
            translate([-43, 0, 0]) rotate([0, 0,-45]) { 
                translate([-32,-15,-3.25]) gopro_male(20);
                translate([-32, 15,-3.25]) gopro_male(20);
            }
            translate([-43, 0, 0]) rotate([0, 0, 45]) { 
                translate([-32,-15,-3.25]) gopro_male(20);
                translate([-32, 15,-3.25]) gopro_male(20);
            }
        }
        translate([0, 0, -tol_z]) cylinder(10, r=36.5);
        translate([-43, 0, -tol_z]) cylinder(10, r=11);
        translate([-43, 0, -2]) mirror([0, 0, 1])
        rotate([0, 0, 45]) nema17_hole(20, [0,1,2]);
        translate([0, 0, -40]) cylinder(40, r=7+tol_x);
    }
}

module female() {
    simple_gear(48, 5-tol_z, -1024);
    translate([0, 0, 0]) hull() {
        chamfered_cylinder(5-tol_z, 24, 24);
        translate([34, 0, 0]) scale([.5, 1, 1])
        chamfered_squylinder(5-tol_z, 24);
    }
    translate([0, 0, -10]) hull() {
        chamfered_cylinder(5-tol_z, 7, 7);
        translate([34, 0, 0]) scale([.5, 1, 1])
        chamfered_squylinder(5-tol_z, 24);
    }
    translate([0, 0, -20]) hull() {
        chamfered_cylinder(5-tol_z, 7, 7);
        translate([34, 0, 0]) scale([.5, 1, 1])
        chamfered_squylinder(5-tol_z, 24);
    }
    translate([34, 0, -20]) scale([.5, 1, 1])
    chamfered_squylinder(25-tol_z, 24);
    translate([0, 0, -20]) chamfered_cylinder(24, 7, 7);
    translate([54,-15,-3.25]) rotate([180, 0, 180]) gopro_female(10);
    translate([54, 15,-3.25]) rotate([180, 0, 180]) gopro_female(10);
}

//translate([-43, 0, -2]) mirror([0, 0, 1]) rotate([0, 0, 45]) nema17();
//translate([-43, 0, 0])
//rotate([0, 0, 360/24])
//motor_gear();

male();
female();
