# (*Optional*) Check if the symmetrisation script is working properly         

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Preparing_input_files_for_a_peptide_using_AMBER

> **Note:** The script symm_check.sh works only for checking the systems containing **even number of total atoms**

Summary
1. Since, there will be a lot of output files and output directories that
will be produced on running symm_check.sh and copy_gmin_input_files.sh,
I would suggest you to run it in a separate directory somewhere.
2. Let the separate directory somewhere be mytest in $HOME.
3. Replace the pathToExampleRepo in the commands given below to specify the path
to your example git repository.
4. Run from the command line
```
mkdir -p $HOME/mytest
cd !$
module load anaconda/python3/2021.11
cp -r pathToExampleRepo/08check_symmetrisation/* .
cp initialfiles/* .
./symm_check.sh
./copy_gmin_input_files.sh
```
5. After the submitted jobs are completed run the following command to obtain the output file given in expected_output directory
```
grep -i "Lowest minimum" group*/output > output_after_grep
```
6. If all the energies are the same, that means the symmetrisation script worked
and the topology file coords.prmtop is symmetrised properly.
