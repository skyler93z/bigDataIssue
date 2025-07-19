# Beyond Conventional P-Values: Addressing Statistical Challenges in Big Data
---

## About this Project
In the big data era, the need to reevaluate traditional statistical methods is paramount due to the challenges posed by vast datasets. While larger samples theoretically enhance accuracy and hypothesis testing power without increasing false positives, practical concerns about inflated Type-I errors persist. The prevalent belief is that larger samples can uncover subtle effects, necessitating dual consideration of p-value and effect size. Yet, the reliability of p-values from large samples remains debated.

This project warns that larger samples can exacerbate minor issues into significant errors, leading to false conclusions. Through our simulation study, we demonstrate how growing sample sizes amplify issues arising from two commonly encountered violations of model assumptions in real-world data and lead to incorrect decisions. This underscores the need for vigilant analytical approaches in the era of big data. In response, we introduce a permutation-based test to counterbalance the effects of sample size and assumption discrepancies by neutralizing them between actual and permuted data. We demonstrate that this approach effectively stabilizes nominal Type I error rates across various sample sizes, thereby ensuring robust statistical inferences even amidst breached conventional assumptions in big data.

For reproducibility, we built this repository to share our original codes, results, figures and all the other things used in our manuscript.

---
## Directory Layout
![image](https://github.com/ubcxzhang/bigDataIssue/blob/main/Readme_illustration1.png)

### Note
Under the main directory, we have multiple layers of subdirectories. The first layer is the four different examples: "PoisBias" corresponds to Section 3.1 of our manuscript; "scenario1" and "scenario2" correspond to the two assumption violation scenarios mentioned in Section 3.2 of our manuscript; "DE" corresponds to Section 5 of our manuscript. The second layer is the "code", "result", "sh", "figure", "rout" files.

The files under the subfolder "sh" are shell scripts used to submit computing jobs (to run the .R files in subfolders "code"), which are **system-specific**. If you use HPCs different from Compute Canada servers or personal computers, these sh files must be revised according to your system. 

~~~
    [your_deirctory]  
~~~
all the R codes are in the subdirectory directory at **code** (using the "scenario1" subdirectory as an example)
~~~
    [your_deirctory]/scenario1/code  
~~~
all the .sh files that run the R files are in the subdirectory directory at **sh** (using the "scenario1" subdirectory as an example)
~~~
    [your_deirctory]/scenario1/sh  
~~~
all the log files are in the subdirectory directory at **rout** (using the "scenario1" subdirectory as an example)
~~~
    [your_deirctory]/scenario1/rout  
~~~
all the final results are in the subdirectory directory at **result** (using the "scenario1" subdirectory as an example)
~~~
    [your_deirctory]/scenario1/result  
~~~
all the graphs in the paper are in the subdirectory directory at **figure** (using the "scenario1" subdirectory as an example)
~~~
    [your_deirctory]/scenario1/figure  
~~~

### PoisBias
<details><summary>code</summary>

    ├── code  
    │   └── PoisBias.R		    # code for Figure1				
</details>
<details><summary>figure</summary>

    ├── figure    	
    │ 	 └── Figure.1		    # Figure1 in manuscript
</details>

### scenario1
<details><summary>code</summary>

    ├──  code 
    │ 	 ├── F_possion_per_small.R		    # code for distribution misspecification scenario when sample size is from n[1] to n[50]
    │ 	 ├── F_possion_per_big.R 		# code for distribution misspecification scenario when sample size is from n[51] to n[60]
    │ 	 └── Figure2.R		           # code used for plotting Figure 2
</details>
<details><summary>sh</summary>

    ├──  sh
    │ 	 ├── F_submit_small.sh		# sh files     
    │ 	 └── F_submit_big.sh  
</details>
<details><summary>rout</summary>

    ├──  log files after submitting jobs
    │ 	 ├── F_possion_per_small.kk.Rout	    # log file for F_possion_per_small.sh for each sample size kk (kk=1,...,50)     
    │ 	 └── F_possion_per_big.kk.ss.Rout       # log file for F_possion_per_big.sh for each sample size kk (kk=51,...,60) and each experiment batch ss (ss=1,...,10)  
</details>
<details><summary>result</summary>
	    
    ├──  result 
    │ 	 ├── F_beta1.permu          # a file that stores the rda results of permutated beta1 values 
    │ 	 ├── F_CI		    # a file that stores the rda results of confidence interval
    │ 	 ├── F_decision		    # a file that stores the rda results of the decisions of the hypothesis tests
    │ 	 ├── F_p.value		    # a file that stores the rda results of p-values before permutation
    │ 	 ├── F_p.value.per          # a file that stores the rda results of p-values after permutation
    │ 	 ├── F_type1		    # a file that stores the rda results of type one error before permutation
    │ 	 ├── F_type1.per	    # a file that stores the rda results of type one error after permutation(using p-values to compute)
    │ 	 └── F_type1.per.de	    # a file that stores the rda results of type one error after permutation(using decisions to compute)
</details>
<details><summary>figure</summary>

    ├── figure   
    │ 	 └── Figure2.png		# Figure2 in manuscript					
</details>

### scenario2
<details><summary>code</summary>

    ├──  code 
    │ 	 ├── problem.R		        # code for outcomes influenced by an unobserved predictor scenario
    │ 	 ├── solution_small.R		# code for a solution when the sample size ranges from 10^1 to 10^4
    │ 	 ├── solution_big.R		# code for a solution when the sample size ranges from 10^4 to 10^5 
    │ 	 ├── Figure3(ver1).R		# code used to plot Figure 3, generated by exporting 'save as image' in R
    │ 	 └── Figure3(ver2).R		# code used to automatically generate Figure 3 from a PNG file				
</details>
<details><summary>sh</summary>

    ├──  sh
    │ 	 ├── problem.sh		        # sh files
    │ 	 ├── solution_small.sh							
    │ 	 └── solution_big.sh							
</details>
<details><summary>rout</summary>

    ├──  log files after submitting jobs
    │ 	 ├── problem.Rout	         # log files for problem_sh for each sample size (kk = 1,...,60) and beta values (ss = 1,...,4)
    │ 	 ├── solution_small.Rout         # log file for solution_small_sh for each sample size (kk = 1,...,50)
    │ 	 └── solution_big.Rout		 # log file for solution_big_sh for each sample size (kk = 1,...,50) and experiment batch (gg = 1,...,10).
</details>
<details><summary>result</summary>
		    
    ├──  result 
    │ 	 ├── problem_typeIerror          # a subdirectory that stores the .rda results of Type I error showing inflation
    │ 	 ├── solution_beta1.permu_small  # a subdirectory that stores the .rda results of permutated beta1 values
    │ 	 ├── solution_beta1.permu_big    
    │ 	 ├── solution_CI_small		 # a subdirectory that stores the .rda results confidence interval
    │ 	 ├── solution_CI_big		 
    │ 	 ├── solution_decision		 # a subdirectory that stores the .rda results of the decisions of the hypothesis tests
    │ 	 ├── solution_p.value		 # a subdirectory that stores the .rda results of p-values before permutation
    │ 	 ├── solution_p.value.per        # a subdirectory that stores the .rda results of p-values after permutation
    │ 	 ├── solution_typeI		 # a subdirectory that stores the .rda results of Type I error before permutation
    │ 	 ├── solution_typeI.per	         # a subdirectory that stores the .rda results of type I error after permutation(using p-values)
    │ 	 └── solution_typeI.per.de	 # a subdirectory that stores the .rda results of type one error after permutation(using decisions)
</details>
<details><summary>figure</summary>

    ├── figure    
    │ 	 ├── Figure3(ver1).png           # Figure3 in manuscript generated by exporting 'save as image' in Figure3(ver1).R 
    │ 	 └── Figure3(ver2).png		 # Figure3 automatically generated from a PNG file in Figure3(ver2).R			
</details>

### DE
<details><summary>code</summary>

    ├──  code 
    │ 	 ├── DE_permutation.R		   # code for implementing permutation on the genomic data
    │ 	 ├── MAST.R 	                   # code for DE analysis using MAST method
    │ 	 ├── get_p_per.R 	           # code for getting the p-values from the permutation method
    │ 	 └── DE_visual.R		   # code used for plotting Figure 4
</details>
<details><summary>sh</summary>

    ├──  sh
    │ 	 ├── DE_permutation.sh		   # sh files     
    │ 	 ├── get_p_per.sh		   
    │ 	 └── MAST.sh  
</details>
<details><summary>rout</summary>

    ├──  log files after submitting jobs
    │ 	 ├── DE_permutation.kk.Rout	     # log file for DE_permutation.sh for each permutation batch kk (kk=1,...,100)     
    │ 	 ├── get_p_per.Rout	             # log file for get_p_per.sh
    │ 	 └── MAST.Rout                       # log file for MAST.sh 
</details>
<details><summary>result</summary>
	    
    ├──  result 
    │ 	 ├── gene_names_big.rds                 # a rds file that stores the gene names
    │ 	 ├── table_orig_big_MASTtest.rds        # a rds file that stores the p-values from MAST method
    │ 	 ├── logFC_obs.rds		        # a rds file that stores the observed logFC value
    │ 	 ├── logFC_null_kk.rds		        # a rds file that stores the empirical logFC distribution from permutation method (kk=1,...,100)
    │ 	 └── empirical_pval_big_10^6_abs.rds    # a rds file that stores the p-values from permutation method
</details>
<details><summary>figure</summary>

    ├── figure   
    │ 	 └── Figure4.png		    # Figure4 in manuscript					
</details>
---
## Note

All our codes use **relative path**. So, users can run it in any working directory ([your_directory]) of their choice, but it's critical to create a subfolder structure the same as the instruction below. 

---
## Before you start
1. choose your working directory and use that name to replace "[your_directory]";
2. create the subdirectories in [your_directory], including first layer: **PoisBias**, **scenario1**, **scenario2**, **DE** and second layer: **code**, **sh**, **rout**, **result**, **figure**；
3. copy files from the repository to your folder; You only need to copy files from subfolders **code**, **sh** shown the figure below, while other files in subfolders **rout**, **result** and **figure** will be generated after running these files.

![image2](https://github.com/ubcxzhang/bigDataIssue/blob/main/Readme_illustration2.png)
---


## Running files (estimated time per job)

- Always submit your job under [your_directory] instead of a subdirectory
- The codes for plotting figures should be run after all the other codes, and we run the visualization codes on local computers
- The estimated time listed below is approximately 120% to 150% of the actual time to ensure submitted computing jobs are not killed due to overtime.
- For example, on Compute Canada, ./scenario1/sh/xx.sh runs ./scenario1/code/xx.R, saves the results at ./scenario1/result/xx, and the log files at ./scenario1/rout/xx.Rout
- For example, on local computers, for the visualization codes, ./scenario1/code/Figure2.R produces graph at ./scenario1/figure
- Note that data with bigger sample sizes requires much more computing time. So, we run experiments with smaller and bigger samples using two different approaches. The computing jobs for bigger data are split into multiple smaller jobs to use more computing nodes on HPC.
- Note that to run the code in the **DE** directory, you will need to download the original genomic dataset from the Human Cell Atlas public repository: [Human Cell Atlas Lung Atlas v1.0](https://data.humancellatlas.org/hca-bio-networks/lung/atlases/lung-v1-0) Our dataset, `altas_Epithelial_Immune.rds`, is a processed version of this original data. Due to data ownership and copyright considerations, we have not uploaded `altas_Epithelial_Immune.rds` directly in this repository. If you need access to this processed dataset, please feel free to contact us via email.

### PoisBias

For the "PoisBias" part, since it's an easy example in our work, it can be directly run on our local computers. Therefore, it's not necessary for us to use the Compute Canada to run the code of this part.

### scenario1

<details><summary> 1. running code “F_possion_per_small.R” (11 hrs)</summary>

- using loop kk equals 1 to 50 to set different sample sizes from n[1] to n[50];

    - fit the regression model;

    - use the permutation method to correct the issue;

- save file `./scenario1/result/F_type1/F_type1error_kk.rda`, `./scenario1/result/F_type1.per/F_type1error.per_kk.rda`, `./scenario1/result/F_type1.per.de/F_type1error.per.de_kk.rda`, `./scenario1/result/F_beta1.permu/F_beta1.permu_kk.rda`, `./scenario1/result/F_CI/F_CI_kk.rda`
    
</details>

 ~~~
    for kk in {1..50}; do sbatch ./scenario1/sh/F_submit_small.sh $kk; done
 ~~~


<details><summary> 2. running code “F_possion_per_big.R” (22 hrs)</summary>

- using loop kk equals 1 to 50 and loop ss equals 1 to 10 to set different sample size from n[51] to n[60] and set different batch of experiments;

    - fit the regression model;

    - use permutation method to correct the issue;

- save file `./scenario1/result/F_p.value/F_p.value_kk_ss.rda`, `./scenario1/result/F_p.value.per/F_p.value.per_kk_ss.rda`, `./scenario1/result/F_decision/F_decision_kk_ss.rda`, `./scenario1/result/F_beta1.permu/F_beta1.permu_kk_ss.rda`, `./scenario1/result/F_CI/F_CI_kk_ss.rda`
    
</details>

 ~~~
    for kk in {51..60}; do for ss in {1..10}; do sbatch ./scenario1/sh/F_submit_big.sh $kk $ss; done; done
 ~~~


### scenario2

<details><summary> 1. running code “problem.R” (16 hrs)</summary>

- using loop kk equals 1 to 60 and loop ss equals 1 to 4 to set different sample size and beta values;

    - fit the regression model to reveal the issue;

- save file `./scenario2/result/problem_typeIerror/typeIerror_kk_ss.rda`
    
</details>

 ~~~
    for kk in {1..60}; do for ss in {1..4}; do sbatch ./scenario2/sh/problem.sh $kk $ss; done; done
 ~~~
  
    
<details><summary> 2. running code “solution_small.R” (20 hrs)</summary>

- using loops for kk from 1 to 50 and ss from 1 to 4 to set different sample sizes and beta values from n[1] to n[50];

    - fit the regression model;

    - use permutation method to correct the issue;

- save file `./scenario2/result/solution_typeI/typeIerror_kk_ss.rda`, `./scenario2/result/solution_typeI.per/typeIerror.per_kk_ss.rda`, `./scenario2/result/solution_typeI.per.de/typeIerror.per.de_kk_ss.rda`, `./scenario2/result/solution_beta1.permu_small/beta1.permu_kk_ss.rda`, `./scenario2/result/solution_CI_small/CI_kk_ss.rda`
    
</details>

 ~~~
    for kk in {1..50}; do for ss in {1..4}; do sbatch ./scenario2/sh/solution_small.sh $kk $ss; done; done
 ~~~


<details><summary>3. running code “solution_big.R” (20 hrs)</summary>

- Using loops for kk from 1 to 50, ss from 1 to 4, and gg from 1 to 10 to set different sample sizes from n[51] to n[60], and to specify different beta values and batches of experiments;

    - fit the regression model;

    - use permutation method to correct the issue;

- save file `./scenario2/result/solution_p.value/p.value_kk_ss_gg.rda`, `./scenario2/result/solution_p.value.per/p.value.per_kk_ss_gg.rda`, `./scenario2/result/solution_decision/decision_kk_ss_gg.rda`, `./scenario2/result/solution_beta1.permu_big/beta1.permu_kk_ss_gg.rda`, `./scenario2/result/solution_CI_big/CI_kk_ss_gg.rda`
    
</details>

 ~~~
    for kk in {51..60}; do for ss in {1..4}; do for gg in {1..10}; do sbatch ./scenario2/sh/solution_big.sh $kk $ss $gg; done; done; done
 ~~~

### DE

<details><summary> 1. running code “MAST.R” (23 hrs)</summary>

- using MAST method to do the DE analysis;

- save file `./DE/result/table_orig_big_MASTtest.rds`

</details>

 ~~~
    sbatch ./DE/sh/MAST.sh
 ~~~


<details><summary> 2. running code “DE_permutation.R” (2 hrs)</summary>

- using loop kk equals 1 to 100 to set different batch of permutations;

    - permute the label;

    - compute the logFC values after permutation;

- save file `./DE/result/gene_names_big.rds`, `./DE/result/logFC_obs.rds`, `./DE/result/logFC_null_kk.rds` 
    
</details>

 ~~~
    for kk in {1..100}; do sbatch ./DE/sh/DE_permutation.sh $kk; done
 ~~~

<details><summary> 3. running code “get_p_per.R” (1 hrs)</summary>

- getting the p-values from the permutation method;

- save file `./DE/result/empirical_pval_big_10^6_abs.rds` 
    
</details>

 ~~~
    sbatch ./DE/sh/get_p_per.sh
 ~~~

