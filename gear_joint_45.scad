
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

module male() {
    difference() {
        union() {
            translate([0, 0, -5]) hull() {
                cylinder(5-tol_z, r=23.2);
                translate([-43, 0, 0]) cylinder(5-tol_z, r=10);
            }
            translate([0, 0, -15]) hull() {
                cylinder(5-tol_z, r=23.2);
                translate([-43, 0, 0]) cylinder(5-tol_z, r=10);
            }
            translate([-43, 0, -20]) rotate([0, 0, 45])
            linear_extrude(25-tol_z) minkowski() {
                circle(7.7);
                square([31, 31], true);
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
    big_gear(48, 5-tol_z);
    translate([0, 0, 0]) hull() {
        cylinder(5-tol_z, r=23.2);
        translate([31.5,-15.5, 0]) cylinder(5-tol_z, r=7.7);
        translate([31.5, 15.5, 0]) cylinder(5-tol_z, r=7.7);
    }
    translate([0, 0, -10]) hull() {
        cylinder(5-tol_z, r=7);
        translate([31.5,-15.5, 0]) cylinder(5-tol_z, r=7.7);
        translate([31.5, 15.5, 0]) cylinder(5-tol_z, r=7.7);
    }
    translate([0, 0, -20])hull() {
        cylinder(5-tol_z, r=7);
        translate([31.5,-15.5, 0]) cylinder(5-tol_z, r=7.7);
        translate([31.5, 15.5, 0]) cylinder(5-tol_z, r=7.7);
    }
    translate([34, 0, -20]) linear_extrude(25-tol_z) minkowski() {
        circle(7.7);
        square([5, 31], true);
    }
    translate([0, 0, -20]) cylinder(24, r=7);
}

// ================
// GEAR JOINT
// ================

//translate([-43, 0, -2]) mirror([0, 0, 1]) rotate([0, 0, 45]) nema17();
//translate([-43, 0, 0])
//rotate([0, 0, 360/24])
//small_gear(12, 5-tol_z);

male();
rotate([0, 0, 0]) female();

// ================
// GOPRO MOUNTS
// ================

difference() {
    translate([-43, 0, -3.25]) rotate([0, 0, 45])
    union() {
        translate([-23, -15, 0]) rotate([0, -90, 0]) {
            gopro_male(center=true);
            translate([-3.15, 0, -5]) cube([2.8, 15, 10], true);
            translate([ 3.15, 0, -5]) cube([2.8, 15, 10], true);
        }
        translate([-23, 15, 0]) rotate([0, -90, 0]) {
            gopro_male(center=true);
            translate([-3.15, 0, -5]) cube([2.8, 15, 10], true);
            translate([ 3.15, 0, -5]) cube([2.8, 15, 10], true);
        }
    }
    translate([-43, 0, -21]) rotate([0, 0, 45])
    linear_extrude(26) minkowski() {
        circle(6);
        square([31.04, 31.04], true);
    }
}

difference() {
    translate([-43, 0, -3.25]) rotate([0, 0,-45])
    union() {
        translate([-23, -15, 0]) rotate([0, -90, 0]) {
            gopro_male(center=true);
            translate([-3.15, 0, -5]) cube([2.8, 15, 10], true);
            translate([ 3.15, 0, -5]) cube([2.8, 15, 10], true);
        }
        translate([-23, 15, 0]) rotate([0, -90, 0]) {
            gopro_male(center=true);
            translate([-3.15, 0, -5]) cube([2.8, 15, 10], true);
            translate([ 3.15, 0, -5]) cube([2.8, 15, 10], true);
        }
    }
    translate([-43, 0, -21]) rotate([0, 0, 45])
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


















