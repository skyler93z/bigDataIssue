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
2. create the subdirectories **code**, **rda**, **sh**, **rout**, **result**, **figure** at [your_directory]；
3. allocate all relevant files into each subdirectory. The **rout**, **result** and **figure** folders will be empty at the beginning while the **code**, **sh** and **rda** folders should look like the figure below:

![image2](https://github.com/ubcxzhang/Stock-Price-Prediction/blob/master/illustration2.png)

5. in the main directory, use the following commands to load R/4.3.1 language in Compute Canada (The environment settings in CC change occasionally, make sure to check and use their latest settings):
~~~
module load StdEnv/2023
module load gcc/xxx r/4.3.1
module load python/3.7
source $HOME/jupyter_py3/bin/activate
~~~
4. before we run the .sh files, we use in the following commands in R (version 4.3.1) to install some R packages needed for the task
~~~
install.packages(c('glmnet','xxx','xxx'))
~~~

---


## Running files (estimated time per job)

- To run the files, submit .sh files with an order of xxx
- Always submit your job under [your_directory] instead of any of the subdirectory
- xxx: The first and second jobs (e.g. "1. data cleaning", "2. feature construction") must be submitted in order; jobs "3. experiments with SVM model" and "3a. experiments with ELN model" can be submitted simultaneously; jobs "4. ensemble results with SVM model" and "4a. ensemble results with ELN model" can also be submitted at the same time; "5. figure" and "6. appendix_table" can be submitted simultaneously.
- The estimated time listed below are approximately 120% to 150% of the actual time. Usually the actual file running will be shorter.
- For example, ./sh/xx.sh runs ./code/xx.R, saves the results at ./result/xx, produce graphs at ./figure/, generates table result in Latex format at ./rout/appendix_table.Rout and the log files at ./rout/xx


<details><summary>1. running code “F-dis_before_permutation” (10 hrs)</summary>

- set sample size from 10 to 10^6;
  
- save the type one error result as `./result/type1.rda` file.

 </details>
 
 ~~~
    sbatch ./sh/ F_before_submit.sh
 ~~~


<details><summary>2. running code “F-dis_after_permutation” (15 hrs, submit 50 jobs)</summary>

- set sample size from 10 to 10^4;

- save the result of type one error before permutation as `./result/result_type1` file, and the result of type one error after permutation as `./result/result_type1.per` file.

</details>

~~~
    for kk in {1..50}; do sbatch ./sh/ F_after_submit.sh $kk; done
~~~


<details><summary> 3. experiments with SVM model (3 hrs, submit 100 jobs)</summary>
**note that this job will be submitted 100 times with random seed i from 1 to 100**

- read in R file `./result/[stock_name]_to_sample.rda`;

    - label the response variable (stock mid-price movement);

    - read in random seed i, subsample sample of 10,000 obs with 8,000 training set and 2,000 testing set;

    - data winsorization and standardization;

    - conduct experiments: baseline model without ensemble/baseline model without FPCA/baseline model without "within-window" features;

    - calculate Recall, Precision and F1 score for each experiment above;

- save file `./result/[stock_name]_i_model_svm_daily.rda`.
    
</details>


<details><summary> 3a. experiments with ELN model (3 hrs, submit 100 jobs)</summary>
**note that this job will be submitted 100 times with random seed from 1 to 100**

- read in R file `./result/[stock_name]_to_sample.rda`;

    - label the response variable (stock mid-price movement);

    - read in random seed i, subsample sample of 10,000 obs with 8,000 training set and 2,000 testing set;

    - data winsorization and standardization;

    - conduct experiments: baseline ELN model without ensemble;

    - calculate Recall, Precision and F1 score with the application of manually defined function "get Accuracy" from "wiltest.r";

- save file `./result/[stock_name]_i_eln_daily.rda`, `./result/[stock_name]_i_eln_nofpca_daily.rda`, and `./result/[stock_name]_i_eln_nowin_daily.rda`.

</details>

~~~
    for ii in {1..100}; do sbatch ./sh/sample_svm_daily.sh $ii; done
    for ii in {1..100}; do sbatch ./sh/sample_ELN_daily.sh $ii; done
 ~~~  


<details><summary> 4. ensemble results with SVM model (6 hrs, submit 30 jobs)</summary>
    **SVM model ensemble is too slow, divide it into 30 separate jobs representing 30 targeted stocks**

- using loop i equals 1 to 100 and read in data `./result/[stock_name]_i_model_svm_daily.rda`;

    - skip experiments that don't have converged results;

    - use the voting scheme to make final predictions;

    - calculate Recall, Precision and F1 score for each ensemble experiment (e.g. baseline model/baseline model without FPCAs/baseline model without "within-window" vars);

- store all accuracy as R file `./result/[stock_name]_svm_ensemble_model_daily.rda`.
    
</details>


<details><summary> 4a. ensemble results with ELN model (6 hrs)</summary>

- using loop i equals 1 to 100 and read in data `./result/[stock_name]_i_eln_daily.rda`;

    - skip experiments that don't have converged results;

    - use the voting scheme to make final predictions;

    - calculate Recall, Precision and F1 score for the ensemble experiment (e.g. baseline model with ELN);

- store all accuracy as R file `./result/[stock_name]_eln_ensemble_model_daily.rda`.
        
</details>

~~~
    for ii in {1..30}; do sbatch ./sh/ensemble_svm_daily.sh $ii; done
    sbatch ./sh/ensemble_ELN_daily.sh
~~~ 

customized R functions are defined in `wiltest.R` file; `figure.R` and `appendix_table.R` produce visualizations and table results, which can be run on local server

<details><summary> 5. generating figures in the paper (10 mins)</summary>
- read in data `./rda/dow_jones30_daily.csv`;

    - illstrates the daily price change of Dow Jones 30 index;

- store figure 1 `./figure/dj30.pdf (Figure2.pdf)`.

- using loop i equals 1 to 30 and read in data `./result/[char_name]_svm_ensemble_model_daily.rda`;

    - produces boxplots using ggplot;

    - shows comparisons between baseline model v.s. ensemble model, baseline model v.s. no FPCA model, and baseline model v.s. no within-window model;

- store figure 2 `./figure/combined_plot_daily.pdf (Figure3.pdf)`.

- read in data `./result/[stock_name]_i_eln_daily.rda`, `./result/[stock_name]_i_eln_nofpca_daily.rda`, and `./result/[stock_name]_i_eln_nowin_daily.rda`;

    - produces boxplots using ggplot;

    - shows comparisons between baseline model v.s. ensemble eln model, baseline model v.s. no FPCA model, and baseline model v.s. no within-window model;

- store figure 3 `./figure/combined_plot_eln_daily.pdf (Figure4.pdf)`.
    
- using loop k equals 1 to 30 and read in data `./result/[char_name]_k_eln_daily.rda`;

    - produces barplots using ggplot;

    - shows histogram of selected variables by ELN model in all three mid-price direction;

- store figure 4 `./figure/barplot.pdf (Figure5.pdf)`.
    
        
</details>

~~~
    sbatch ./sh/figure.sh
~~~ 
<details><summary> 6. produces tables in the paper (30 mins)</summary>
**All the table results output are in latex format, they are printed in the log file at './rout/appendix_table.Rout'**

- produces table1 showing the median values of Recall, Precision and F1 score of the baseline model over all 100 experiments;

- produces table2 showing the median values of Recall, Precision and F1 score of the ensemble with SVM, nofpca, and no within-win models over all 100 experiments respectively;

- produces tables showing the summary statistics of the features of the full sample, read in data `./rda/mkt_cap.csv`;

- save file `./result/intermedia_table.rda`
        
</details>

~~~
    sbatch ./sh/appendix_table.sh
~~~ 
