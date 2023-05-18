# Connect local minima to the global minimum using CONNECTPAIRS keyword in PATHSAMPLE

Summary
1. The input file contains all the necessary files. We are going to use CONNECTPAIRS
after using ADDMINXYZ.
2. Note that you will need to manually create min.A, min.B, connectfile, and dinfo.
3. In the pathdata file, ensure the path to your A12OPTIM executable is specified.
4. The number of cycles in the pathdata depends on number of pairs of minima you want to connect
and the number of cores you want to run on.
5. Like before, ensure that sbatch_PATHSAMPLE_nest specifies the path to your
PATHSAMPLE executable.
6. The most useful output files are given in expected_output directory.
7. After the PATHSAMPLE calculation is over (or even if PATHSAMPLE is still running),
you can visualise the pathways using a disconnectivity graph. You will need a dinfo file
and then from the command line run disconnectionDPS, assuming you have it in your bin
which you should have if you followed all the steps given in 03compiling_GMIN_OPTIM_PATHSAMPLE
directory.
```
disconnectionDPS
gv tree.ps
```
8. Note that you may not be able to use gv on cluster, in that case, copy the tree.ps
to your local workstation and use gv on your local workstation.
9. Alternatively, mount your cluster sharedscratch on your local workstation. This will
save you from copying stuff everytime from the cluster whenever you want to visualise it.
I use sshfs for this as suggested on https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Mounting_sharedscratch_locally
