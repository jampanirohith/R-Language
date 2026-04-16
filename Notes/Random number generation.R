
# Data Generation ---------------------------------------------------------
#Probability Integral Transform 
#Exponential density with parameter 5 
u <- runif(1000, 0, 1 )
x <- (-1/5)* log(1-u)
print(x)
hist(x, breaks= 25, probability = TRUE)
curve(dexp(x,5),xlim=c(0,10),add=TRUE,col = "red",
      lwd = 2)

#Using for loop 
n <- 1000
x <- numeric(n)
for (i in 1:n ){
  u <- runif(1, 0, 1)
  x[i] <- (-1/5)* log(1-u)
}
print(x)
hist(x, breaks= 25, probability = TRUE)
curve(dexp(x,5),xlim=c(0,10),add=TRUE,col = "red",
      lwd = 2)

#Summary of the data
mean(x)
var(x)
median(x)
min(x)
max(x)
summary(x)

boxplot(x)

# Converse of Probability Integral Transform
x <- rexp(1000, rate=1)
F_x <- 1- exp(-x)
hist(F_x,probability = TRUE)
curve(dunif(x,0,1),xlim=c(0,1),add=TRUE,col = "red",
      lwd = 2)
 

# Q. Calculate the probability P(0 < X < 1), when x follows exp(5)
#P(0 < X < 1)??
n <- 1000
x <- rexp(n, 5) # Generate 'n' random sample from exp(5) distribution

integrand <- function(x) {5 * exp(-5*x)}  # Density of exp(5)
p_true <- integrate(integrand, lower = 0, upper = 1)

c=0
for (i in 1:n){
  if (x[i]>0  & x[i]< 1){
    c <- c + 1
  }
}
p_hat <- c / n




# Sample Questions --------------------------------------------------------

### Generate data from Gompertz Distribution and Probability Estimation
### Parameters
a <- 0.4
b <- 1.5
n <- 10000

### Inverse CDF (Integral Transform Method)
# CDF: F(x) = 1 - exp(-(b/a)*(exp(a*x) - 1))
# Solve F(x) = u for x:
# exp(a*x) = 1 - (a/b)*log(1-u)
# x = (1/a) * log( 1 - (a/b)*log(1-u) )

rgompertz <- function(n, a, b) {
  u <- runif(n)
  x <- (1/a) * log(1 - (a/b) * log(1 - u)) # Inverse of the distribution function
  return(x)
}

### 1. Generate 10,000 samples
X <- rgompertz(n, a, b)

### 2. Estimate P(X > 3 | X > 2)
prob_estimate <- mean(X > 3 & X > 2) / mean(X > 2)
prob_estimate


### 3. Plot ECDF and theoretical CDF
# Theoretical CDF
F_theoretical <- function(x) {
  1 - exp( -(b/a) * (exp(a*x) - 1) )
}

# Plot empirical CDF
plot(ecdf(X), main = "ECDF vs Theoretical CDF (Gompertz)",
     xlab = "x", ylab = "CDF", col = "blue")

# Add theoretical CDF
curve(F_theoretical, from = 0, to = max(X),
      add = TRUE, col = "red", lwd = 2)

legend("bottomright", legend = c("Empirical CDF", "Theoretical CDF"),
       col = c("blue", "red"), lwd = 2)

