
use <lib/gopro.scad>

$fn = 64;

module profile() {
    hull() {
        square([10, 15.7], true);
        square([15, 9.1], true);
    }
}

module hip() {
    translate([-3, 0, 0]) rotate([90, 0,-90]) linear_extrude(1e-8) profile();
}

module knee() {
    translate([-12, 0, -8]) rotate([0,-45, 0])
    rotate([90, 0,-90]) linear_extrude(1e-8) scale(.75) profile();
}

module foot() {
    translate([-20, 0,-32]) rotate([0,-90, 0])
    rotate([90, 0,-90]) linear_extrude(1e-8) scale(.5) profile();
}

module leg() {
    rotate([0, 90, 0]) gopro_female(center=true);
    hull() {
        rotate([90, 0,-90]) linear_extrude(1e-8) square([15, 15.7], true);
        hip();
    }
    hull() {
        hip();
        knee();
    }
    hull() {
        knee();
        foot();
    }
}
