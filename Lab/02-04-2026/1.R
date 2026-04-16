x <- rbeta(100, shape1=2, shape=5)

log_lik <- function(par){
  a = par[1]
  b = par[2]
  sum(dbeta(x, shape1=a, shape2=b, log=TRUE))
}

result = optim(par=c(1,1), fn=log_lik)
mle = result