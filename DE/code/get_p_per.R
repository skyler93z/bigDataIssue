rm(list = ls())
time1 = Sys.time(); print(time1)

path_prefix <- "./DE/result/"

logFC_obs <- readRDS("./DE/result/logFC_obs.rds")  # G × 1
logFC_obs_vec <- as.vector(logFC_obs)
n_gene <- length(logFC_obs_vec)
n_small_perm = 10000

empirical_count <- numeric(n_gene)


abs_logFC_obs_vec <- abs(logFC_obs_vec)


for (kk in 1:100) {
  file_path <- paste0(path_prefix, "logFC_null_", kk, ".rds")
  logFC_null_part <- readRDS(file_path)  # G × NN
  
  abs_logFC_obs_vec_mat <- matrix(abs_logFC_obs_vec, nrow = n_gene, ncol = n_small_perm, byrow = F)
  
  empirical_count <- empirical_count +
    rowSums(abs(logFC_null_part) >= abs_logFC_obs_vec_mat)
  
  print(paste0("Finished part ", kk))
}

n_perm_total <- ncol(logFC_null_part) * 100

empirical_pval_new <- empirical_count / n_perm_total


saveRDS(empirical_pval_new, file = "./DE/result/empirical_pval_big_10^6_abs.rds")

time2 = Sys.time(); print(time2 - time1)
