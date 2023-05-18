# Run basin-hopping parallel-tempering (BHPT) using optimised parameters     

Reference
- Li, Z. & Scheraga, H. A. Monte carlo-minimization approach to the multiple-minima problem in protein folding. Proceedings of the National Academy of Sciences 84, 6611–6615 (1987).
- Li, Z. & Scheraga, H. A. Structure and free energy of complex thermodynamic systems. Journal of Molecular Structure: THEOCHEM 179, 333–352 (1988).

> **Note:** Ensure that the submission script specifies the path of your A12GMIN (with MPI) executable. Make necessary changes (such as number of cores you want to run on, partition you want to use,
time limit for your calculation) to the submission script.

Summary
1. To run basin-hopping parallel tempering you will need A12GMIN executable compiled with MPI.
2. Specify the path to your executable in the submission script and then run
```
sbatch sbatch_GMIN_mpi_nest
```
3. This is just an example, in practice, you will specify 100000 steps, and save 1000 structures.
The argument of DUMPINT should also be changed based on the number of steps you are running.
