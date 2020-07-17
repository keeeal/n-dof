
// ==== 2D ====

module superellipse(r, p, e=1) {
    function x(r,p,e,a) =   r*pow(abs(cos(a)),2/p)*sign(cos(a));
    function y(r,p,e,a) = e*r*pow(abs(sin(a)),2/p)*sign(sin(a));
    da = 360/$fn;
    for (i = [0:$fn-1]) polygon([
        [0,0],
        [x(r,p,e,da*i), y(r,p,e,da*i)],
        [x(r,p,e,da*(i+1)), y(r,p,e,da*(i+1))]
    ]);
}

module squircle(r) {
    superellipse(r, 4);
}

// ==== 3D ====

module chamfered_cylinder(h, r1, r2, c=1) {
    hull() {
        cylinder(h, r1-c, r2-c);
        translate([0, 0, c]) cylinder(h-2*c, r1, r2);
    }
}

module squylinder(h, r) {
    linear_extrude(h) squircle(r);
}

module chamfered_squylinder(h, r, c=1) { 
    hull() {
        squylinder(h, r-c); 
        translate([0, 0, c]) squylinder(h-2*c, r);
    }
}
