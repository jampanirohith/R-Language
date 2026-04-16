x<-sample(1:10,100,replace=TRUE)
mean(x)
var(x)
table(x)
table(x)/length(x)
barplot(table(x)/length(x),ylim = c(0,0.15))

k=0:10
pmfbinom<- dbinom(x=k, 10, prob=0.7)
plot(x=k, y=pmfbinom,main="pmf of binomial", type="h")
pbinom(q=5, 10, 0.7)

cdfbinom<- pbinom(q=k , 10, prob=0.7)
plot(x=k,y=cdfbinom, main="cdf of binomial", type="s")
pbinom(q=7,10,0.7)-pbinom(q=5,10,0.7)
qbinom(p=0, 5, 10, 0.7)
rbinom(100, 10, 0.7)