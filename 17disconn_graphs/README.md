# Diagnose artificial frustration by plotting disconnectivity graphs         

Reference
- Becker, O. M. & Karplus, M. The topology of multidimensional potential energy surfaces: Theory and application to peptide structure and kinetics. J. Chem. Phys. 106 (4), 1495–1517 (1997).
- Wales, D. J., Miller, M. A. & Walsh, T. R. Archetypal energy landscapes. Nature 394 (6695), 758–760 (1998).
- https://www-wales.ch.cam.ac.uk/disconnectionDPS.doc/

Summary
1. In the directory (here, input) containing, min.data, ts.data, points.min, and points.ts
where you have created your own dinfo file, run
```
disconnectionDPS
gv tree.ps
```
2. The tree.ps file needs to be manually edited to increase the line width of 
all the lines on the graph, to specify the unit of energy next to the value specified
near the scalebar and you can also change the colour of scalebar if you like.
3. Find my version of modified tree.ps in modify_tree.ps_manually directory.
