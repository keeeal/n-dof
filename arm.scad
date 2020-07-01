
use <lib/gopro.scad>

$fn = 64;

eps = 1e-8;

module single_arm(length) {
    length = max(length, 30);
    module _profile(x, y) {
        hull() {
            square([x, 15], true);
            square([15.7, y], true);
        }
    }

    translate([0, 0,-length/2]) rotate([0,-90, 0]) gopro_male();
    hull() {
        translate([0, 0,-8.5+length/2]) cube([15.7, 15, eps], true);
        translate([0, 0,-12+length/2]) linear_extrude(eps) _profile(9.1, 10);;
    }
    hull() {
        translate([0, 0,-(length-24)/2]) linear_extrude(eps) _profile(9.1, 10);;
        translate([0, 0,-(length-24)/6]) linear_extrude(eps) _profile(6, 6);
    }
    hull() {
        translate([0, 0, -(length-24)/6]) linear_extrude(eps) _profile(6, 6);
        translate([0, 0,  (length-24)/6]) linear_extrude(eps) _profile(6, 6);
    }
    hull() {
        translate([0, 0, (length-24)/6]) linear_extrude(eps) _profile(6, 6);
        translate([0, 0, (length-24)/2]) linear_extrude(eps) _profile(9.1, 10);;
    }
    hull() {
        translate([0, 0, 8.5-length/2]) cube([9.1, 15, eps], true);
        translate([0, 0, 12-length/2]) linear_extrude(eps) _profile(9.1, 10);
    }
    translate([0, 0, length/2]) rotate([0, 90, 0]) gopro_female();
}

module double_arm(length) {
    length = max(length, 30);
    for (i = [0, 1]) {
        mirror([0, i, 0]) translate([0, 15, 0]) single_arm(length);
    }
    cube([4, 15, length-24], true);
}

double_arm(60);








