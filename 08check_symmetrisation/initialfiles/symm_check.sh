#!/bin/bash

cp coords.inpcrd modified_coords.inpcrd
sed -i 1,2d modified_coords.inpcrd
head -n 2 coords.inpcrd > header
total_groups=`head -n 1 perm.allow`
cat << EOF > permute.py

#!/usr/bin/env python

import numpy as np
import io

file_perm_allow="perm.allow"
file_inpcrd="coords.inpcrd"
# modified_coords.inpcrd file is made by deleting first two lines of coords.inpcrd
# just use the following bash commands
# cp coords.inpcrd modified_coords.inpcrd
# sed -i 1,2d modified_coords.inpcrd
file_modified_inpcrd="modified_coords.inpcrd"

format_string = "{:10.7f}"

with open(file_perm_allow) as f:
    # counter is line number starting from zero
    counter=0 
    # valid is true when line number is even, initially it is false
    valid=False 
    # second_check is true if second element of even line is zero, initially it is false
    second_check=False
    # array is a list of lists. each element is a list containing atoms of same element that can be permuted
    array = []
    # array_no_secondary_set is same as array just for those permutable groups which do not have secondary sets
    array_no_secondary_set=[]
    # array_with_secondary_sets is same as array. each element in the list is a list of lists i.e., [[[],[]],[[],[]]]
    # here each element represents one primary group
    # the list elements in the above element represents all sets within a primary set
    array_with_secondary_sets=[]
    for line in f:
        counter += 1 # increase the line number by one
        if counter == 1:
            dummy=[]
            dummy.append(line.split())
            first_line_perm_allow=int(dummy[0][0])
        else: #if counter != 1: # ignore the first line as it contains total number of primary permutable groups
            if counter%2 == 0: # reading even number line containing info about number of atoms in permutable sets
                    valid=True
                    zero=int(line.split()[-1]) # zero is the last element on even line number representing number of secondary sets
                    if zero == 0: # no atoms in secondary set
                        second_check=True
                    else:
                        second_check=False
            else:
                if valid: # valid is true when you just read the even line during last iteration of loop and are now reading odd number line 
                    if second_check: # if number of atoms in secondary set is zero
                        array.append([int(x) for x in line.split()])
                        array_no_secondary_set.append([int(x) for x in line.split()])
                        valid=False
                        second_check=False
                    else:
                        seqold=list(line.split())
                        seq=list(map(int, seqold)) # map function converts a list of strings to list of integers
                        dummy_list=[]
                        dummy_list.append([seq[i:i + 2] for i in range(0, len(seq), 2)]) # converts a list into list of list with each element as list containing pair of integers.
                        array_with_secondary_sets.append([seq[i:i + 2] for i in range(0, len(seq), 2)]) # converts a list into list of list with each element as list containing pair of integers.
                        for x in dummy_list: # this is done because dummy_list is of the form [[[1,2],[3,4]]]
                            for y in x:
                                array.append(y)
                        valid=False
                        second_check=False

#print(array)
#print(array_no_secondary_set)
#print(len(array_no_secondary_set))
#print(array_with_secondary_sets)
#print(len(array_with_secondary_sets))
#print(first_line_perm_allow)

full_coords_list=[]
original_full_coords_list=[]
original_full_coords_list2=[]
                    
with open(file_modified_inpcrd) as khandle:
    half_coords_list=np.genfromtxt(khandle) # half since every line in coords.inpcrd has coordinates of two atoms
    for j in np.array(half_coords_list).tolist():
        dummy_list2=[]
        dummy_list2.append([j[i:i + 3] for i in range(0, len(j), 3)]) # takes in a list containing 6 elements and breaks it into two lists of 3 elements each
        full_coords_list.append(dummy_list2[0][0]) 
        full_coords_list.append(dummy_list2[0][1])
        original_full_coords_list.append(dummy_list2[0][0]) 
        original_full_coords_list.append(dummy_list2[0][1])
        original_full_coords_list2.append(dummy_list2[0][0]) 
        original_full_coords_list2.append(dummy_list2[0][1])
#print(full_coords_list)

