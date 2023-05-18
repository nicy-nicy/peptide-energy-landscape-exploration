# Miscellaneous

1. When doing REMOVESP in pathsample
you need min.remove and ts.remove, the first line of both contains the total number
of stationary points specified below to be removed. in case you do not want to remove 
any transition state, simply have a 0 (zero) in ts.remove file
Before running REMOVESP in pathsample
first backup min.data, ts.data, points.min and points.ts in a separate directory
then make sure you rename all the .removed files. Do not forget these 4 
commands otherwise you will end up corrupting your database.
```
mv min.data.removed min.data
mv ts.data.removed ts.data
mv points.min.removed points.min
mv points.ts.removed points.ts
```

2. Caution must be exercised when merging databases, always backup before 
running calculation, and check the output carefully for any error.
3. An example of how to make AMBER input files for a peptide dimer and run
basin-hopping with rigid body moves using A12GMIN is given in DimerBasinHopping
directory.
