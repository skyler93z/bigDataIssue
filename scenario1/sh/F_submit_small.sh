#!/bin/bash
#SBATCH -J F_small
#SBATCH --account=def-ubcxzh
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G 
#SBATCH --time=0-11:00 # running time

module load StdEnv/2023 r/4.3.1
Rscript --vanilla ./scenario1/code/F_possion_per_small.R $1 > ./scenario1/rout/F_possion_per_small.$1.Rout 2>&1
