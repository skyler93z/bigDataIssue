rm(list = ls(all = TRUE))

args = commandArgs(trailingOnly = TRUE)
kk = as.numeric(args[1]) #sample size
ss = as.numeric(args[2]) # beta

time1 = Sys.time()
print(time1)

set.seed(123)

# Sample size
k = c(seq(1, 2, length.out = 30), seq(2, 5, length.out = 31)) # Set the 10^k as the volume of sample size
k = k[-31] # Remove duplicates
n = round(10^k)

# Beta
beta1 = 0
beta_coef = data.frame(list(c(0.3, 0.7), c(0.3, 0.8), c(0.5, 0.7), c(0.5, 0.8)))

# Set the number of experiments
nexperiment = 1000
alpha = 0.05

# Initialize a vector to store results
type_one = numeric(length(n))

sample_size = n[kk]
beta = beta_coef[,ss]
p.value = numeric(nexperiment)

# Loop over each experiment
for(ii in 1:nexperiment) {
  x1 = rnorm(sample_size,mean = 0, sd=1)
  x2 = rnorm(sample_size,mean = 0, sd=1)
  
  lambda = exp(beta[1] + beta1 * x1 + beta[2] * x2)
  y = rpois(sample_size, lambda)
  df_pois = data.frame(x1, y)
  mod_pois = glm(y ~ x1, data = df_pois, family = "poisson")
  
  # Store results
  p.value[ii] = summary(mod_pois)$coefficient[2,4] < alpha
}

# Calculate the type I error rate
type_one[ss] = sum(p.value)/nexperiment

# Save the result
saveRDS(type_one, file = paste0("result_fig3/problem/type_one_",kk,"_",ss,".rds"))

time2 = Sys.time()
print(time2 - time1)
q(save = "no")