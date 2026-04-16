n = 1000
x <- rnorm(n, 10, 0.01)

sample_mean <- cumsum(x)/ 1:n
plot(sample_mean, type="l", col="blue", lwd=2, main="Waek law of large numbers", xlab="n", ylab="sample mean")
abline(h=10, col="red", lwd=2) 

