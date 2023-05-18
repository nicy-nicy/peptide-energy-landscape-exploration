# peptide-energy-landscape-exploration
A detailed tutorial for exploring the energy landscape of peptides using GMIN/OPTIM/PATHSAMPLE programs interfaced with AMBER.
Steps to obtain and further analyse the heat capacity as a function of temperature are also explained.
                         

### Overall workflow

```mermaid                                                                     
flowchart LR                                                                   
    A("AMBER<br>- tleap<br> - sander<br> #9888; symmetrise topology file<br> - perm.allow file<br> #129488; check if symmetrised")
    -->                                                                        
    B("GMIN<br> - atomgroups for group rotation<br> - data file (basin hopping)<br> #128204; optimise data file parameters<br> - data file (BHPT)")
    -->                                                                        
    C("PATHSAMPLE<br> - addminxyz<br> - connectpairs<br> #10052; QCI on cold fusion<br> - disconnectivity graph<br> #11088; untrap")
    -->                                                                        
    D("Calculation<br> - frustration metric<br> #128293; heat capacity")       
    -->                                                                        
    E("Graphics<br> #127794; disconnectivity graphs<br> #9004; pymol ray tracing")
```                                                                            
```mermaid                                                                     
flowchart TD                                                                   
g("<p style='text-align:left'>#9888; symmetrisation script used depends on the force field used</p><p style='text-align:left'> #129488; in case symmetrisation script is not available for a particular AMBER force field use existing script and check if it is working</p><p style='text-align:left'> #128204; arguments of sloppyconv, tightconv, step, temperature need to be optimised</p><p style='text-align:left'> #10052; use quasi-continuous interpolation when cold fusion is diagnosed</p><p style='text-align:left'> #11088; untrap parameters need to be fine tuned</p><p style='text-align:left'> #128293; local minima contributing to low temperature peak found using CvHSA program</p><p style='text-align:left'> #127794; Details about modifying linewidth, scalebar and colouring disconnectivity graphs</p><p style='text-align:left'> #9004; making figure using pymol script</p><p style='text-align:left'> ;</p>")
```                                                                            
1. [Install AMBER](01install_AMBER)
2. [Clone softwarewales git repository](02clone_softwarewales)
3. [Compile executables for GMIN, OPTIM, and PATHSAMPLE](03compile_GMIN_OPTIM_PATHSAMPLE)
4. [Create initial topology and coordinates files using AMBER](04initial_topology_coordinates)
5. [Create better starting geometry (coordinates file) using sander in AMBER](05better_coordinates)
6. [Symmetrise the topolgy file](06symmetrise_topology)
7. [Create perm.allow file for use with OPTIM and for checking symmetrisation](07create_perm.allow)
8. (*Optional*) [Check if the symmetrisation script is working properly](08check_symmetrisation)
9. [Create an atomgroups file for use with GROUPROTATION keyword in GMIN](09create_atomgroups)
10. [Obtain global minimum for monomer using basin-hopping](10monomer_basin_hopping)
11. [Optimise parameters in the data file for use with GMIN](11optimise_data_params)
12. [Run basin-hopping parallel-tempering (BHPT) using optimised parameters](12BHPT)
13. (*Optional*) [Restore an existing basin-hopping parallel-tempering calculation](13restore_BHPT)
14. [Add local minima obtained from GMIN into a PATHSAMPLE database using ADDMINXYZ keyword](14addminxyz)
15. [Connect local minima to the global minimum using CONNECTPAIRS keyword in PATHSAMPLE](15connectpairs)
16. (*If cold fusion diagnosed*) [Run CONNECTPAIRS with quasi-continuous interpolation (QCI)](16qci)
17. [Diagnose artificial frustration by plotting disconnectivity graphs](17disconn_graphs)
18. [Fine tune parameters for UNTRAP that will then be used to remove artificial frustration](18fine_tune_UNTRAP)
19. [Run UNTRAP within PATHSAMPLE](19run_untrap)
20. [Calculate frustration metric as a function of temperature](20frustration_metric)
21. [Calculate heat capacity as a function of temperature](21heat_capacity)
22. [Find local minima that contribute to low temperature peak in Cv and colour them on the disconnectivity graph](22decode_Cv_peak)
23. [Extract coordinates of desired local minimum using EXTRACTMIN in PATHSAMPLE](23extractmin)
24. [Find energy decomposition for a local minimum](24energy_decomposition)
25. [Ray trace structure of a peptide using Pymol](25ray_trace_pymol)
26. [Miscellaneous](26miscellaneous)
