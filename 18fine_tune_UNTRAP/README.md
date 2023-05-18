# Fine tune parameters for UNTRAP that will then be used to remove artificial frustration

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Fine_tuning_UNTRAP

Summary
1. For my hexapeptide database, `UNTRAP 2.0 4.0 3.0` has worked very well.
2. But, usually we need to fine tune the arguments of UNTRAP keyword.
3. This can be done by specifying one set of values for these arguments and
then running UNTRAP with DUMMYRUN with necessary number of cycles.
4. The DUMMYRUN ensures that no OPTIM jobs are submitted. The keyword helps us
to know which minima the PATHSAMPLE will try to untrap. These minima are written
in the output file.
5. The visualise_UNTRAP.sh script can be used to visualise the minima which will be
untrapped by PATHSAMPLE. After DUMMYRUN calculation is completed, run the following
from the command line
```
./visualise_UNTRAP.sh output 100
``` 
6. The above script will add several lines to dinfo file as given in 
expected_output/dinfo_after_visualise_UNTRAP file.
7. The dinfo file can then be modified to expected_output/dinfo file.
8. From the command line run,
```
disconnectionDPS
gv tree.ps
```
