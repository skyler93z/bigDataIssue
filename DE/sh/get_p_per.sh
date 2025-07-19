#!/bin/bash
#SBATCH -J get_p_per
#SBATCH --account=def-ubcxzh
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G 
#SBATCH --time=0-01:00 # running time


module load StdEnv/2023 r/4.3.1
#module load gdal proj geos
#mkdir -p ~/.local/R/$EBVERSIONR/
export R_LIBS=~/.local/R/$EBVERSIONR/

Rscript --vanilla ./DE/code/get_p_per.R > ./DE/rout/get_p_per.Rout 2>&1
