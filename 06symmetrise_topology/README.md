# Symmetrise the topolgy file                                                 

References
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Preparing_input_files_for_a_peptide_using_AMBER
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Setting_up
- Malolepsza, E., Strodel, B., Khalili, M., Trygubenko, S., Fejer, S. N., & Wales, D. J. (2010). Symmetrization of the AMBER and CHARMM force fields. Journal of Comput. Chem., 31(7), 1402-1409.

Summary
1. The perm-prmtop.ff03.py script in the input directory is obtained from
$HOME/softwarewales/SCRIPTS/AMBER/symmetrise_prmtop/perm-prmtop.ff03.py
2. The input files required for running the above script is old_coords.prmtop file
obtained earlier.
3. From the command line run
```
module load anaconda/python2/5.3.0
perm-prmtop.ff03.py old_coords.prmtop old_symmetrised_coords.prmtop
cp old_symmetrised_coords.prmtop coords.prmtop
```
4. The coords.prmtop is the symmetrised topology file that will be used
with GMIN, OPTIM and PATHSAMPLE.
