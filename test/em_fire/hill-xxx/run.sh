#!/usr/bin/env bash
cd $(dirname "$0")

mpirun -np 1 ./ideal.exe

time mpirun -np 4 ./wrf.exe
