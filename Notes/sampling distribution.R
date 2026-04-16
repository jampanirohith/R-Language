#Sampling Distributions

#Chi Square Distribution

#Statistic: function of random variables
#eg: Sample mean ,max,min etc

#distribution of statistic

####################################################################################

#Standard normal

u<-rnorm(10000) #generates 10000 random numbers
y=dnorm(u) #gives the density

#plot of standard normal distribution using 10000 random numbers generated 

plot(u, y, main = "Scatter Plot of Normal Density", 
     col = "steelblue", pch = 13, cex = 0.3)

####################################################################################

# Square of std normal is chisq(1)

chi_sq_data <- u^2

#histogram of generated u^2 where u is from N(0,1)

hist(chi_sq_data,breaks = 50, probability = TRUE, 
     col = "lightblue",main = "Chi-Square (df=1) derived from Z^2",
     xlab = "z^2 value", xlim = c(0, 8))


####################################################################################

#plot of chisq(1)

x=seq(0,10,length.out=1000)
curve(dchisq(x, df = 1), add = TRUE, 
      col = "red", lwd = 2)
#mean

mean(chi_sq_data)

#var
var(chi_sq_data)

####################################################################################

#If X_i follows N(mu,sigma^2) then {(X_i-mu)/sigma}^2 follow chisq(1)

mu=10
sigma=2
u<-rnorm(1000,mu,sigma)
chisq_data<-{(u-mu)/sigma}^2
hist(chisq_data,breaks=50,prob=TRUE,col="lightblue",main="Chisquare with 1 degrees of freedom")

#density curve of chisq(1) in the same plot of histogram 
x=seq(0,10,length.out=1000)
curve(dchisq(x,df=1),add=TRUE)



####################################################################################

# Sum of 2 ind chisquare with n1 and n2 df respectively is chisquare(n1+n2)
par(mfrow=c(1,2))

u1<-rnorm(500)
u2<-rnorm(500)
chi_sq_data <- u1^2+u2^2
hist(chi_sq_data,breaks = 30, probability = TRUE, 
     col = "lightblue",main = "Chi-Square (df=2) derived from a sample of size 500",
     xlab = "u1^2+u2^2 value", xlim = c(0, 8))

#density curve of chisq(2) in the same plot of histogram 
x=seq(0,10,length.out=1000)
curve(dchisq(x, df = 1), add = TRUE, 
      col = "red", lwd = 2)


#same result proved with more number of random numbers generated

u1<-rnorm(1000000)
u2<-rnorm(1000000)
chi_sq_data <- u1^2+u2^2
hist(chi_sq_data,breaks = 60, probability = TRUE, 
     col = "lightblue",main = "Chi-Square (df=2) derived from a sample of size 1000000",
     xlab = "u1^2+u2^2 value", xlim = c(0, 8))


x=seq(0,10,length.out=1000)
curve(dchisq(x, df = 1), add = TRUE, 
      col = "red", lwd = 2)

####################################################################################

#mean of chisq(n) is n

mean(chi_sq_data)

#variance of chisq(n) is 2n
var(chi_sq_data)

#the values obtained will be closer to n and 2n respectively
####################################################################################

#Plot of chi square random variables with various degrees of freedom

x=seq(0,10,length.out=1000)
plot(x,dchisq(x, df = 2))
curve(dchisq(x, df = 2), add = TRUE, 
      col = "1", lwd = 2)
curve(dchisq(x, df = 5), add = TRUE, 
      col = "2", lwd = 2)
curve(dchisq(x, df = 10), add = TRUE, 
      col = "3", lwd = 2)

####################################################################################

#dchisq(x,df)  gives density
#pchisq(q,df,lower.tail=TRUE)   df
#qchisq(p,df,lower.tail=TRUE)   quantile fun
#rchisq(n,df)  generates random deviates 


#plot of chisq(2)
x=rchisq(1000,2)
y=dchisq(x,2)
plot(x,y,main="Chi square 2")

####################################################################################

#Suppose X follows chisquare(10).
#P(X<=5)=F(5)
pchisq(q=5,df=10)

#P(X>5)=1-F(5)

pchisq(q=5,df=10,lower.tail=FALSE)

#P(5<x<7)
pchisq(q=7,df=10)-pchisq(q=5,df=10)

#quantiles

#qchisq(p,df,lower.tail=TRUE)

#60% QUANTILE
qchisq(p=0.6,df=10)

qchisq(p=0.4,df=10,lower.tail=FALSE)

####################################################################################

#T DISTRIBUTION

#symmetric
#t density has thicker tails, indicating greater variability
#than normal density
#when n>30, the shape of t and normal are almost the same

#If X follows N(0,1) and Y follows chisq(n) then
#X/sqrt(Y/n) follows t distribution

dnorm(0)
u<-rnorm(10000)
v<-rchisq(10000,df=10)
t<-u/sqrt(v/10)
hist(t,breaks=50,col='lightblue',prob=TRUE)
x=seq(0,10,length.out=10000)
curve(dt(x, df = 10), add = TRUE, 
      col = "red", lwd = 2)


####################################################################################

#mean(t)
#var(t)=n/(n-2)

par(mfrow=c(1,2))

x=seq(-10,10,length.out=1000)
plot(x,dt(x, df = 2),ylim=c(0,.6),lwd = 2,cex=.5)
curve(dt(x, df = 7), add = TRUE, 
      col = "5", lwd = 2)
curve(dt(x, df = 10), add = TRUE, 
      col = "2", lwd = 2)
curve(dt(x, df = 30), add = TRUE, 
      col = "3", lwd = 2)
legend("topright", 
       legend = c("df=2", "df=7","df=10","df=30"), 
       col = c("1","2","3","4"), 
       lty = 1, # Line type (1 = solid)
       lwd = 2) # Line width

####################################################################################


#when n>30, the shape of t and normal are almost the same

plot(x,dt(x, df = 30),ylim=c(0,.6),lwd = 2,cex=.5)
curve(dnorm(x), add = TRUE,col = "3", lwd = 2)
legend("topleft", 
       legend = c("t with df=30", "N(0,1)"), 
       col = c("1","3"), 
       lty = 1, # Line type (1 = solid)
       lwd = 2) # Line width


#dt(x=,df=)
#pt(q=,df=,lower.tail=)
#qt(p=,df=,lower.tail=)


####################################################################################
#F distribution

#X follows chisq(m) and Y follows chisq(n) be ind then 
#(X/m)/(Y/n) follows F(m,n)

#mean=n/(n-2)
#var=2n^2(m+n-2)/(m(n-2)^2(n-4))

u<-rchisq(10000,df=20)
v<-rchisq(10000,df=10)
F=(u/20)/(v/10)
hist(F,breaks=50,prob=TRUE)
curve(df(x,20,10),add=TRUE,col="red")

y=1/F
hist(y,breaks=50,prob=TRUE)
curve(df(x,10,20),add=TRUE)

####################################################################################
#if X follows t(n) then X^2 follows F(1,n)
t=rt(1000,20)
F=t^2

par(mfrow=c(1,2))

hist(F,breaks=100,prob=TRUE)
x=seq(0,10,length.out=10000)
curve(df(x,1,20),add=TRUE,col="red")

###################################################################################

