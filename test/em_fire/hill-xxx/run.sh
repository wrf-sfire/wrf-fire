#!/usr/bin/env bash
cd $(dirname "$0")

mpirun -np 1 ./ideal.exe

mv rsl.error.0000 ideal.log

/bin/time -v mpirun -np NP ./wrf.exe |& cat 

ls -lh wrfout*
rm -f wrfout* rsl.out.*
