x<-rnorm(100, 50, 6)
x

y<- 3*x 
cor(x,y)

y<- 3*x + rnorm(100, 0,1)
cor(x,y)
cov(x,y)

r <- cov(x,y)/(sd(x) * sd(y))

x1 <- rnorm(100, 10, 2)
x2 <- 0.5*x1 + rnorm(100,0,1)
x3 <- 2*x1 - 3*x2 + rnorm(100, 0, 4)

z <- cbind(x1, x2, x3)
z

cor(z)
 