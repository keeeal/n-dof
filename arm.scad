
use <lib/gopro.scad>

$fn = 128;

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
    #hull() {
        translate([0, 0,-8.5+length/2]) cube([15.7, 15, eps], true);
        translate([0, 0,-12+length/2]) linear_extrude(eps) _profile(9.1, 10);;
    }
    dz = (length - 24)/$fn;
    for (i = [0:$fn-1]) {
        translate([0, 0, -(length-24)/2]) hull() {
            translate([0, 0, dz*(i+0)]) linear_extrude(eps) _profile(9.1, 10);;
            translate([0, 0, dz*(i+1)]) linear_extrude(eps) _profile(6 + 3.1*sin(3.14159*i/($fn-1)), 6);
        }
    }
    #hull() {
        translate([0, 0, 12-length/2]) linear_extrude(eps) _profile(9.1, 10);
        translate([0, 0, 8.5-length/2]) cube([9.1, 15, eps], true);
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

double_arm(90);








