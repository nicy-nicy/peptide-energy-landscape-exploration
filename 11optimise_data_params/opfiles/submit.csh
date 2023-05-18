#!/bin/bash

foreach temp ( 0.6 0.8 ) 
   foreach stepsize ( 0.2 0.4 0.6 0.8 )
      foreach sloppy ( 0.001 0.0001 0.00001 )
         foreach tight ( 0.000001 0.0000001 0.00000001 )
            set all=$temp.$stepsize.$sloppy.$tight
            if (-f $all/pdf) then
            else
            cp data.template data.$all
            echo SLOPPYCONV $sloppy >> data.$all
            echo TIGHTCONV $tight >> data.$all
            echo TEMPERATURE $temp >> data.$all
            echo STEP $stepsize 0.0 >> data.$all
            echo AMBER12 >> data.$all
            cp sbatch.template sbatch.$all
            echo csh paramsop.csh $all >> sbatch.$all
            sbatch sbatch.$all sbatch.log
            endif
         end
      end
   end
end
