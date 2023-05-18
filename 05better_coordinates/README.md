# Create better starting geometry (coordinates file) using sander in AMBER      

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Preparing_input_files_for_a_peptide_using_AMBER

Summary
1. In case sander does not work already for you after installing AMBER, include the following
lines in your $HOME/.bashrc
```
export LD_LIBRARY_PATH="${AMBERHOME}/lib:${LD_LIBRARY_PATH}"
export PYTHONPATH="${AMBERHOME}/lib/python2.7/site-packages:${PYTHONPATH}"
```
2. Then from the command line run
```
source $HOME/.bashrc
cd $AMBERHOME
./configure gnu
make install
```
3. Alternatively, look at the installation steps given in AMBER manual if some problem occurs with the above steps.
4. The input directory contains old_coords.prmtop and old_coords.inpcrd files obtained earlier
in 04_initial_topology_coordinates directory. Create another input file md_min.in and then run
```
$AMBERHOME/bin/sander -O -i md_min.in -o min.out -p old_coords.prmtop -c old_coords.inpcrd -r min.ncrst
$AMBERHOME/bin/ambpdb -p old_coords.prmtop -c min.ncrst > minncrst.pdb 
cp min.ncrst coords.inpcrd
```
5. The min.ncrst file is the desired coords.inpcrd file. Copy (cp) or rename (mv) min.ncrst to get coords.inpcrd file.
6. The useful output files are min.ncrst and minncrst.pdb as given in expected_output directory.
