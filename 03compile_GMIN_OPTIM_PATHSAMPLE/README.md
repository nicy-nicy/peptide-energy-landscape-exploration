# Compile executables for GMIN, OPTIM, and PATHSAMPLE                         

Reference
- https://wikis.ch.cam.ac.uk/ro-walesdocs/wiki/index.php/Compiling_Wales_Group_codes_using_cmake 

> **Note:** Instead of nn320, your should use your crsid or whatever your username is.

Summary
1. Compile the executables in a directory different from the cloned softwarewales repository.
2. We cloned the softwarewales repository in $HOME and we will be compiling in /sharedscratch/nn320/softwarewales directory
3. Steps for compiling **A12GMIN without MPI** to be used for basin-hopping
```
mkdir -p /sharedscratch/nn320/softwarewales/GMIN/builds/gfortran
cd !$
module load cmake/3.16.3
module load gcc/7.5.0
FC=gfortran cmake -DWITH_AMBER12=1 $HOME/softwarewales/GMIN/source
make -j12
```

> **Note:** If you have already followed the above steps you can skip reloading the same modules.

4. Steps for compiling **A12GMIN with MPI** to be used for basin-hopping parallel-tempering. 
```
mkdir -p /sharedscratch/nn320/softwarewales/GMIN/builds/gfortran_amber12_mpi
cd !$
module load cmake/3.16.3
module load gcc/7.5.0
module load mpi/openmpi/gnu7/4.1.0
FC=mpif90 CC=mpicc cmake -DWITH_AMBER12=1 $HOME/softwarewales/GMIN/source -DCOMPILER_SWITCH=gfortran -DWITH_MPI=yes
make -j12
```
5. Steps for compiling **A12OPTIM**
```
mkdir -p /sharedscratch/nn320/softwarewales/OPTIM/builds/gfortran
cd !$
module load cmake/3.16.3
module load gcc/7.5.0
FC=gfortran cmake -DWITH_AMBER12=1 $HOME/softwarewales/OPTIM/source
make -j12
```
6. Steps for compiling **PATHSAMPLE**
```
mkdir -p /sharedscratch/nn320/softwarewales/PATHSAMPLE/builds/gfortran
cd !$
module load cmake/3.16.3
module load gcc/7.5.0
FC=gfortran cmake $HOME/softwarewales/PATHSAMPLE/source
make
```
7. Other executables that you will require are **CVHSA**, **disconnectionDPS**, and **gminconv2**.
The fortran programs for these can be found in softwarewales repository. Here, we will be compiling
them in bin directory.
```
cd $HOME/bin
module load gcc/7.5.0
gfortran $HOME/softwarewales/UTILS/GMIN/Cv.HSA.f90 -o CVHSA
gfortran $HOME/softwarewales/DISCONNECT/source/disconnectionDPS.f90 -o disconnectionDPS
gfortran $HOME/softwarewales/UTILS/GMIN/gminconv2.f90 -o gminconv2
```
8. Other important scripts that can be copied to $HOME/bin from softwarewales.
```
cp $HOME/softwarewales/SCRIPTS/AMBER/symmetrise_prmtop/perm-prmtop.ff03.py $HOME/bin/
cp $HOME/softwarewales/SCRIPTS/make_perm.allow/perm-pdb.py $HOME/bin/
cp $HOME/softwarewales/SCRIPTS/PATHSAMPLE/visualize_UNTRAP.sh $HOME/bin/
```

> **Note:** Debug executable is different from debug keyword in input files like data (in GMIN),
odata (in OPTIM), and odata.connect and pathdata (in PATHSAMPLE).

9. Steps for compiling **debug executable A12GMIN with MPI** for use with gnu debugger (gdb) or valgrind.
```
mkdir -p /sharedscratch/nn320/softwarewales/GMIN/builds/gfortran_amber12_mpi_debug/
cd !$
module load cmake/3.16.3
module load gcc/7.5.0
module load mpi/openmpi/gnu7/4.1.0
FC=mpif90 CC=mpicc cmake -DCMAKE_BUILD_TYPE=Debug -DWITH_AMBER12=1 $HOME/softwarewales/GMIN/source -DCOMPILER_SWITCH=gfortran -DWITH_MPI=yes
make -j12
```
