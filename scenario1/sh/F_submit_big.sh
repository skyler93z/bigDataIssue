#!/bin/bash
#SBATCH -J F_big
#SBATCH --account=def-ubcxzh
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G 
#SBATCH --time=0-22:00 # running time

module load StdEnv/2023 r/4.3.1
Rscript --vanilla ./scenario1/code/F_possion_per_big.R $1 $2 > ./scenario1/rout/F_possion_per_big.$1.$2.Rout 2>&1
