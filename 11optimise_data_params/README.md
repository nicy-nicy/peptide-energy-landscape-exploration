# Optimise parameters in the data file for use with GMIN                     

Acknowledgement
- The scripts are adapted from the previous scripts obtained from David Wales

> **Note:** Always check all the scripts before running to ensure that the path to your executable is specified there.
For example, you will definitely need to edit paramsop.csh script.

Summary
1. As was the case for checking symmetrisation, a lot of output directories
and output files will be produced on running the scripts here. My suggestion
would be to run it in a separate directory, let's say, /sharedscratch/nn320/mytest2.
Replace nn320 with your crsid or username.
2. Replace the pathToExampleRepo in the commands given below to specify the path to
your example git repository.
3. From the command line run
```
mkdir -p /sharedscratch/nn320/mytest2
cd !$
cp pathToExampleRepo/11optimise_data_params/opfiles/* .
csh submit.csh
```
