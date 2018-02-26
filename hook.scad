// Hook for iv stand

use <threads.scad>

module CreateHook (arm_length, screw_radius, screw_height) {
     // Radius of hook [mm]
     hookRadius=10; 
// Width of hook [mm]
     width=12; 
//Thickness of hook [mm]
     thickness=5; 
// Radius of mounting hole [mm]
     holeRadius=0; 
// height of mounting section [mm]
     height=100;  
     fudge = -2;
     union() {
          rotate([0,-90,0]) {
               translate([0,-100,0]) {
               difference() {
                    rotate_extrude(convexity = 10,$fn=50)
                         translate([hookRadius, 0, 0])
                         square([thickness,width]);
                    
                    translate([0,0,-1])
                         cube([hookRadius*2,hookRadius*2,width+2]);
               }
               
               
               difference() {
                    translate([hookRadius,0,0])
                         cube([thickness,height,width]);
                    
                    /* translate([hookRadius-1,height-max(holeRadius*2, width/2),width/2]) */
                    /*      rotate([90,0,90]) */
                    /*      cylinder(r=holeRadius,h=thickness+2,$fn=20); */
                    /* translate([hookRadius-0.01,height-max(holeRadius*2, width/2),width/2]) */
                    /*      rotate([90,0,90]) */
                    /*      cylinder(r1=4.8,r2=0,h=min(thickness/2, 5)); */
               }
               
          }
               }

          difference() {
               cylinder(screw_height, screw_radius, screw_radius);
               translate([0,0,fudge]) metric_thread((screw_radius+fudge) * 2, 10, screw_height, square=true, internal=true);
          }
     }
}

CreateHook(10,20,30);
