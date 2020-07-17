
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
                chamfered_cylinder(5-tol_z, 14, 14);
                translate([-60, 0, 0]) chamfered_squylinder(5-tol_z, 24);
            }
            translate([0, 0, -15]) hull() {
                chamfered_cylinder(5-tol_z, 14, 14);
                translate([-60, 0, 0]) chamfered_squylinder(5-tol_z, 24);
            }
            translate([-60, 0, -20]) chamfered_squylinder(25-tol_z, 24);
            translate([-60, 0, -20]) squylinder(2, 24);
            translate([-92, -15, -12]) gopro_male(10);
            translate([-92,  15, -12]) gopro_male(10);
        }
        translate([0, 0, -tol_z]) cylinder(10, r=54);
        translate([-60, 0, -tol_z]) cylinder(10, r=11);
        translate([-60, 0, -2]) mirror([0, 0, 1]) nema17_hole(30, [1,2], tol_x);
        translate([0, 0, -40]) cylinder(40, r=7+tol_x);
    }
    for (i = [1:2]) rotate([0, 0, i*360/3]) {
        difference() {
            union() {
                translate([0, 0, -5]) hull() {
                    chamfered_cylinder(5-tol_z, 14, 14);
                    translate([-60, 0, 0]) scale([.5, 1, 1])
                    chamfered_squylinder(5-tol_z, 24);
                }
                translate([0, 0, -15]) hull() {
                    chamfered_cylinder(5-tol_z, 14, 14);
                    translate([-60, 0, 0]) scale([.5, 1, 1])
                    chamfered_squylinder(5-tol_z, 24);
                }
                translate([-60, 0, -20]) scale([.5, 1, 1])
                chamfered_squylinder(25-tol_z, 24);
            }
            translate([0, 0, -tol_z]) cylinder(10, r=54);
            translate([0, 0, -40]) cylinder(40, r=7+tol_x);
        }
        translate([-80, -15, -12.15]) gopro_male(10);
        translate([-80,  15, -12.15]) gopro_male(10);
    }
}

module female() {
    simple_gear(72, 5-tol_z, -1024);
    translate([0, 0, -10]) chamfered_cylinder(5-tol_z, 16, 16);
    translate([0, 0, -20]) chamfered_cylinder(5-tol_z, 16, 16);
    translate([0, 0, -20]) cylinder(24, r=7);
    translate([-15, 0, 5-tol_z+9]) rotate([0, 90, 90]) gopro_female(1.5, base=true);
    translate([ 15, 0, 5-tol_z+9]) rotate([0, 90, 90]) gopro_female(1.5, base=true);
}

module motor_gear() {
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

//translate([-60, 0, -2]) mirror([0, 0, 1]) nema17();
//translate([-60, 0, 0]) rotate([0, 0, 360/24])
//motor_gear();

male();
female();