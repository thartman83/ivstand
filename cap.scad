use <threads.scad>

module CreateCap (cap_height, screw_radius, screw_height) {
     fudge = -2;
     union() {
          difference() {
               cylinder(cap_height, screw_radius, screw_radius);
               translate([0,0,fudge]) metric_thread((screw_radius+fudge) * 2, 10, screw_height, square=true, internal=true);
          }

          rotate_extrude(convexity = 10, $fn=50)
               translate([0,10,0])
               circle(screw_radius);
     }
}

CreateCap(60,20,30);
