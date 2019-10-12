/*
 @since 9 October 2019 20:18 PM (creation date)
 @author Peter Withers <peter-gthb@bambooradical.com>
*/
module innersole(thickness, taper) {
    difference() {
        hull(){
            // heel
            cylinder(thickness,28,33);
            // toe
            translate([0,230,0]) cylinder(thickness,28,33);
            // instep
            intersection(){
              translate([-8,185,0]) cylinder(thickness,45,50);
              translate([0,00,0]) cube([50,250,thickness]);
            }
            // outstep
            intersection(){
              translate([90,160,0]) cylinder(thickness,140,150);
              translate([-100,0,0]) cube([100,250,thickness]);
            }
        }
        // arch
        translate([325,85,-1]) cylinder(30,300,270);
    }
}

module orthoticFull() {
    intersection() {
        union() {
            innersole(3,5);
            // metatarsal domes
            hull(){
                translate([-5,120,-2]) sphere(10);
                translate([0,140,-2]) sphere(10);
                translate([-15,135,-2]) sphere(10);
            }
            // arch
            translate([70,80,0]) cylinder(20,100,20);
            difference() {
                // heel flange
                cylinder(12,28,35);
                translate([0,10,55]) sphere(62);
            }
        }
        // clipping box
        innersole(30,0);
    }
}
module orthoticHalf() {
    difference() {
        rotate([-0.95,-0.3,0]) translate([0,29,0]) orthoticFull();
        translate([-55,-5,-50]) cube([100,300,50]);
    }
}
translate([-100,29,0])orthoticFull();
orthoticHalf();
// calibration cube
//cube([70*2,70*2,70*2]);