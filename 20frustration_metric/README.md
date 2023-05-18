# Calculate frustration metric as a function of temperature                  

Reference
- De Souza, V. K., Stevenson, J. D., Niblett, S. P., Farrell, J. D. & Wales, D. J. Defining and quantifying frustration in the energy landscape: Applications to atomic and molecular clusters, biomolecules,
jammed and glassy systems. J. Chem. Phys. 146, 124103 (2017) .
- Bryngelson, J. D. & Wolynes, P. G. Spin glasses and the statistical mechanics of protein folding. Proceedings of the National Academy of sciences 84 (21), 7524–7528 (1987).
- Onuchic, J. N. & Wolynes, P. G. Theory of protein folding. Current opinion in structural biology 14 (1), 70–75 (2004).

> **Note:** Ensure pathdata file specifies the path of your A12OPTIM executable.

Summary
1. The required input files are given in the input directory.
2. The SHANNON keyword in pathdata file is used to produce Shannon.out file as given in the expected_output directory.
3. The frustration metric can be plotted from Shannon.out using gnuplot
```
gnuplot
plot "Shannon.out" using 1:4
```
