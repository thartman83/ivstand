// iv stand base fins

use <base.scad>

FeetWidth  = 10.00;
FinHeight = 66.00;
FinLength  = 200.00;


BaseHeight = 60.0;
BaseTopRadius = 40.0;
FeetSlotOffsetCenter = 20.00;
LopOffHeight = 20;

difference() {
     translate([FeetSlotOffsetCenter,FeetWidth/2,0]) {
          rotate([90,0,0]) {
               linear_extrude(height=FeetWidth) {
                    polygon(points = [ [0,0], [0,FinHeight],
                                       [FinLength, 0] ]);
               }
          }
     }     
     CreateBase();
     translate([0,0,BaseHeight]) {
          cylinder(LopOffHeight, BaseTopRadius, BaseTopRadius);
     }
}
