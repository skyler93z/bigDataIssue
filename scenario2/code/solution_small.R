rm(list = ls(all = TRUE))

args = commandArgs(trailingOnly = TRUE)
kk = as.numeric(args[1]) #sample size
ss = as.numeric(args[2]) # beta

time1 = Sys.time()
print(time1)

set.seed(123)
k = c(seq(1, 2, length.out = 30), seq(2, 5, length.out = 31)) # Set the 10^k as the volume of sample size
k = k[-31] # Remove duplicates
n = round(10^k)  # Sample size
nexperiment = 1000 # Number of experiments
sample_size = n[kk]
N = 1000 # Number of permutation
alpha = 0.05

beta1 = 0 # beta1
beta_coef = data.frame(list(c(0.3, 0.7), c(0.3, 0.8), c(0.5, 0.7), c(0.5, 0.8))) # beta0, beta2
beta = beta_coef[,ss]

p.value = rep(NA, nexperiment) # To store each p-value of beta1
p.value.per = rep(NA, nexperiment) # To store each p-value of beta1 after permutation

typeIerror = NA # To store the true type one error
typeIerror.per = NA # To store the type one error after permutation
typeIerror.per.de = NA

beta1.permu = matrix(NA, N, nexperiment) # To store all the beta after each permutation and each experiment
decision = rep(NA, nexperiment) # to store each decision: 1 => reject; 0 => not reject
CI = matrix(NA, nexperiment, 2) # To store the confidence interval for each experiment after permutation

permu = function(alpha, N, sample_size, x1, y, orig_beta){
  # Function to perform permutation test
  # N: Number of permutations
  # sample_size: Size of the sample
  # x1: Predictor variable
  # y: Response variable
  # orig_beta: Original beta coefficient
  
  #---------------permutation--------------
  count = 0 
  beta.per = rep(NA, N) # To store the beta1 after each permutation
  
  for (j in 1:N){ # for each permutation
    
    idx = sample(1:sample_size) # permutate the index of x1
    x1.per = x1[idx] # x1 after the permutation
    fit.per = glm(y~x1.per, family = "poisson")
    beta.per[j] = summary(fit.per)$coef[2,1] # get the beta1 after permutation
    if (abs(beta.per[j]) >= abs(orig_beta)) {
      count = count + 1
    }
  }
  
  ### get the decision
  beta.order = beta.per[order(beta.per)] # order all the beta1
  lower = beta.order[N*(alpha/2)]
  upper = beta.order[N*(1 - alpha/2)]
  decision.per = ifelse(orig_beta <= upper & orig_beta > lower, 0, 1)
  
  ### get the new p-value
  p = count/N
  
  return(list(decision.per, p, beta.per, c(lower, upper)))
  
}

for (i in 1:nexperiment){ # for each experiment
  
  x1 = rnorm(sample_size, mean = 0, sd = 1) # generate x1 for normal distribution
  x2 = rnorm(sample_size, mean = 0, sd = 1) # generate x2 for normal distribution
  lambda = exp(beta[1] + beta1 * x1 + beta[2] * x2)
  y = rpois(sample_size, lambda) # generate y for poisson distribution
  
  df = data.frame(x1, y)
  fit = glm(y ~ x1, data = df, family = "poisson") # Fit the model for the original data
  
  orig_beta = summary(fit)$coef[2,1]
  p.value[i] = summary(fit)$coef[2,4]
  permutation = permu(alpha, N, sample_size, x1, y, orig_beta)
  p.value.per[i] = permutation[[2]]
  decision[i] = permutation[[1]]
  beta1.permu[ ,i] = permutation[[3]]
  CI[i, ] = permutation[[4]]
  
}

typeIerror = mean(p.value < alpha)
typeIerror.per = mean(p.value.per < alpha)
typeIerror.per.de = sum(decision)/nexperiment

save(typeIerror, file = paste0("./scenario2/result/solution_typeI/typeIerror_",kk,"_",ss,".rda"))
save(typeIerror.per, file = paste0("./scenario2/result/solution_typeI.per/typeIerror.per_",kk,"_",ss,".rda"))
save(typeIerror.per.de, file = paste0("./scenario2/result/solution_typeI.per.de/typeIerror.per.de_",kk,"_",ss,".rda"))
save(beta1.permu, file = paste0("./scenario2/result/solution_beta1.permu_small/beta1.permu_",kk,"_",ss,".rda"))
save(CI, file = paste0("./scenario2/result/solution_CI_small/CI_",kk,"_",ss,".rda"))

time2 = Sys.time()
print(time2 - time1)
q(save = "no")