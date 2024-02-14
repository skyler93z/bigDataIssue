# Minor Issues Escalated to Critical Levels in Large Samples: A Permutation-Based Fix
---

## About this Project
In statistical theory, a bigger sample size is always preferred if we do not need to consider the cost of data collection and computing resources. However, in the real world, the assumptions of statistical theory are often not satisfied. In this case, the negative effect of big sample size may occur since when the sample size increases, the difference between the real setting and the ideal setting will also get more and more significant, which may exacerbate the performance of statistical analysis. This project aims to reveal the problem of big sample size through data simulation and then find solution to solve this issue.

---
## Directory Layout
![image](https://github.com/ubcxzhang/bigDataIssue/blob/main/illustration_v1.png)

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

    ├── code  
    │    ├── F_possion_per_small.R		    # code for distribution misspecification scenario when sample size is from 10 to 10^2
    │ 	 ├── F_possion_per_big.R 		# code for distribution misspecification scenario when sample size is from 10^2 to 10^5 
    │ 	 ├── Figure1.R		    # code used for plotting Figure 1
    │ 	 ├── Figure2.R			# code used for plotting Figure 2
    │ 	 ├── xxx.R			    #     
    │ 	 ├── xxx.R			    #     
    │ 	 ├── xxx.R			    #     
    │ 	 ├── xxx.R		        # 
    │ 	 └── xxx.R  	        # 					
</details>
<details><summary>sh</summary>

    ├── sh  
    │    ├── F_submit_small.sh		# sh files
    │ 	 ├── F_submit_big.sh					
    │ 	 ├── xxx.sh 			
    │ 	 ├── xxx.sh 			
    │ 	 ├── xxx.sh
    │ 	 ├── xxx.sh
    │ 	 ├── xxx.sh
    │ 	 └── xxx.sh				
</details>
<details><summary>rout</summary>

    ├──  log files after submitting jobs
    │    ├── data_cleaning.Rout		    # log file for data_cleaning.sh
    │ 	 ├── feature_encoding.Rout		# log file for feature_encoding.sh
    │ 	 ├── sample_svm_daily.i.Rout 			# log file for sample_svm.sh for each seed i (i=1,...,100)
    │ 	 ├── sample_ELN_daily.i.Rout	    # log file for sample_ELN_full.sh for each seed i (i=1,...,100)     
    │ 	 ├── ensemble_svm_daily.Rout			# log file for ensemble_svm.sh 
    │ 	 ├── ensemble_ELN_daily.Rout 		    # log file for ensemble_ELN.sh
    │ 	 ├── figure.Rout                # log file for figure.sh
    │ 	 └── appendix_table.Rout        # log file for appendix_table.sh, generated Latex tables will be stored here
</details>
<details><summary>result (final & intermedia results)</summary>
		    
    ├──  result 
    │ 	 ├── result_type1		        # a file that stores the rda results from the setting of F-distribution before permutation(sample size from 10 to 10^4)       	
    │ 	 ├── result_type1.per		    # a file that stores the rda results from the setting of F-distribution after permutation(sample size from 10 to 10^4)
    │ 	 └── type1.rda		        # a file that stores the results from the setting of F-distribution before permutation(sample size from 10 to 10^6)
</details>
<details><summary>figure</summary>

    ├── figure    
    │ 	 ├── xxx.pdf (Figure.pdf)
    │ 	 ├── xxx.pdf (Figure.pdf)
    │ 	 ├── xxx.pdf (Figure.pdf)
    │ 	 └── xxx.pdf (Figure.pdf)					
</details>

---
## Notice

As all the processes are conducted using the relative path, it's very important to set up [your_directory] and use it correctly. 
[your_directory] should be consisted of three parts: part 1 is ```/project/6003851/``` to ensure all the files can run on Compute Canada; part 2 is your ```user name``` at Compute Canada; part 3 is your ```folder's name```. For example, the writer's directory is as follows:

~~~
/project/6003851/y2huang/big_sample_size_project/check
~~~

If you are not sure about the path of your working folder, try to type in 'pwd' command in linux or 'getwd()' in R language for reference. 

---
## Before you start
1. decide the path of [your_directory] to replicate our results;
2. create the subdirectories, first layer: **PoisBias**, **scenario1**, **scenario2**; and second layer: **code**, **sh**, **rout**, **result**, **figure** at [your_directory]；
3. create another layer of subdirectories **F_beta1.permu**, **F_CI**, **F_decision**, **F_p.value**, **F_p.value.per**, **F_type1**, **F_type1.per**, **F_type1.per.de** under the **result** subdirectory of "scenario1" and "scenario2" to store the different results of the codes;
4. allocate all relevant files into each subdirectory. The **rout**, **result** and **figure** folders will be empty at the beginning while the **code**, **sh** folders should look like the figure below:

![image2](https://github.com/ubcxzhang/Stock-Price-Prediction/blob/master/illustration2.png)

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


<details><summary>2. running code “F_possion_per_big.R” (15 hrs)</summary>

- using loop kk equals 1 to 50 and loop ss equals 1 to 10 to set different sample size from n[51] to n[60] and set different batch of experiments;

    - fit the regression model;

    - use permutation method to correct the issue;

- save file `./scenario1/result/F_p.value/F_p.value_kk_ss.rda`, `./scenario1/result/F_p.value.per/F_p.value.per_kk_ss.rda`, `./scenario1/result/F_decision/F_decision_kk_ss.rda`, `./scenario1/result/F_beta1.permu/F_beta1.permu_kk_ss.rda`, `./scenario1/result/F_CI/F_CI_kk_ss.rda`
    
</details>

 ~~~
    for kk in {51..60}; do for ss in {1..10}; do sbatch ./scenario1/sh/F_submit_big.sh $kk $ss; done; done
 ~~~


### scenario2

