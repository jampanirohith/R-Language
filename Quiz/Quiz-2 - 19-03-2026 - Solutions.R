#Question-2
#a
x<-seq(-3,3,length.out=200)
epsilon<-rnorm(200,mean=0,sd=0.5)
y<-x^2+epsilon
#b
cov(x,y); 
#c
cor(x,y)
#d
plot(x,y,main="Scatter plot of X vs Y")


#Question-3
set1<-rnorm(1000,60,10)
set2<-rnorm(1000,70,12)
boxplot(set1,set2,names=c("N(60,100)","N(70,144)"))


#Question-4


#Question-5
#a
n<-500
x<-rnorm(n, 0, 1)
#b
running_mean<-cumsum(x)/(1:n)
#c
plot(1:n, running_mean, type="l", main="Running Sample Mean")
#d
abline(h=0)
#e

#Question-6
#a
#b
#c
#d
#e


#Question-1
#a
divby3 <- c()
while(length(divby3) < 10) {
  num <- sample(1:100, 1)
  if(num %% 3 == 0) {
    divby3 <- c(divby3, num)
  }
}
print(divby3)

#b:
nums <- c()
running_sum <- 0
while(running_sum <= 100) {
  val <- sample(1:20, 1)
  nums <- c(nums, val)
  running_sum <- running_sum + val
  if(val > 10) print(paste(val, "is greater than 10"))
  else print(paste(val, "is less than or equal to 10"))
}
