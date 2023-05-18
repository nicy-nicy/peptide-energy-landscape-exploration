# Find energy decomposition for a local minimum                              

Summary
1. Let us try to obtain the contribution of various energy terms such as
van der Waals interaction, electrostatic interaction, generalised born solvent
interaction energy to a particular minimum, say 213 here.
2. You will need extractedmin file for minimum 213 as obtained in the previous step.
3. Energy decomposition is obtained using A12OPTIM.
4. You will need odata file with `A12DECOMPE` and `MULTIJOB extractedmin` keywords.
5. Run A12OPTIM. The output file produced is given in expected_output directory.
6. The first energy decomposition in the output file is not for extractedmin. The
next energy decomposition is the desired one for extractedmin minimum.
