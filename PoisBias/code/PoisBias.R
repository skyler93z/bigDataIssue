simPois2 <- function(nn, lambda, trunca=2)
{# trunca take value of 0 or 1 as the max values to be truncated
  xx1 = rpois(nn, lambda = lambda)
  xx1[xx1 < trunca] =0
  return(xx1)
}  

set.seed(0)
lambda=5 # Possion distribution parameter
mm=10   # number of sample sizes  
ll=1000 # number of repeated experiments at each sample size
sizes <- 10^seq(1,6,length.out=mm)
bias <- matrix(NA, mm,ll)
for(ii in 1:mm) for(jj in 1:ll) bias[ii,jj] = mean(simPois2(sizes[ii],lambda))-lambda

#setwd("/Users/xzhang/Library/CloudStorage/Dropbox/Research Projects/BigSampleIssue")
png(file = './PoisBias/figure/Figure1.png', width=1400, height=480)
par(mar = c(4.1, 8, 0.1, 0.1))
boxplot(t(bias),horizontal=T,pch=".",ylim=c(-0.3,0.3), yaxt="n", xlab=expression(paste("Bias of estimation parameter ",lambda)), cex.lab=2,cex.axis=2)
axis(side = 2, las = 2, at=1:mm, labels=sprintf("%0.2f", log10(sizes)), cex.lab=2,cex.axis=2)
title(ylab=expression(paste(log[10], "(Sample Size)")), line=5, cex.lab=2)
abline(v=0,col=2, lwd=3,lty=2)
dev.off()


#plot(log(sizes)/log(10), apply(bias,1, median))
