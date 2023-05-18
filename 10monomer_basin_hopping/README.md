# Obtain global minimum for monomer using basin-hopping                      

Reference
- Wales, D. J. GMIN: A program for finding global minima and calculating thermodynamic
properties from basin-sampling. URL http://www-wales.ch.cam.ac.uk/GMIN/.
- Wales, D. J. & Doye, J. P. Global optimization by basin-hopping and the lowest energy structures
of Lennard-Jones clusters containing up to 110 atoms. J. Phys. Chem. A 101 (28), 5111–5116
(1997)
- The explanation of all keywords in data file. https://www-wales.ch.cam.ac.uk/GMIN.doc/node7.html

> **Note:** Ensure that the submission script specifies the path of your A12GMIN executable.
Make necessary changes (such as number of cores you want to run on, partition you want to use,
time limit for your calculation) to the submission script.

Summary
1. The input directory has all the desired input files obtained from the previous steps.
2. The data and min.in input files need to be created.
3. The sbatch_GMIN_nest script is meant to run on nest cluster in which the time
limit of TEST partition is 30 minutes. For running it on other clusters for different 
time intervals make necessary changes yourself.
4. Change the path of A12GMIN executable to specify your executable. Change nn320
to your crsid or username if you had already compiled the executables as given in 03compiling_GMIN_OPTIM_PATHSAMPLE.
5. Note that you will need to run more number of steps to get the global
minimum using A12GMIN compiled without MPI. I usually run around 100000 steps.
6. From the command line run
```
sbatch sbatch_GMIN_nest
```
7. The output is given in the expected_output directory.
8. The output files produced will be used in the next calculation where we
will restore the basin-hopping run for more number of steps.
