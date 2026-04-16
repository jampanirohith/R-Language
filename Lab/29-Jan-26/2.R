#To generate data from the exponential function(lambda)

n<-100
x <- numeric(n)

for(i in 1:n){
  u <- runif(1, 0, 1)
  x[i] <- (-1)*log(1-u)  #F^[-1]
}
print(x)

hist(x, breaks = 25, probabality=TRUE)
curve(dexp(x,5), add= TRUE, col="red")
summary(x)

cou <- 0
for(i in 1:n){
  if((x[i]<=3) & (x[i]>=0)){
    cou = cou +1
  }
}
p<- cou/n
p

fun<- function(x){5*exp(-5*x)}
p_true<- integrate(fun, lower=0, upper=1)
p_true