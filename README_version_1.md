# [title of the big sample size project]
---

## About this Project
In statistical theory, a bigger sample size is always preferred if we do not need to consider the cost of data collection and computing resources. However, in the real world, the assumptions of statistical theory are often not satisfied. In this case, the negative effect of big sample size may occur since when the sample size increases, the difference between the real setting and the ideal setting will also get more and more significant, which may exacerbate the performance of statistical analysis. 

---
## Directory Layout
![image](https://github.com/ubcxzhang/Stock-Price-Prediction/blob/master/illustration_v1.png)

We assume the user set the default directory at **Graham** at Compute Canada
~~~
    [your_deirctory]  
~~~
all the R codes are in the subdirectory directory at **code** 
~~~
    [your_deirctory]/code  
~~~
all data to produce graphs is in the subdirectory directory at **rda** 
~~~
    [your_deirctory]/rda  
~~~
all the .sh files that run the R files are in the subdirectory directory at **sh** 
~~~
    [your_deirctory]/sh  
~~~
all the log files are in the subdirectory directory at **rout** 
~~~
    [your_deirctory]/rout  
~~~
all the final results/intermedia results are in the subdirectory directory at **result** 
~~~
    [your_deirctory]/result  
~~~
all the graphs in the paper are in the subdirectory directory at **figure** 
~~~
    [your_deirctory]/figure  
~~~

<details><summary>code</summary>

    ├── code  
    │    ├── F-dis_before_permutation.R		    # setting of F-distribution before permutation 
    │ 	 ├── F-dis_after_permutation.R 		# setting of F-distribution after permutation 
    │ 	 ├── F-dis_visualization.R		    # using the results of F-distribution to do visualization
    │ 	 ├── xxx.R			#     
    │ 	 ├── xxxy.R			#     
    │ 	 ├── xxx.R			#     
    │ 	 ├── xxx.R			#     
    │ 	 ├── xxx.R		        # 
    │ 	 └── xxx.R  	        # 					
</details>
<details><summary>rda</summary>

    ├── rda    
    │ 	 ├── result_type1		        # a file that stores the rda results from the setting of F-distribution before permutation(sample size from 10 to 10^4)
    │ 	 ├── result_type1.per		    # a file that stores the rda results from the setting of F-distribution after permutation(sample size from 10 to 10^4)
    │ 	 └── type1.rda		        # a file that stores the results from the setting of F-distribution before permutation(sample size from 10 to 10^6)				
</details>
<details><summary>sh</summary>

    ├── sh  
    │    ├── F_before_submit.sh		# sh files
    │ 	 ├── F_after_submit.sh					
    │ 	 ├── xxx.sh 			
    │ 	 ├── xxx.sh 			
    │ 	 ├── xxx.sh
    │ 	 ├── xxx.sh
    │ 	 ├── figure.sh
    │ 	 └── appendix_table.sh				
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
<details><summary>results (final & intermedia results)</summary>

    ├──  intermedia result
    │    ├── [stock_name]_final.rda		    # after cleaning the raw data for each component stock 
    │ 	 ├── [stock_name]_to_sample.rda		# feature construction for each component stock
    │ 	 ├── [stock_name]_i_model_svm_daily.rda 			# single experiments with SVM model for each component stock (i=1,...,100)
    │ 	 ├── [stock_name]_i_eln_daily.rda			# single experiments with ELN model for each component stock (i=1,...,100)    
    │ 	 ├── [stock_name]_i_eln_nofpca_daily.rda			  
    │ 	 ├── [stock_name]_i_eln_nowin_daily.rda			    
    ├──  final result 
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
install.packages(c('dbplyr','data.table','glmnet','fdapace','ggplot2','RColorBrewer','bit64', 'reshape2','graphics', 'e1071', 'caret', 'stringr', 'MTPS', 'Matrix', 'tidyr', 'xtable'))
~~~

---


## Running files (estimated time per job)

- To run the files, submit .sh files with an order of 1. data cleaning.R to 6. appendix_table.R
- Always submit your job under [your_directory] instead of any of the subdirectory
- The first and second jobs (e.g. "1. data cleaning", "2. feature construction") must be submitted in order; jobs "3. experiments with SVM model" and "3a. experiments with ELN model" can be submitted simultaneously; jobs "4. ensemble results with SVM model" and "4a. ensemble results with ELN model" can also be submitted at the same time; "5. figure" and "6. appendix_table" can be submitted simultaneously.
- The estimated time listed below are approximately 120% to 150% of the actual time. Usually the actual file running will be shorter.
- For example, ./sh/xx.sh runs ./code/xx.R, saves the results at ./result/xx, produce graphs at ./figure/, generates table result in Latex format at ./rout/appendix_table.Rout and the log files at ./rout/xx


<details><summary>1. data cleaning (10 hrs)</summary>

- read in the raw dataset from `/projects/def-ubcxzh/SharedData/NYSE16/GroupingResult/NBBO/`, load './rda/date.rda' and './code/wiltest.r';

    - select the Dow Jones 30 component stocks of our interest and save each stock as a single R file;

    - select the same set of variables for each stock data;

    - basic stock price cleaning as stated in the paper in section "Data Manipulation";

    - generate FPCA variables for each stock;

- after data cleaning, save each stock price dataset as `./result/[stock_name]_final.rda` file.

 </details>
 
 ~~~
    sbatch ./sh/data_cleaning.sh
~~~


<details><summary>2. feature construction (3hrs)</summary>

- read in read in `./result/[stock_name]_final.rda` file;

    - create all variables listed in "Multi-resolution Features Construction" in our paper except FPCAs;

- save new R file `./result/[stock_name]_to_sample.rda` file.

</details>

~~~
    sbatch ./sh/feature_encoding.sh
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
