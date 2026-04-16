rep=5000
n_values = c(10, 30, 50, 100)
par(mfrow=c(2,2))

for(n in n_values){
  M = nemeric(rep)
  for(i in 1:rep){
    x = repx(n,1)
    M[i] <- mean(x)
  }
  
  hist(M, probability = TRUE, col="red")
  curve(dnorm(x, 1, 1/ sqrt(n),col="green", add=TRUE))
  abline(v=1, lwd=2, color="blue")
}