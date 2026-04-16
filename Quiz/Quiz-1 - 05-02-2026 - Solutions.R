##NAME: JAMPANI ROHITH
##IMS24108

##Problem-1

count <- 0
found <- FALSE

while (!found) {
count <- count +1
num <- sample(1:100, 1)
if (num %% 4 == 0 && num %% 6 == 0) {
  found <- TRUE
  cat("number:", num)
  cat("\nnumber of iterations:", count)
}
}


##Problem-2
sum <- 0
i <- 1

while(i <= 50){
  sum <- sum + i
  i <- i + 1
}
cat("Sum:", sum)


##Problem-3

set.seed(123)
theta <- 0.8
n <- 10000
u <- runif(n)
x_sim <- (-1 + sqrt(1 - 2 * theta * log(1 - u))) / theta
prob <- mean(x_sim > 2)
cat("probability:", prob, "\n")


#Problem-5
set.seed(42)
x <- rnorm(100, mean = 60, sd = 12)
epsilon <- rnorm(100, mean = 0, sd = 8)
y <- 4 * x + epsilon


##  Problem-6
x_vec <- seq(-3, 3, length.out = 200)
epsilon_6 <- rnorm(200, mean = 0, sd = 0.5)
y_vec <- x_vec^2 + epsilon_6
cov_6 <- cov(x_vec, y_vec)
cat("Sample Covariance (Task 6):", cov_6, "\n")
cor_6 <- cor(x_vec, y_vec)
cat("Sample Correlation (Task 6):", cor_6, "\n")