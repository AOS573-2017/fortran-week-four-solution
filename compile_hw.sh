#!/bin/sh

gfortran -c integrations.f90
gfortran integrations.o lorenz63.f90 -o lorenz63
echo "Compilation script completed." 
