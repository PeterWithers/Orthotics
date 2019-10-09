/*
 @since 9 October 2019 20:18 PM (creation date)
 @author Peter Withers <peter-gthb@bambooradical.com>
*/

intersection() {
    difference() {
        union() {
            hull(){
                // heel
                cylinder(5,28,33);
                // toe
                translate([0,230,0]) cylinder(5,28,33);
                // instep
                intersection(){
                  translate([-8,185,0]) cylinder(5,45,50);
                  translate([0,00,0]) cube([50,250,5]);
                }
                // outstep
                intersection(){
                  translate([90,160,0]) cylinder(5,140,150);
                  translate([-100,0,0]) cube([100,250,5]);
                }
            }
            // metatarsal domes
            hull(){
                translate([-5,120,0]) sphere(10);
                translate([0,140,0]) sphere(10);
                translate([-15,135,0]) sphere(10);
            }
            // arch
            translate([80,80,0]) cylinder(20,100,20);
        }
        // arch
        translate([325,85,-1]) cylinder(30,300,270);
    }
    // clipping box
    translate([-80,-50,0]) cube([150,330,30]);
}
// calibration cube
//cube([70*2,70*2,70*2]);