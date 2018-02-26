// Base for iv stand

use <threads.scad>

WallThickness = 2.50;
PitchDiameter = 15.5;
ScrewLength   = 20.0;
ThreadPitch   = 5.00;

// Base
BaseHeight       = 60.0;
BaseBottomRadius = 80.0;
BaseTopRadius    = 40.0;

// Feet slots
FeetLength              = 100.0;
FeetWidth               = 10.00;
FeetSlotOffsetCenter    = 20.00;
FeetSlotOffsetBase      = 20.00;
FeetSlotNotchHeight     = 50.00;
FeetSlotNotchLength     = 20.00;
FeetSlotNotchOffsetBase = 10.00;


module CreateBase() {
     union() {
              // Base thread reciever
          difference() {
               cylinder(BaseHeight, BaseBottomRadius, BaseTopRadius);
               translate([0,0,BaseHeight - ScrewLength + WallThickness]) {
                    metric_thread(PitchDiameter, ThreadPitch, ScrewLength,internal=true);
               }
               
                   // Feet slots
               for( theda = [0 : 90 : 270] ) {
                    rotate([0,0,theda]) {
                         translate([FeetSlotOffsetCenter, -FeetWidth/2, FeetSlotNotchOffsetBase]) {
                              cube(size = [FeetSlotNotchLength, FeetWidth, FeetSlotNotchHeight]);
                         }
                         translate([FeetSlotOffsetCenter, -FeetWidth/2, FeetSlotOffsetBase]) {
                              cube(size = [FeetLength,FeetWidth,BaseHeight]);
                         }
                    }
               }
          }
     }
}

CreateBase();
