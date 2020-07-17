
module _profile(l, r, b) {
    difference() {
        union() {
            circle(r);
            translate([0, -r]) square([l+r, 2*r]);
        }
        circle(b);
    }
}

module gopro_male(length=1, base=false) {
    translate([0, 0,-4.55]) linear_extrude(2.8) _profile(length, 7.5, 2.7);
    translate([0, 0, 1.75]) linear_extrude(2.8) _profile(length, 7.5, 2.7);
    if (base) {
        translate([length, 7.5, 0]) rotate([90, 0, 0])
        linear_extrude(15) difference() {
            translate([7.125, 0]) square([2.75, 12.6], true);
            translate([5.75, -6.3]) circle(1.75);
            translate([5.75, -0]) circle(1.75);
            translate([5.75,  6.3]) circle(1.75);
        }
    }
}

module gopro_female(length=1, base=false) {
    translate([0, 0,-7.85]) linear_extrude(3.1) _profile(length, 7.5, 2.7);
    translate([0, 0,-1.55]) linear_extrude(3.1) _profile(length, 7.5, 2.7);
    translate([0, 0, 4.75]) linear_extrude(3.1) _profile(length, 7.5, 2.7);
    translate([0, 0, 7.85]) difference() {
        cylinder(1.8, 7.5, 6);
        rotate([0, 0, 30]) cylinder(2, r=4.9, $fn=6);
    }
    if (base) {
        translate([length, 7.5, 0]) rotate([90, 0, 0])
        linear_extrude(15) difference() {
            translate([7.2, 0]) square([2.6, 18.9], true);
            translate([5.9, -9.45]) circle(1.6);
            translate([5.9, -3.15]) circle(1.6);
            translate([5.9,  3.15]) circle(1.6);
            translate([5.9,  9.45]) circle(1.6);
        }
    }
}