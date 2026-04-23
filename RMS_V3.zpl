## RMS_V3.ZPL - RMS Spot Radius (Chief Ray Reference)

```
! ============================================
! RMS RADIUS vs CHIEF RAY
! Config 1 only
! Reference: Chief Ray
! Normalized field coordinates
! ============================================

numrays = 100

PRINT ""
PRINT "=========================================="
PRINT "RMS Radius vs Chief Ray"
PRINT "Config 1, Reference: Chief Ray"
PRINT "=========================================="
PRINT ""

numfields = NFLD()
numwaves = NWAV()
maxfield = MAXF()

PRINT "Fields: ", numfields
PRINT "Wavelengths: ", numwaves
PRINT "Max field: ", maxfield
PRINT ""

! Loop through all fields
FOR fi = 1, numfields, 1
    hx = FLDX(fi) / maxfield
    hy = FLDY(fi) / maxfield
    
    PRINT "Field ", fi, ": hx=", hx, " hy=", hy
    
    ! Loop through all wavelengths
    FOR wi = 1, numwaves, 1
        
        sumx = 0
        sumy = 0
        count = 0
        
        FOR raynum = 1, numrays, 1
            angle = 6.283185 * RAND(1)
            radius = SQRT(RAND(1))
            px = radius * COSI(angle)
            py = radius * SINE(angle)
            
            ! Trace marginal ray
            RAYTRACE hx, hy, px, py, wi
            
            IF (RAYE() == 0)
                rx = RAYX(NSUR())
                ry = RAYY(NSUR())
                
                ! Chief ray reference
                RAYTRACE hx, hy, 0, 0, wi
                cx = RAYX(NSUR())
                cy = RAYY(NSUR())
                
                dx = rx - cx
                dy = ry - cy
                sumx = sumx + dx * dx
                sumy = sumy + dy * dy
                count = count + 1
            ENDIF
        NEXT raynum
        
        IF (count > 0)
            rmsx = SQRT(sumx / count)
            rmsy = SQRT(sumy / count)
            rms = SQRT(rmsx * rmsx + rmsy * rmsy)
            
            FORMAT 6.3
            PRINT "  Wave ", wi, ": RMS = ", rms * 1000, " um"
        ENDIF
        
    NEXT wi
NEXT fi

PRINT ""
PRINT "=========================================="
PRINT "Done!"
```