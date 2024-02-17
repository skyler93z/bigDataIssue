# Minor Issues Escalated to Critical Levels in Large Samples: A Permutation-Based Fix
---

## About this Project
In the big data era, the need to reevaluate traditional statistical methods is paramount due to the challenges posed by vast datasets. While larger samples theoretically enhance accuracy and hypothesis testing power without increasing false positives, practical concerns about inflated Type-I errors persist. The prevalent belief is that larger samples can uncover subtle effects, necessitating dual consideration of p-value and effect size. Yet, the reliability of p-values from large samples remains debated.

This project warns that larger samples can exacerbate minor issues into significant errors, leading to false conclusions. Through our simulation study, we demonstrate how growing sample sizes amplify issues arising from two commonly encountered violations of model assumptions in real-world data and lead to incorrect decisions. This underscores the need for vigilant analytical approaches in the era of big data. In response, we introduce a permutation-based test to counterbalance the effects of sample size and assumption discrepancies by neutralizing them between actual and permuted data. We demonstrate that this approach effectively stabilizes nominal Type I error rates across various sample sizes, thereby ensuring robust statistical inferences even amidst breached conventional assumptions in big data.

For reproducibility, we build this repository to share our original codes, results, figures and all the other things used in our manuscript.

---
## Directory Layout
![image](https://github.com/ubcxzhang/bigDataIssue/blob/main/Readme_illustration1.png)

### Note
Under the main directory, we have multiple layers of subdirectory. The first layer is the three different examples: "PoisBias" is corresponding to Chapter3.1 of our manuscript; "scenario1" and "scenario2" are corresponding to the two assumption violation scenarios mentioned in Chapter 3.2 of our manuscript. The second layer is the "code", "result", "sh", "figure", "rout" files.

We assume the user set the default directory at **Cedar** at Compute Canada
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
    │ 	 └── Figure.2		    # Figure2 in manuscript					
</details>

### scenario2
<details><summary>code</summary>

    ├──  code 
    │ 	 ├── problem.R		        # code for outcomes influenced by an unobserved predictor scenario
    │ 	 ├── solution_small.R		# code for a solution when the sample size ranges from 10^1 to 10^4
    │ 	 ├── solution_big.R		# code for a solution when the sample size ranges from 10^4 to 10^5 
    │ 	 ├── Figure3(ver1).R		# code used to plot Figure 3, generated by exporting 'save as image' in R
    │ 	 ├── Figure3(ver2).R		# code used to automatically generate Figure 3 from a PNG file				
</details>
<details><summary>sh</summary>

    ├──  sh
    │ 	 ├── problem_sh		        # sh files
    │ 	 ├── solution_small_sh							
    │ 	 ├── solution_big_sh							
</details>
<details><summary>rout</summary>

    ├──  log files after submitting jobs
    │ 	 ├── problem.Rout	         # log files for problem_sh for each sample size (kk = 1,...,60) and beta values (ss = 1,...,4)
    │ 	 ├── solution_small.Rout         # log file for solution_small_sh for each sample size (kk = 1,...,50)
    │ 	 ├── solution_big.Rout		 # log file for solution_big_sh for each sample size (kk = 1,...,50) and experiment batch (gg = 1,...,10).
</details>
<details><summary>result (final & intermedia results)</summary>
		    
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
    │ 	 ├── Figure3(ver2).png		 # Figure3 automatically generated from a PNG file in Figure3(ver2).R			
</details>

---
## Notice

As all the processes are conducted using the **relative path**, it's very important to set up [your_directory] and use it correctly. 

If you are not sure about the path of your working folder, try to type in 'pwd' command in linux or 'getwd()' in R language for reference. 

---
## Before you start
1. decide the path of [your_directory] to replicate our results;
2. create the subdirectories, first layer: **PoisBias**, **scenario1**, **scenario2**; and second layer: **code**, **sh**, **rout**, **result**, **figure** at [your_directory]；
3. remember to create another layer of subdirectories under the **result** subdirectory of "scenario1" and "scenario2" to store the different results of the codes;
4. allocate all relevant files into each subdirectory. The **rout**, **result** and **figure** folders will be empty at the beginning while the **code**, **sh** folders should look like the figure below:

![image2](https://github.com/ubcxzhang/bigDataIssue/blob/main/Readme_illustration2.png)

---


## Running files (estimated time per job)

- Always submit your job under [your_directory] instead of any of the subdirectory
- The codes for plotting figures should be run after all the other codes, and we run the visualization codes on local computers
- The estimated time listed below are approximately 120% to 150% of the actual time. Usually the actual file running will be shorter.
- For example, on Compute Canada, ./scenario1/sh/xx.sh runs ./scenario1/code/xx.R, saves the results at ./scenario1/result/xx, and the log files at ./scenario1/rout/xx.Rout
- For example, on local computers, for the visualization codes, ./scenario1/code/Figure2.R produce graph at ./scenario1/figure

### scenario1

<details><summary> 1. running code “F_possion_per_small.R” (11 hrs)</summary>

- using loop kk equals 1 to 50 to set different sample size from n[1] to n[50];

    - fit the regression model;

    - use permutation method to correct the issue;

- save file `./scenario1/result/F_type1/F_type1error_kk.rda`, `./scenario1/result/F_type1.per/F_type1error.per_kk.rda`, `./scenario1/result/F_type1.per.de/F_type1error.per.de_kk.rda`, `./scenario1/result/F_beta1.permu/F_beta1.permu_kk.rda`, `./scenario1/result/F_CI/F_CI_kk.rda`
    
</details>

 ~~~
    for kk in {1..50}; do sbatch ./scenario1/sh/F_submit_small.sh $kk; done
 ~~~


<details><summary>2. running code “F_possion_per_big.R” (22 hrs)</summary>

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
    for kk in {1..60}; do for ss in {1..4}; do sbatch ./scenario2/sh/problem_sh $kk $ss; done; done
 ~~~
  
    
<details><summary> 2. running code “solution_small.R” (20 hrs)</summary>

- using loops for kk from 1 to 50 and ss from 1 to 4 to set different sample sizes and beta values from n[1] to n[50];

    - fit the regression model;

    - use permutation method to correct the issue;

- save file `./scenario2/result/solution_typeI/typeIerror_kk_ss.rda`, `./scenario2/result/solution_typeI.per/typeIerror.per_kk_ss.rda`, `./scenario2/result/solution_typeI.per.de/typeIerror.per.de_kk)ss.rda`, `./scenario2/result/solution_beta1.permu_small/beta1.permu_kk_ss.rda`, `./scenario2/result/solution_CI_small/CI_kk_ss.rda`
    
</details>

 ~~~
    for kk in {1..50}; do for ss in {1..4}; do sbatch ./scenario2/sh/solution_small_sh $kk $ss; done; done
 ~~~


<details><summary>3. running code “solution_big.R” (20 hrs)</summary>

- Using loops for kk from 1 to 50, ss from 1 to 4, and gg from 1 to 10 to set different sample sizes from n[51] to n[60], and to specify different beta values and batches of experiments;

    - fit the regression model;

    - use permutation method to correct the issue;

- save file `./scenario2/result/solution_p.value/p.value_kk_ss_gg.rda`, `./scenario2/result/solution_p.value.per/p.value.per_kk_ss_gg.rda`, `./scenario2/result/solution_decision/decision_kk_ss_gg.rda`, `./scenario2/result/solution_beta1.permu_big/beta1.permu_kk_ss)gg.rda`, `./scenario2/result/solution_CI_big/CI_kk_ss_gg.rda`
    
</details>

 ~~~
    for kk in {51..60}; do for ss in {1..4}; do for gg in {1..10}; do sbatch ./scenario2/sh/solution_big_sh $kk $ss $gg; done; done; done
 ~~~

