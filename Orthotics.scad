/*
 @since 9 October 2019 20:18 PM (creation date)
 @author Peter Withers <peter-gthb@bambooradical.com>
*/
module innersole(thickness, taper) {
    difference() {
        hull(){
            // heel
            cylinder(thickness,28,28+(taper*thickness));
            // toe
            translate([0,230,0]) cylinder(thickness,28,28+(taper*thickness));
            // instep
            intersection(){
              translate([-8,185,0]) cylinder(thickness,45,45+(taper*thickness));
              translate([0,00,0]) cube([50,250,thickness]);
            }
            // outstep
            intersection(){
              translate([90,160,0]) cylinder(thickness,140,140+(taper*thickness));
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
            innersole(3,1);
            // metatarsal domes
            hull(){
                translate([-5,125,-10]) sphere(20);
                translate([-3,145,-10]) sphere(20);
                translate([-10,143,-10]) sphere(20);
            }
            // arch
            translate([70,80,0]) cylinder(20,100,20);
            difference() {
                // heel flange
                cylinder(12,30,35);
                translate([0,10,56]) sphere(62);
            }
        }
        // clipping box
        intersection() {
        innersole(30,1);
        translate([0,0,-10]) innersole(30,0.2);
        }
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