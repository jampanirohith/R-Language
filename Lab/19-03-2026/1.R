density_Normal=function(n, col){
  rep=10000
  mu=0
  sigma_2=1
  M<- numeric(rep)
  for ( i in 1:rep){
    x = rnorm(n, mu, sigma_2)
    M[i] = mean(x)
  }
  lines(density(M), col=col, lwd=2)
}

plot(NULL, xlim=c(-1.5, 1.5), ylim=c(0,10), xlab="sample mean", ylab="density")
density_Normal(10, "red")
density_Normal(30, "green")
density_Normal(100, "violet")
density_Normal(500, "blue")