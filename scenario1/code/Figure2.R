### initial setup
k = c(seq(1, 2, length.out = 30), seq(2, 5, length.out = 31)) # Set the 10^k as the volume of sample size
k = k[-31] # Remove duplicates
n = round(10^k)
nexperiment = 1000
nn = length(n)
split.point = 50 # smaller sample size: n[1]~n[50]; bigger sample size:n[51]~n[60]
split.nexp = 100 # when splitting the experiments, each job contains 100 experiments
alpha = 0.05

### input the results
F_type1 = rep(NA, nn) # type one error before permutation
F_type1.per = rep(NA, nn) # type one error after permutation (new p-value method)

## for smaller sample size
for (kk in 1:split.point){
  
  load(paste0("./scenario1/result/F_type1/F_type1error_",kk,".rda"))
  F_type1[kk] = F_type1error
  
}

for (kk in 1:split.point){
  
  load(paste0("./scenario1/result/F_type1.per/F_type1error.per_",kk,".rda"))
  F_type1.per[kk] = F_type1error.per
  
}

## for bigger sample size
p.value.s = matrix(NA, nexperiment, nn-split.point) 
p.value.per.s = matrix(NA, nexperiment, nn-split.point) 

for (kk in (split.point+1):nn){
  
  for (ss in 1:(nexperiment/split.nexp)){
    
    load(paste0("./scenario1/result/F_p.value/F_p.value_",kk,"_",ss,".rda"))
    load(paste0("./scenario1/result/F_p.value.per/F_p.value.per_",kk,"_",ss,".rda"))
    p.value.s[(split.nexp*(ss-1)+1):(split.nexp*ss), (kk-split.point)] = p.value
    p.value.per.s[(split.nexp*(ss-1)+1):(split.nexp*ss), (kk-split.point)] = p.value.per

  }
  
  F_type1[kk] = mean(p.value.s[, kk-split.point] < alpha)
  F_type1.per[kk] = mean(p.value.per.s[, kk-split.point] < alpha)

}

### visualization
png(file = './scenario1/figure/Figure2.png', width = 1400, height = 480, res = 100)
par(mar = c(4.1, 8, 0.1, 0.1))
F_df = data.frame(SampleSize = log10(n), TypeI = F_type1, TypeI.per = F_type1.per)

plot(F_df$SampleSize, F_df$TypeI, cex = 1, ylim = c(0.03, 0.1), yaxt = "n", cex.lab = 2, cex.axis = 2,
     xlab = expression(paste(log[10], "(Sample Size)")), ylab = "")
axis(side = 2, las = 2, at = seq(0.03, 0.1, 0.01), cex.lab = 2, cex.axis = 2,
     labels = format(seq(0.03, 0.1, 0.01), nsmall = 2))
title(ylab = "Type I error rate", line = 6.2, cex.lab = 2)
points(F_df$SampleSize, F_df$TypeI.per, cex = 1, pch = 3)


F_fit1 = smooth.spline(F_df$SampleSize, F_df$TypeI, df = 4)
F_fit2 = smooth.spline(F_df$SampleSize, F_df$TypeI.per, df = 4)
lines(F_fit1, lwd = 2)
lines(F_fit2, lty = 5, lwd = 2)

polygon(c(0, 6, 6, 0),c(0.036, 0.036, 0.064, 0.064), col = rgb(45, 67, 121, 25, maxColorValue = 255), border = NA)

legend(x = 1, y = 0.103, legend = c("possion regression", 
                              "permutation correction"), bty = "n",
       lty = c(1,5), cex = 1.5, lwd = 2)

legend(x = 3, y = 0.103, legend = c("95% confidence interval"), bty = "n",
       fill = rgb(45, 67, 121, 25, maxColorValue = 255), border = "black", cex = 1.5)


### code for generating the Figure 2 which is exactly 
### the same as the one in the manuscript using "locator(1)" to locate the legend
### and saving the plot by clicking the "Export" button manually (setting Width = 1400, Height = 480)

# legend(locator(1), legend = c("possion regression", 
#                               "permutation correction"), bty = "n",
#        lty = c(1,5), cex = 1.5, lwd = 2)
# 
# legend(locator(1), legend = c("95% confidence interval"), bty = "n",
#        fill = rgb(45, 67, 121, 25, maxColorValue = 255), border = "black", cex = 1.5)

dev.off()
