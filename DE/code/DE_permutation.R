rm(list = ls())

library(Seurat)
library(MAST)

args = commandArgs(trailingOnly = TRUE)
kk = as.numeric(args[1])

set.seed(kk)

time1 = Sys.time()
print(time1)
### ---------getting original data---------
seurat_obj <- readRDS("./DE/altas_Epithelial_Immune.rds")
seurat_obj <- subset(seurat_obj, subset = cell_type %in% c("alveolar macrophage", "type II pneumocyte"))

# alveolar macrophage  type II pneumocyte 
# 78816               62405 
# [1]  28024 141221

seurat_obj@meta.data$cell_type <- droplevels(seurat_obj@meta.data$cell_type)
Idents(seurat_obj) <- seurat_obj@meta.data$cell_type

## getting gene names
gene_names <- rownames(seurat_obj)

if (kk == 1){
  saveRDS(gene_names, file = "./DE/result/gene_names_big.rds")
}

### -----------permutation----------
compute_perm_logFC <- function(X, Y, NN = 10000, batch.size = 1000, pseudocount = 1e-6) {
  # X: G × N matrix of counts (genes × cells)
  # Y: binary vector of length N (1=in‐type, 0=out‐type)
  G <- nrow(X)
  N <- ncol(X)
  stopifnot(length(Y) == N)
  
  # Precompute constants
  n1    <- sum(Y)          # number of in‐type cells
  n0    <- N - n1          # number of out‐type cells
  Stot  <- rowSums(X)      # total counts per gene
  
  # 1) Observed logFC
  S_in_obs   <- X %*% Y                       # G×1
  mean_in_obs  <- S_in_obs / n1
  mean_out_obs <- (Stot - as.numeric(S_in_obs)) / n0
  logFC_obs    <- log2((mean_in_obs + pseudocount) /
                         (mean_out_obs + pseudocount))
  
  # 2) Prepare storage for null distribution
  logFC_null <- matrix(NA_real_, nrow = G, ncol = NN)
  
  # 3) Permutation in batches
  n_batches <- ceiling(NN / batch.size)
  for (b in seq_len(n_batches)) {
    # indices for this batch
    idx_start <- (b - 1) * batch.size + 1
    idx_end   <- min(b * batch.size, NN)
    nb        <- idx_end - idx_start + 1
    
    # build permutation matrix for this batch: N × nb
    P_batch <- replicate(nb, sample(Y), simplify = "matrix")
    
    
    # compute in‐type and out‐type sums for all genes × nb perms
    S_in_p    <- X %*% P_batch                    # G × nb
    S_out_p   <- matrix(Stot, nrow = G, ncol = nb) - S_in_p
    
    # means
    mean_in_p  <- S_in_p  / n1
    mean_out_p <- S_out_p / n0
    
    # log‐fold‐changes
    # logFC_batch <- log2((mean_in_p + pseudocount) /
    #                       (mean_out_p + pseudocount))
    # 
    logFC_batch <- matrix(
      log2((mean_in_p + pseudocount) / (mean_out_p + pseudocount)),
      nrow = G, ncol = nb
    )
    
    # store
    logFC_null[, idx_start:idx_end] <- logFC_batch
  }
  
  return(list(
    observed = logFC_obs,  # G‐vector
    null     = logFC_null  # G × NN matrix (in batches)
  ))
}

# ---------read data---------
X <- GetAssayData(seurat_obj, slot = "counts")

cell_type_vector <- seurat_obj@meta.data$cell_type   
target_type <- "alveolar macrophage"

Y <- as.numeric(cell_type_vector == target_type)

stopifnot(length(Y) == ncol(X))

result <- compute_perm_logFC(X = X, Y = Y)

logFC_obs <- result$observed       
logFC_null <- result$null          

if (kk == 1){
  saveRDS(logFC_obs, file = "./DE/result/logFC_obs.rds")
}

saveRDS(logFC_null, file = paste0("./DE/result/logFC_null_",kk,".rds"))


time2 = Sys.time()
print(time2 - time1)

