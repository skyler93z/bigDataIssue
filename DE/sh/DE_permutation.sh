#!/bin/bash
#SBATCH -J DE_permutation
#SBATCH --account=def-ubcxzh
#SBATCH --cpus-per-task=1
#SBATCH --mem=60G # 250
#SBATCH --time=0-02:00 # running time



module load StdEnv/2023 r/4.3.1
#module load gdal proj geos
#mkdir -p ~/.local/R/$EBVERSIONR/
export R_LIBS=~/.local/R/$EBVERSIONR/

Rscript --vanilla ./DE/code/DE_permutation.R $1 > ./DE/rout/DE_permutation.$1.Rout 2>&1
