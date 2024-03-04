#!/bin/sh
#SBATCH --account=def-ubcxzh
#SBATCH --cpus-per-task=8
#SBATCH --mem=40g
#SBATCH --time=3:00:00
module load StdEnv/2023 r/4.3.1
Rscript ./scenario2_new/code/problem.R $1 $2 > ./scenario2_new/rout/problem.$1.$2.Rout 2>&1
