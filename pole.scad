// Pole for iv stand

use <threads.scad>

module CreatePole (radius, height, screw_height, capped = false) {
     fudge = -2;
     union() {
          difference() {               
               cylinder(height - screw_height,radius,radius);
               translate([0,0,fudge]) metric_thread((radius+fudge)*2,10,screw_height, square=true, internal=true);
          }

          translate([0,0,height - screw_height]) {
               if(!capped) {
                    metric_thread((radius+fudge)*2,10,screw_height, square=true);
               } else {
                    cylinder(screw_height, radius, radius);
               }
          }
     }
}

CreatePole (20, 200, 30);
