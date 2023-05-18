# Ray trace structure of a peptide using Pymol                               

Summary
1. The cap.pml file is a pymol script that can be loaded in pymol. It requires
input files extractedmin.rst and coords.top (a copy of coords.prmtop). Just run
```
pymol cap.pml
```
2. For ray tracing, in the pymol command line use
```
ray 1000, 1000
png raytracedextractedmin.png, dpi=300
```
3. The output png file is also given here.
4. You might want to trim the extra white edges from the png file.
```
convert -trim raytracedextractedmin.png trimmed.png
```
