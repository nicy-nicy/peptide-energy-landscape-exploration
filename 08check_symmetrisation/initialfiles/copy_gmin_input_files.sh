#!/bin/bash
total_groups=`head -n 1 perm.allow`
cp gmin_input_files/* all_group_one_pair/
cd all_group_one_pair
sbatch sbatch_GMIN_serial_nest
cd ../
for ((i=1;i<=$total_groups;i++));
do
    cp gmin_input_files/* group$i/
    cd group$i
    sbatch sbatch_GMIN_serial_nest
    cd ../
done
