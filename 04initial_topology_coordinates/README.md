# Create initial topology and coordinates files using AMBER                   

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Preparing_input_files_for_a_peptide_using_AMBER

Summary
1. Create a leap.in input file as given in the input directory. Here, we are considering the 
sequence YYGGYY with N-terminal methylated and C-terminal methylamidated, i.e., the 
peptide is capped at both ends so that it is no longer in zwitter-ionic form.
2. Run tleap from the command line in the directory containing leap.in file. This will work if
the AMBER installation is successful.
```
tleap -f leap.in
```
3. The output files produced are given in the expected_output directory. The output files are 
old_coords.prmtop, old_coords.inpcrd, old_mol.pdb and leap.log.
4. In the subsequent steps, we will minimise the energy of the structure using the coordinates file old_coords.inpcrd.
Sander program within AMBER will be used for this minimisation and the output file min.ncrst that is produced
will be renamed as coords.inpcrd. This coords.inpcrd file will be used in GMIN, OPTIM and PATHSAMPLE.
This step is done to obtain a better starting geometry. It is optional. 
5. We will symmetrise the old_coords.prmtop topology
file to obtain old_symmetrised_coords.prmtop that will then be renamed as coords.prmtop.
This coords.prmtop file will be used with GMIN, OPTIM and PATHSAMPLE.
6. The old_mol.pdb file produced is used as an input file for perm-pdb.py script
that is used to generate a perm.allow file. The perm.allow file is compulsorily
required for running OPTIM and PATHSAMPLE. I also use perm.allow file
to check if my topology file is symmetrised properly using symm_check.sh script
that works only for systems containing even number of total atoms.
