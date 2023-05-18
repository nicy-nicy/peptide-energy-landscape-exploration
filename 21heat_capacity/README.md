# Calculate heat capacity as a function of temperature                       

> **Note:** Ensure that the pathdata file specifies path of your A12OPTIM executable.

Summary
1. The required input files are given in the input directory.
2. The CV keyword in pathdata is used to calculate heat capacity.
3. The Cv.out is the desired output file as given in expected_output directory.
4. We can use gnuplot to have a quick look at the heat capacity as a function 
of temperature.
```
gnuplot
plot "Cv.out" using 1:2
```
