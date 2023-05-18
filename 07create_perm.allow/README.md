# Create perm.allow file for use with OPTIM and for checking symmetrisation   

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Preparing_input_files_for_a_peptide_using_AMBER

Summary
1. The perm-pdb.py script in the input directory is copied from $HOME/softwarewales/SCRIPTS/make_perm.allow/
2. The old_mol.pdb input file was obtained earlier using tleap in AMBER while creating initial topology and coordinates file
3. Run the following from the command line
```
module load anaconda/python2/5.3.0
perm-pdb.py old_mol.pdb AMBER
```
4. The output file perm.allow is given in the expected_output directory.
5. The perm.allow is required for running OPTIM and PATHSAMPLE.
