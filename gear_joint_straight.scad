
use <MCAD/involute_gears.scad>
use <lib/nema17.scad>
use <lib/gopro.scad>

$fn = 64;

tol_x = .2;
tol_z = .4;

module small_gear(teeth, thickness) {
    gear(
        number_of_teeth=teeth,
        circular_pitch=256,
        twist=1024/teeth/thickness,
        rim_width=2,
        hub_diameter=10,
        bore_diameter=5+tol_x/2,
        rim_thickness=thickness,
        gear_thickness=thickness-1
    );
}

module big_gear(teeth, thickness) {
    gear(
        number_of_teeth=teeth,
        circular_pitch=256,
        twist=-1024/teeth/thickness,
        rim_width=2,
        rim_thickness=thickness,
        hub_diameter=5,
        hub_thickness=thickness,
        gear_thickness=thickness,
        bore_diameter=0
    );
}

module joint_male() {
    difference() {
        union() {
            translate([0, 0, -5]) hull() {
                cylinder(5-tol_z, r=23.2);
                translate([-47, 0, 0]) cylinder(5-tol_z, r=23.2);
            }
            translate([0, 0, -15]) hull() {
                cylinder(5-tol_z, r=23.2);
                translate([-47, 0, 0]) cylinder(5-tol_z, r=23.2);
            }
            translate([-47, 0, -20])
            linear_extrude(25-tol_z) minkowski() {
                circle(7.7);
                square([31, 31], true);
            }
        }
        translate([0, 0, -tol_z]) cylinder(10, r=33.5);
        translate([-47, 0, -tol_z]) cylinder(10, r=18);
        translate([-47, 0, -2]) mirror([0, 0, 1]) nema17_hole(30, [1,2], tol_x);
        translate([0, 0, -40]) cylinder(40, r=5+tol_x);
    }
}

module joint_female() {
    big_gear(44, 5-tol_z);
    translate([0, 0, 0]) hull() {
        cylinder(5-tol_z, r=23.2);
        translate([31.5,-15.5, 0]) cylinder(5-tol_z, r=7.7);
        translate([31.5, 15.5, 0]) cylinder(5-tol_z, r=7.7);
    }
    translate([0, 0, -10]) hull() {
        cylinder(5-tol_z, r=23.2);
        translate([31.5,-15.5, 0]) cylinder(5-tol_z, r=7.7);
        translate([31.5, 15.5, 0]) cylinder(5-tol_z, r=7.7);
    }
    translate([0, 0, -20]) hull() {
        cylinder(5-tol_z, r=23.2);
        translate([31.5,-15.5, 0]) cylinder(5-tol_z, r=7.7);
        translate([31.5, 15.5, 0]) cylinder(5-tol_z, r=7.7);
    }
    difference() {
        translate([34, 0, -20]) linear_extrude(25-tol_z) minkowski() {
            circle(7.7);
            square([5, 31], true);
        }
        translate([0, 0, -20]) cylinder(5, r=28);
    }
    translate([0, 0, -20]) cylinder(24, r=5);
}

// ================
// GEAR JOINT
// ================

translate([-47, 0, -2]) mirror([0, 0, 1]) nema17();
translate([-47, 0, 0]) rotate([0, 0, (360/44)-180])
small_gear(22, 5-tol_z);

joint_male();
joint_female();

// ================
// GOPRO MOUNTS
// ================

difference() {
    union() {
        translate([-70, -15, -3.25]) rotate([0, -90, 0]) {
            gopro_male(center=true);
            translate([-3.15, 0, -5]) cube([2.8, 15, 10], true);
            translate([ 3.15, 0, -5]) cube([2.8, 15, 10], true);
        }
        translate([-70, 15, -3.25]) rotate([0, -90, 0]) {
            gopro_male(center=true);
            translate([-3.15, 0, -5]) cube([2.8, 15, 10], true);
            translate([ 3.15, 0, -5]) cube([2.8, 15, 10], true);
        }
    }
    translate([-47, 0, -21])
    linear_extrude(26) minkowski() {
        circle(6);
        square([31.04, 31.04], true);
    }
}

translate([ 44,-15, -3.25]) rotate([0, 90, 0]) {
    gopro_female(center=true);
    translate([0, 0, -7.5]) cube([15.7, 15, 15], true);
}
translate([ 44, 15, -3.25]) rotate([0, 90, 0]) {
    gopro_female(center=true);
    translate([0, 0, -7.5]) cube([15.7, 15, 15], true);
}






















