## LAST_SURFACE_DISTANCE.ZPL - Image Distance

```
! ============================================
! LAST SURFACE TO IMAGE DISTANCE
! Prints the distance from last surface to image plane
! ============================================

ns = NSUR()
last_thick = THIC(ns - 1)

PRINT ""
PRINT "============================="
PRINT "Distance Last Surface to Image"
PRINT "============================="
PRINT ""
PRINT "Number of surfaces: ", ns
PRINT "Last surface thickness: ", last_thick, " mm"
PRINT ""
PRINT "Note: This is the distance from the"
PRINT "last optical surface to the image plane."
PRINT "============================="
```