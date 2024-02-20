rm(list = ls(all = TRUE))

library(splines)

k = c(seq(1, 2, length.out = 30), seq(2, 5, length.out = 31)) # Set the 10^k as the volume of sample size
k = k[-31] # Remove duplicates
n = round(10^k)  # Sample size
nn = length(n)
nexperiment = 1000
alpha = 0.05

# beta
beta1 = 0
beta_coef = data.frame(list(c(0.3, 0.7), c(0.3, 0.8), c(0.5, 0.7), c(0.5, 0.8)))
bb = length(beta_coef)

# Data
data = matrix(NA, nn, bb)
data.pval = matrix(NA, nn, bb)
colnames(data) = c("beta0=0.3, beta2=0.7", "beta0=0.3, beta2=0.8", 
                   "beta0=0.5, beta2=0.7", "beta0=0.5, beta2=0.8")
colnames(data.pval) = c("beta0=0.3, beta2=0.7", "beta0=0.3, beta2=0.8", 
                        "beta0=0.5, beta2=0.7", "beta0=0.5, beta2=0.8")

for(kk in 1:nn){ # problem values
  idx = numeric(bb)
  for (ss in 1:bb) {
    load(paste0("./scenario2/result/problem_typeIerror/typeIerror_",kk,"_",ss,".rda"))
    idx[ss] = typeIerror[ss]
  }
  data[kk,] = idx
}

for(kk in 1:50){ # solution values for sample size 1:50
  idx = numeric(bb)
  for (ss in 1:bb) {
    load(paste0("./scenario2/result/solution_typeI.per/typeIerror.per_",kk,"_",ss,".rda"))
    idx[ss] = typeIerror.per
  }
  data.pval[kk,] = idx
}

for(kk in 51:60){ # solution values for sample size 51:60
  for (ss in 1:bb) {
    p.value.per_combined = numeric(nexperiment)
    for (gg in 1:10) {
      load(paste0("./scenario2/result/solution_p.value.per/p.value.per_",kk,"_",ss,"_",gg,".rda"))
      start_index <- (gg - 1) * 100 + 1
      end_index <- gg * 100
      p.value.per_combined[start_index:end_index] <- p.value.per
    }
    typeIerror.per = mean(p.value.per_combined < alpha)
    data.pval[kk, ss] = typeIerror.per
  }
}
  
# Dataframe for problem
df.1 <- data.frame(SampleSize = log10(n), TypeI = data[,1])
df.2 <- data.frame(SampleSize = log10(n), TypeI = data[,2])
df.3 <- data.frame(SampleSize = log10(n), TypeI = data[,3])
df.4 <- data.frame(SampleSize = log10(n), TypeI = data[,4])

# Plot for problem
par(mfrow = c(2, 1))
par(mar = c(0.3, 8, 0.1, 0.1))
plot(df.1$SampleSize, df.1$TypeI, cex = .7, col = "red", ylim = c(0.1, 0.3), xaxt="n", yaxt="n", 
     xlab = "", ylab = "", cex.lab=2, cex.axis=2)
axis(side = 2, las = 2, at = seq(0.1, 0.3, 0.05), labels = format(seq(0.1, 0.3, 0.05), nsmall = 2), 
     cex.lab=2,cex.axis=2)
title(ylab="error rate                         ", line=6.2, cex.lab=2)
points(df.2$SampleSize, df.2$TypeI, cex = 0.7, col = "darkgreen")
points(df.3$SampleSize, df.3$TypeI, cex = 0.7, col = "skyblue")
points(df.4$SampleSize, df.4$TypeI, cex = 0.7, col = "purple")

fit1 <- smooth.spline(df.1$SampleSize, df.1$TypeI, df = 4)
fit2 <- smooth.spline(df.2$SampleSize, df.2$TypeI, df = 4)
fit3 <- smooth.spline(df.3$SampleSize, df.3$TypeI, df = 4)
fit4 <- smooth.spline(df.4$SampleSize, df.4$TypeI, df = 4)

lines(fit1, col = "red", lwd = 2)
lines(fit2, col = "darkgreen", lwd = 2)
lines(fit3, col = "skyblue", lwd = 2)
lines(fit4, col = "purple", lwd = 2)  

legend("bottomright", legend = c(expression(beta[0]==0.3*","~beta[2]==0.7), 
                              expression(beta[0]==0.3*","~beta[2]==0.8), 
                              expression(beta[0]==0.5*","~beta[2]==0.7), 
                              expression(beta[0]==0.5*","~beta[2]==0.8)),
       fill = c("red", "darkgreen", "skyblue", "purple"), border = "transparent",
       cex = 1.4, ncol = 2, text.width = 0.6, y.intersp = 0.7)

# Dataframe for solution
df.11 <- data.frame(SampleSize = log10(n), TypeI = data.pval[,1])
df.12 <- data.frame(SampleSize = log10(n), TypeI = data.pval[,2])
df.13 <- data.frame(SampleSize = log10(n), TypeI = data.pval[,3])
df.14 <- data.frame(SampleSize = log10(n), TypeI = data.pval[,4])

# Plot for solution
par(mar = c(4.1, 8, 0.1, 0.1))
plot(df.11$SampleSize, df.11$TypeI, cex = .7, col = "red", ylim = c(0.03, 0.08), yaxt="n",
     xlab = expression(paste(log[10], "(Sample Size)")), ylab = "", cex.lab=2, cex.axis=2, pch = 3)
axis(side = 2, las = 2, at = seq(0.03, 0.08, 0.01), labels = format(seq(0.03, 0.08, 0.01), nsmall = 2), 
     cex.lab=2,cex.axis=2)
title(ylab="                  Type I", line=6.2, cex.lab=2)
points(df.12$SampleSize, df.12$TypeI, cex = 0.7, pch = 3, col = "darkgreen")
points(df.13$SampleSize, df.13$TypeI, cex = 0.7, pch = 3, col = "skyblue")
points(df.14$SampleSize, df.14$TypeI, cex = 0.7, pch = 3, col = "purple")

fit11 <- smooth.spline(df.11$SampleSize, df.11$TypeI, df = 4)
fit12 <- smooth.spline(df.12$SampleSize, df.12$TypeI, df = 4)
fit13 <- smooth.spline(df.13$SampleSize, df.13$TypeI, df = 4)
fit14 <- smooth.spline(df.14$SampleSize, df.14$TypeI, df = 4)

lines(fit11, col = "red", lty = 5, lwd = 2)
lines(fit12, col = "darkgreen", lty = 5, lwd = 2)
lines(fit13, col = "skyblue", lty = 5, lwd = 2)
lines(fit14, col = "purple", lty = 5, lwd = 2)

polygon(c(0, 6, 6, 0),c(0.036, 0.036, 0.064, 0.064), col = rgb(45, 67, 121, 25, maxColorValue = 255), border = NA)

dev.off()
