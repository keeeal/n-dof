
use <MCAD/involute_gears.scad>

module simple_gear(teeth, thickness, twist=0) {
    gear(
        number_of_teeth=teeth,
        rim_thickness=thickness,
        hub_thickness=thickness,
        gear_thickness=thickness,
        twist=twist/teeth/thickness,
        circular_pitch=256,
        bore_diameter=0
    );
}