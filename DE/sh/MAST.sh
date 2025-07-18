#!/bin/bash
#SBATCH -J MAST
#SBATCH --account=def-ubcxzh
#SBATCH --cpus-per-task=1
#SBATCH --mem=250G # 250
#SBATCH --time=0-23:00 # running time


module load StdEnv/2023 r/4.3.1
#module load gdal proj geos
#mkdir -p ~/.local/R/$EBVERSIONR/
export R_LIBS=~/.local/R/$EBVERSIONR/

Rscript --vanilla ./DE/code/MAST.R > ./DE/rout/MAST.Rout 2>&1
