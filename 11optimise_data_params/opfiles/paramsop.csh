#!/bin/csh
# Initial script obtained from David Wales and adapted for use here

set directory=$1
set generalgminfiles=/sharedscratch/nn320/softwarewales/nicyexample/3OptimiseDataFileParams
set exec=/sharedscratch/nn320/softwarewales/GMIN/builds/gfortran/A12GMIN

mkdir -p $directory
cd $directory
cp ../data.$directory ./data
cp ../coords.prmtop ../min.in ../atomgroups ./
rm hits >& /dev/null
set count=1

echo                                                                            
echo Running GMIN                                                               
echo                                                                            
                                                                                
while ( $count <= 20 )                                                           
   cp $generalgminfiles/coords.$count.inpcrd coords.inpcrd
   $exec > output.$count                                                        
   echo `grep hit output.$count | head -1 | sed -e 's/[a-zA-Z]//g' -e 's/[a-zA-Z]//g' -e 's/\.//' -e 's/>//'` \
        `grep time= output.$count | tail -1 | sed 's/.*time=//'` >> hits        
   cp coords.inpcrd coords.$count.inpcrd                                        
   @ count +=1                                                                  
end                                                                             
                                                                                
gminconv2 < hits > temp ; head -1 temp > pdf                                    
echo                                                                            
echo Mean and standard deviation for global minimum first encounter "time"        
echo                                                                            
cat pdf
echo $directory > myfile
paste -d '\t' pdf myfile >> $generalgminfiles/allpdf
