#!/usr/bin/env bash
cd $(dirname "$0")

mpirun -np 1 ./ideal.exe

time mpirun -np NP ./wrf.exe
ls -lh wrfout*
rm -f wrfout* rsl.out.*
