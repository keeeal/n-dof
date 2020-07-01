
use <lib/gopro.scad>

$fn = 64;
length = 100;

module single_beam(length) {
    length = max(length, 15);
    module profile() {
        hull() {
            square([10, 15.7], true);
            square([15, 9.1], true);
        }
    }
    translate([0, 0, length]) rotate([0, 0, 90]) gopro_female(center=true);
    rotate([180, 0, 90]) gopro_male(center=true);
    hull() {
        linear_extrude(1) square([15, 9.1], true);
        translate([0, 0, 3]) linear_extrude(1) profile();
    }
    hull() {
        translate([0, 0, length-1]) linear_extrude(1) square([15, 15.7], true);
        translate([0, 0, length-4]) linear_extrude(1) profile();
    }
    translate([0, 0, 4]) linear_extrude(length-8) profile();
}

module double_beam(length) {
    length = max(length, 15);
    for (i = [0, 1]) {
        mirror([i, 0, 0]) translate([ 15, 0, 0]) {
            single_beam(length);
            hull() {
                linear_extrude(1) square([15, 9.1], true);
                translate([-3, 0, 3]) linear_extrude(1) square([15, 9.1], true);
            }
        }
    }
    translate([ 0, 0, (length-7)/2 + 3]) cube([15, 9.1, length-7], true);
}

double_beam(length);








