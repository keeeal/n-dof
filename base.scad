
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
                chamfered_cylinder(5-tol_z, 23.2, 23.2);
                translate([-47, 0, 0]) chamfered_cylinder(5-tol_z, 23.2, 23.2);
            }
            translate([0, 0, -15]) hull() {
                chamfered_cylinder(5-tol_z, 23.2, 23.2);
                translate([-47, 0, 0]) chamfered_cylinder(5-tol_z, 23.2, 23.2);
            }
            translate([-60, 0, -20]) hull() {
                linear_extrude(24-tol_z) superellipse(24, 4);
                linear_extrude(25-tol_z) superellipse(23, 4);
            }
        }
        translate([0, 0, -tol_z]) cylinder(10, r=54);
        translate([-60, 0, -tol_z]) cylinder(10, r=11);
        translate([-60, 0, -2]) mirror([0, 0, 1]) nema17_hole(30, [1,2], tol_x);
        translate([0, 0, -40]) cylinder(40, r=5+tol_x);
    }
    difference() {
        union() {
            translate([-92, -15, -12]) gopro_male(10);
            translate([-92, 15, -12]) gopro_male(10);
        }
        translate([-60, 0, -21]) linear_extrude(26) minkowski() {
            circle(6);
            square([31.04, 31.04], true);
        }
    }
    
    for (i = [1:2]) rotate([0, 0, i*360/3]) {
        difference() {
            union() {
                translate([0, 0, -5]) hull() {
                    chamfered_cylinder(5-tol_z, 23.2, 23.2);
                    translate([-60,-15.5, 0]) chamfered_cylinder(5-tol_z, 7.7, 7.7);
                    translate([-60, 15.5, 0]) chamfered_cylinder(5-tol_z, 7.7, 7.7);
                }
                translate([0, 0, -15]) hull() {
                    chamfered_cylinder(5-tol_z, 23.2, 23.2);
                    translate([-60,-15.5, 0]) chamfered_cylinder(5-tol_z, 7.7, 7.7);
                    translate([-60, 15.5, 0]) chamfered_cylinder(5-tol_z, 7.7, 7.7);
                }
                hull() {
                    translate([-60, 0, -19]) linear_extrude(23-tol_z)
                    scale([.45, 1]) superellipse(24, 4);
                    translate([-60, 0, -20]) linear_extrude(25-tol_z)
                    scale([.45, 1]) superellipse(23, 4);
                }
            }
            translate([0, 0, -tol_z]) cylinder(10, r=54);
            translate([0, 0, -40]) cylinder(40, r=5+tol_x);
        }
        translate([-79, -15, -12.15]) gopro_male(10);
        translate([-79,  15, -12.15]) gopro_male(10);
    }
}

module female() {
    simple_gear(72, 5-tol_z, -1024);
    translate([0, 0, -10]) chamfered_cylinder(5-tol_z, 23.2, 23.2);
    translate([0, 0, -20]) chamfered_cylinder(5-tol_z, 23.2, 23.2);
    translate([0, 0, -20]) cylinder(24, r=5);
    translate([-15, 0, 5-tol_z+8.5]) rotate([0, 90, 90]) gopro_female();
    translate([ 15, 0, 5-tol_z+8.5]) rotate([0, 90, 90]) gopro_female();
}

module small_gear() {
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

module support_blocker() {
    translate([-19, 0, 0])
    cube([38, 10, 50], true);
    for (i = [1:2])
    rotate([0, 0, i*360/3])
    translate([-50, 0, 0])
    cube([100, 10, 50], true);
}

// ================
// GEAR BASE
// ================

// translate([-60, 0, -2]) mirror([0, 0, 1]) nema17();
// translate([-60, 0, 0]) rotate([0, 0, 360/24])
// small_gear();

// male();
// female();

support_blocker();
