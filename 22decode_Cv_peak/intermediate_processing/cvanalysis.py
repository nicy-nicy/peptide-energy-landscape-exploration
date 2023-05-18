#!/usr/bin/env python                                                           
import numpy as np                                                              
from scipy.signal import find_peaks                                             
from os.path import exists                                                      
def peakpoints(csvfile):                                                        
    pep = np.genfromtxt(csvfile, delimiter = ",")                               
    seq = pep[:,1]                                                              
    indices = find_peaks(seq)[0]                                                
    return pep[indices], pep[0,1]                                               
varfile = "Cvout.csv"                                             
if exists(varfile):                                                         
     peak_t_cv=peakpoints(varfile)[0]                                        
     result = peak_t_cv                                                      
     first_cv = peakpoints(varfile)[1]                                       
     print(result)                                         
