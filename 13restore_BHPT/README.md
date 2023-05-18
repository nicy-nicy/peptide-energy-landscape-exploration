# (*Optional*) Restore an existing basin-hopping parallel-tempering calculation

> **Note:** Ensure that the submission script specifies the path of your A12GMIN (with MPI) executable. Make necessary changes (such as number of cores you want to run on, partition you want to use,
time limit for your calculation) to the submission script.

Summary
1. The input files are the expected output files from earlier BHPT run, except
that the data file has 1 line changed and 1 line added
```
STEPS 200 0.0
RESTORE GMIN.dump.
```
2. Follow the same steps as before for running BHPT with the current data file.
3. As an example, let us try to aim to add the local minima found using BHPT
to a PATHSAMPLE database.
4. When the output is obtained and the calculation is over, run the following command
to obtain alllowest.xyz file that is also given in created_output_for_addminxyz.
```
cat lowest.* > alllowest.xyz
```