#original_full_coords_list = full_coords_list
very_long_list=[]
for permutable_atom_list1 in array_no_secondary_set:
    # plan is to swap just the first two atoms in any permutable set
    first_atom1 = permutable_atom_list1[0]
    second_atom1 = permutable_atom_list1[1]
    first_atom_coords1 = full_coords_list[first_atom1-1]
    second_atom_coords1 = full_coords_list[second_atom1-1]
    temporary_list1=original_full_coords_list.copy()
    temporary_list1[first_atom1-1] = second_atom_coords1
    temporary_list1[second_atom1-1] = first_atom_coords1
    very_long_list.append(temporary_list1)
#print(len(very_long_list))

secondary_set_coords_long_list=[]
for set_atom_list in array_with_secondary_sets:
    # plan is to swap just the first two atoms in any permutable set
    temporary_list2=original_full_coords_list2.copy()
    for permutable_atom_list2 in set_atom_list:
        first_atom2 = permutable_atom_list2[0]
        second_atom2 = permutable_atom_list2[1]
        first_atom_coords2 = full_coords_list[first_atom2-1]
        second_atom_coords2 = full_coords_list[second_atom2-1]
        temporary_list2[first_atom2-1] = second_atom_coords2
        temporary_list2[second_atom2-1] = first_atom_coords2
    secondary_set_coords_long_list.append(temporary_list2)
#print(len(secondary_set_coords_long_list))

for permutable_atom_list in array:
    # plan is to swap just the first two atoms in any permutable set
    first_atom = permutable_atom_list[0]
    second_atom = permutable_atom_list[1]
    first_atom_coords = full_coords_list[first_atom-1]
    second_atom_coords = full_coords_list[second_atom-1]
    full_coords_list[first_atom-1] = second_atom_coords
    full_coords_list[second_atom-1] = first_atom_coords
#print(full_coords_list)


swapped_coords_inpcrd=open("swapped_coords.inpcrd", "w")
for i in range(len(full_coords_list)):
    swapped_coords_inpcrd.write("  {:10.7f}  {:10.7f}  {:10.7f}".format(full_coords_list[i][0], full_coords_list[i][1], full_coords_list[i][2]))
    if i%2 == 1:
        swapped_coords_inpcrd.write("\n")
swapped_coords_inpcrd.close()

for knew in range(len(very_long_list)):
    with io.open("swapped_coords_set"+str(knew+1)+".inpcrd", "w") as fnew:
        for inew in range(len(very_long_list[0])):
            fnew.write("  {:10.7f}  {:10.7f}  {:10.7f}".format(very_long_list[knew][inew][0], very_long_list[knew][inew][1], very_long_list[knew][inew][2]))
            if inew%2 == 1:
                fnew.write("\n")

for kagain in range(len(secondary_set_coords_long_list)):
    with io.open("swapped_coords_set"+str(kagain+1+len(very_long_list))+".inpcrd", "w") as fagain:
        for iagain in range(len(secondary_set_coords_long_list[0])):
            fagain.write("  {:10.7f}  {:10.7f}  {:10.7f}".format(secondary_set_coords_long_list[kagain][iagain][0], secondary_set_coords_long_list[kagain][iagain][1], secondary_set_coords_long_list[kagain][iagain][2]))
            if iagain%2 == 1:
                fagain.write("\n")
EOF

chmod u+x permute.py
python permute.py
cat header swapped_coords.inpcrd > all_groups_perm_coords.inpcrd

mkdir all_group_one_pair
#cp coords.prmtop min.in data atomgroups sbatch_GMIN_serial_nest all_group_one_pair/
cp all_groups_perm_coords.inpcrd all_group_one_pair/coords.inpcrd
cd all_group_one_pair
#sbatch sbatch_GMIN_serial_nest
cd ../
for ((i=1;i<=$total_groups;i++));
do
    cat header swapped_coords_set"$i".inpcrd > group_"$i"_perm_coords.inpcrd
    mkdir group$i
    #cp coords.prmtop min.in data atomgroups sbatch_GMIN_serial_nest group$i/
    cp group_"$i"_perm_coords.inpcrd group$i/coords.inpcrd
    cd group$i
    #sbatch sbatch_GMIN_serial_nest
    cd ../
done
rm swapped*
rm modified_coords.inpcrd
rm header
rm permute.py
#echo
#echo "Group number in output file does not correspond to group number in perm.allow file."
#echo "Output files have initial groups with no atom in secondary sets"
#echo
