# Create an atomgroups file for use with GROUPROTATION keyword in GMIN        

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Preparing_input_files_for_a_peptide_using_AMBER
- Mochizuki, K., Whittleston, C. S., Somani, S., Kusumaatmaja, H. & Wales, D. J. A conformational factorisation approach for estimating the binding free energies of macromolecules. Phys. Chem. Chem. Phys. 16, 2842–2853 (2014).

**Summary**

1. There are scripts that can create atomgroups file. But for my small systems
I usually make it manually by looking at minncrst.pdb file (obtained after running sander and ambpdb) in pymol by loading the 
label_atom_numbers.pml script in Pymol
```
pymol label_atom_numbers.pml
```

> **Note:** The python environment may create problems with the above command, so
you may need to remove any python module loaded already.

2. On the rightmost object control panel in pymol, from the L (label button) select atom identifiers and then select ID.
3. You can also format the font face, size and background of labels using Settings within Pymol.
4. If you want to save the molecule as png, on the pymol command line run, 
```
ray 2000, 1500
png raytraced_minncrst.png, dpi=300
```
5. Listed below are the details on how to write your own atomgroups file.

The line starting with GROUP in atomgroups file represent the following quantities.
GROUP UNIQUENAME ATOM1 ATOM2 TOTALATOMSINGROUP ROTATIONSCALEFACTOR PROBABILITYOFSELECTINGTHISGROUP

Here, ATOM1 and ATOM2 specify the IDs of atoms which specify the axis along which
the group needs to be rotated. The other variables mentioned above are self-explanatory.
The subsequent lines contain the atom IDs for the atoms in the group.
I usually want all groups to be selected with equal probability.
So if there are 8 groups, the probability of selecting each group is
0.125 which is 1/8.

The aim behind providing the details below is to provide
examples of groups for other amino acids along
with the total number of atoms in the group.

The first three letters denote the amino acid.
The next two letters specify the carbon atoms forming the axis.
A, B, G and D stand for alpha, beta, gamma and delta carbon atoms.
The number represents the total number of atoms in the group. It is advisable
to check these numbers for any manual errors from my side.

ARGAB 17   
ARGBG 14  
ARGGD 11   

LYSAB 15  
LYSBG 12     
LYSGD 9    

TYRAB 14  
TYRBG 11   

PHEAB 13  
PHEBG 10  

ILEAB 12  
ILEBG 6  

LEUAB 12  
LEUBG 9    

SERAB 4  

VALAB 9  

METAB 10  

ASNAB 7  

GLUAB 8  

ASPAB 5  

THRAB 7  

GLNAB 10  
GLNBG 7  
