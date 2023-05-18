# Install AMBER                                                               

References
- https://ambermd.org/doc12/Amber14.pdf
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Preparing_input_files_for_a_peptide_using_AMBER

Summary
1. Install AMBER14 in your $HOME directory by following the installation steps given in AMBER14 manual
2. Include AMBER14 in your $PATH by having the following commands in your $HOME/.bashrc
```
export AMBERHOME=$HOME/amber14
export PATH=$PATH:$AMBERHOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/amber14/lib
export PATH
```
3. From the command line run
```
source $HOME/.bashrc
```
