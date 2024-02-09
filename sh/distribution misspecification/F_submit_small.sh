#!/bin/bash
#SBATCH -J F_small
#SBATCH --account=def-ubcxzh
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G 
#SBATCH --time=0-23:59 # running time
cd /home/skyler93/projects/def-ubcxzh/skyler93/big_sample_issue_final
module load StdEnv/2023 r/4.3.1
Rscript F_possion_per_small.R $1
