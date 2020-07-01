
module _profile(l, r, b) {
    difference() {
        union() {
            circle(r);
            translate([0, -r]) square([l+r, 2*r]);
        }
        circle(b);
    }
}

module gopro_male(length=1) {
    translate([0, 0,-4.55]) linear_extrude(2.8) _profile(length, 7.5, 2.7);
    translate([0, 0, 1.75]) linear_extrude(2.8) _profile(length, 7.5, 2.7);
}

module gopro_female(length=1) {
    translate([0, 0,-7.85]) linear_extrude(3.1) _profile(length, 7.5, 2.7);
    translate([0, 0,-1.55]) linear_extrude(3.1) _profile(length, 7.5, 2.7);
    translate([0, 0, 4.75]) linear_extrude(3.1) _profile(length, 7.5, 2.7);
    translate([0, 0, 7.85]) difference() {
        cylinder(1.8, 7.5, 6);
        rotate([0, 0, 30]) cylinder(2, r=4.9, $fn=6);
    }
}