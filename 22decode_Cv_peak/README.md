# Find local minima that contribute to low temperature peak in Cv and colour them on the disconnectivity graph

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Decoding_heat_capacity_curves
- Wales, D. J. Decoding heat capacity features from the energy landscape. Phys. Rev. E 95, 030105 (2017).

Summary
1. The output files obtained after running PATHSAMPLE with CV keyword as done in
21heat_capacity, will serve as the input files now.
2. In other words, by looking at the output files produced after running CV keyword,
find out the values of specific quantities that you will need to create Cv.data and Tanal files.
3. For Tanal file, the first line specified the temperature at which the peak occurs. Here,
we are analysing low temperature peak that occurs at 0.078 and the second line can
take any value between 0.9 to 0.99. For more information check the reference mentioned above.
4. For Cv.data file, the first, second, third, fourth and fifth numbers
specify the starting temperature for which the CV analysis was done, the final temperature
for CV analysis, the number of lines in Cv.out file, the number of degrees of freedom
that is 3N-6 where N is the total number of atoms in the system, and the total
number of minima in the min.data file, respectively.
5. The intermediate_processing directory contains a python script cvanalysis.py
that requires Cvout.csv file. The Cvout.csv file can be produced as follows
```
awk '{print $1}' Cv.out > col1
awk '{print $2}' Cv.out > col2
paste -d ',' col1 col2 > Cvout.csv
```
6. The cvanalysis.py is a python3 script.
```
python cvanalysis.py > peakinfo
```
7. The run CVHSA
```
CVHSA > cvhsaoutput
```
8. Plot disconnectivity graph using disconnectionDPS that uses min.minus and min.plus
files to specify the minima that need to be coloured.
```
disconnectionDPS
```
9. The tree.ps is given in expected_output directory.
