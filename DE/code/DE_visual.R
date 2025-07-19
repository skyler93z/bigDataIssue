precision = 1e-7

gene_names <- readRDS("./DE/result/gene_names_big.rds")    

#----------MAST-------
table_orig_MAST = readRDS("./DE/result/table_orig_big_MASTtest.rds")
table_sorted_MAST <- table_orig_MAST[gene_names, , drop = FALSE]

pval_orig_MAST <- table_sorted_MAST$p_val            

sum(is.na(pval_orig_MAST))

pval_orig_MAST[is.na(pval_orig_MAST)] <- precision

pval_orig_FDR_MAST = p.adjust(pval_orig_MAST, method = "BH")
min(pval_orig_FDR_MAST)
pval_orig_FDR_MAST[pval_orig_FDR_MAST <= precision] <- precision

#--------permutation(10^6)---------
pval_per = readRDS("./DE/result/empirical_pval_big_10^6_abs.rds")
pval_per_FDR = p.adjust(pval_per, method = "BH") 
min(pval_per_FDR)
pval_per_FDR[pval_per_FDR == 0] <- precision


#--------making table------
cut_pval_orig_FDR_MAST <- cut(pval_orig_FDR_MAST, breaks = c(-Inf, min(pval_orig_FDR_MAST), 0.05, Inf),
                              labels = c("= min", "(min, 0.05]", "> 0.05"), right = TRUE)
cut_pval_per_FDR <- cut(pval_per_FDR, breaks = c(-Inf, min(pval_per_FDR), 0.05, Inf),
                        labels = c("= min", "(min, 0.05]", "> 0.05"), right = TRUE)
table(cut_pval_orig_FDR_MAST, cut_pval_per_FDR)
#---------scatter plot--------
library(ggplot2)

df_scatter <- data.frame(
  x = -log10(pval_orig_FDR_MAST),
  y = -log10(pval_per_FDR)
)

ggplot(df_scatter, aes(x = x, y = y)) +
  geom_point(alpha = 0.5, size = 0.3, color = "black") +
  #geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red", lwd = 1) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "blue", lwd = 1) +
  geom_vline(xintercept = -log10(0.05), linetype = "dashed", color = "blue", lwd = 1) +
  annotate("text", x = 0.6, y = 4.3, label = "233", size = 5, color = "blue", fontface = "bold") +
  annotate("text", x = 0.6, y = 4, label = "genes", size = 5, color = "blue", fontface = "bold") +
  annotate("text", x = 4, y = 0.8, label = "1234", size = 5, color = "blue", fontface = "bold") +
  annotate("text", x = 4, y = 0.5, label = "genes", size = 5, color = "blue", fontface = "bold") +
  labs(
    x = expression(-log[10]~"(FDR-adjusted MAST p-values)"),
    y = expression(-log[10]~"(FDR-adjusted Permutation p-values)"),
    title = ""
  ) +
  theme_minimal(base_size = 13)
