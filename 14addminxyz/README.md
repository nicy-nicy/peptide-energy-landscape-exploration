# Add local minima obtained from GMIN into a PATHSAMPLE database using ADDMINXYZ keyword

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Adding_several_minima_obtained_using_GMIN_(maybe_using_BHPT)_to_min.data
- The explanation of all odata and pathdata keywords are given in
- https://www-wales.ch.cam.ac.uk/OPTIM.doc/node4.html and
- https://www-wales.ch.cam.ac.uk/PATHSAMPLE.2.1.doc/node6.html

Summary
1. All the required input files are in the input directory.
2. Ensure sbatch_PATHSAMPLE_nest specifies the path to your PATHSAMPLE executable.
3. Ensure pathdata file specified the path to your A12OPTIM executable.
4. In the directory containing all the input files, from the command line run
```
sbatch sbatch_PATHSAMPLE_nest
```
5. The most useful output files produced are given in expected_output directory.
