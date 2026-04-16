# DSC 318 — Mathematical Statistics Lab
## Complete Ultra-Detailed Study Notes, All Examples Solved, All Problem Sets Solved

---

# TABLE OF CONTENTS

1. [Introduction to R](#1-introduction-to-r)
2. [Basic Arithmetic and Objects](#2-basic-arithmetic-and-objects)
3. [Vectors — Creation, Operations, Subsetting](#3-vectors)
4. [Logical Operators](#4-logical-operators)
5. [Matrices](#5-matrices)
6. [Lists](#6-lists)
7. [Data Frames and Factors](#7-data-frames-and-factors)
8. [Functions, Loops, and Control Flow](#8-functions-loops-and-control-flow)
9. [Graphics and Visualization](#9-graphics-and-visualization)
10. [Central Tendency and Variation](#10-central-tendency-and-variation)
11. [Distribution Functions in R](#11-distribution-functions-in-r)
12. [Confidence Intervals — Theory and R Code](#12-confidence-intervals)
13. [Statistical Inference — Point Estimation](#13-statistical-inference)
14. [Q-Q Plots](#14-q-q-plots)
15. [CLT, Weak Law of Large Numbers](#15-clt-and-weak-law-of-large-numbers)
16. [MLE using optim()](#16-mle-using-optim)
17. [PROBLEM SET 1 (Math Start) — Full Solutions](#17-problem-set-1-math-start)
18. [PROBLEM SET 1 (Stat Version) — Full Solutions](#18-problem-set-1-stat-version)
19. [PROBLEM SET 2 — Full Solutions](#19-problem-set-2)
20. [QUIZ 1 — Full Solutions](#20-quiz-1)
21. [QUIZ 2 — Full Solutions](#21-quiz-2)

---

# 1. Introduction to R

## History

- **S language**: The predecessor to R. Developed at Bell Labs by John Chambers starting in 1975. S was the first true statistical computing language that worked as a real programming language.
- **S-PLUS**: In 1988, S was commercially marketed as S-PLUS (S+), later owned by TIBCO Software. S has always been proprietary.
- **R**: Created by Ross Ihaka and Robert Gentleman at the University of Auckland. Development began in 1992. First stable release in 2000. R is very similar to S in syntax and philosophy.
- **Key difference**: R is free and open-source under GPL version 2. Anyone can use it, modify it, and redistribute it under the same license.
- **CRAN**: All R packages are available through CRAN (https://cran.r-project.org/) and Bioconductor (https://www.bioconductor.org/).

## Why R for Statistics?

R is **vectorized** — operations apply to entire vectors at once without explicit loops. This makes statistical computation fast, expressive, and readable. R also has thousands of packages for statistics, machine learning, visualization, and data manipulation.

---

# 2. Basic Arithmetic and Objects

## The R Prompt

R uses a command-line interface marked by `>` (the prompt). Type a command and press Enter; R evaluates and prints the result.

```r
> 6 + 9
[1] 15
```

The `[1]` means the first element of the output is shown.

## Assignment

You assign values to variables using `<-` or `=`. The variable goes on the left, the value on the right.

```r
> x <- 15    # assigns 15 to x
> x - 1
[1] 14
```

`=` and `<-` are functionally identical for assignment, but `<-` is preferred because `=` is also used for function arguments, causing potential confusion.

The rightward assignment `->` also works:
```r
> 5 * x -> x
> x
[1] 25
```

### Lecture Example (from notes):
```r
> x <- 21
> x - 5
[1] 16
> x + 5
[1] 26
```

```r
> x = 10
> x - 5
[1] 5
> x*5 -> x
> x
[1] 50
```

**Note**: `x + 5` after `x <- 21` gives 26, not 16. The notes show `[1] 16` for both — that appears to be a typo in the slides. `x - 5 = 21 - 5 = 16` ✓, `x + 5 = 21 + 5 = 26`.

## Basic Arithmetic Operators

| Operator | Meaning |
|----------|---------|
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `/` | Division |
| `^` or `**` | Exponentiation |
| `%%` | Modulo (remainder) |
| `%/%` | Integer division |

```r
> 10 %% 3      # 10 mod 3
[1] 1
> 10 %/% 3     # integer division
[1] 3
> 2^10
[1] 1024
```

---

# 3. Vectors

## What is a Vector?

A vector in R is a sequence of values of the **same type**. R is vectorized — most operations apply element-wise to every entry in a vector automatically.

## Creating Vectors with c()

`c()` stands for "combine" or "concatenate".

```r
> x <- c(1, -1, 3.5, 2)
> x
[1]  1.0 -1.0  3.5  2.0
```

**Lecture Example:**
```r
> x <- c(5, -5, 2.5, 2)
> x
[1]  5.0 -5.0  2.5  2.0
```

## Element-wise Operations

```r
> x + 2          # add 2 to every element
[1] 3.0 1.0 5.5 4.0

> x^2            # square every element
[1]  1.00  1.00 12.25  4.00
```

**Lecture Example:**
```r
> x + 7
[1] 12.0  2.0  9.5  9.0

> x^2
[1] 25.00 25.00  6.25  4.00
```

### Computing Mean and Variance Manually

```r
> sum((x - mean(x))^2)   # sum of squared deviations (used in variance formula)
[1] 10.69
```

**Lecture Example** (for x = c(5, -5, 2.5, 2)):
```r
> mean(x)
[1] 1.125

> var(x)           # sample variance = sum((x-xbar)^2)/(n-1)
[1] 18.39583

> (1/length(x)) * sum((x - mean(x))^2)    # population variance formula
[1] 13.79688

> (1/(length(x)-1)) * sum((x - mean(x))^2)  # sample variance (matches var())
[1] 18.39583
```

**Explanation**: R's `var()` uses `n-1` (Bessel's correction) to give an unbiased estimate of population variance from a sample. The formula `(1/n)*sum(...)` gives the biased estimator.

## Creating Sequences

### The Colon Operator `:`

```r
> 1:10
[1]  1  2  3  4  5  6  7  8  9 10

> -3:4
[1] -3 -2 -1  0  1  2  3  4

> 9:5       # counting down
[1] 9 8 7 6 5
```

**Lecture Examples:**
```r
> -2:3
[1] -2 -1  0  1  2  3

> 7:1
[1] 7 6 5 4 3 2 1
```

### seq() — General Arithmetic Progressions

`seq(from, to, by)` or `seq(from, to, length=n)`

```r
> seq(from=2, to=6, by=0.4)
[1] 2.0 2.4 2.8 3.2 3.6 4.0 4.4 4.8 5.2 5.6 6.0

> seq(from=-1, to=1, length=6)
[1] -1.0 -0.6 -0.2  0.2  0.6  1.0
```

**Lecture Examples:**
```r
> seq(from=1, to=6, by=0.6)
[1] 1.0 1.6 2.2 2.8 3.4 4.0 4.6 5.2 5.8

> seq(from=-3, to=6, by=1)
[1] -3 -2 -1  0  1  2  3  4  5  6
```

### rep() — Repeated Values

```r
> rep(5, 3)              # repeat 5 three times
[1] 5 5 5

> rep(2:5, each=3)       # repeat each element 3 times
[1] 2 2 2 3 3 3 4 4 4 5 5 5

> rep(-1:3, length.out=10)  # repeat pattern until length 10
[1] -1  0  1  2  3 -1  0  1  2  3
```

**Lecture Examples:**
```r
> rep(4, 3)
[1] 4 4 4

> rep(2:5, each=3)
[1] 2 2 2 3 3 3 4 4 4 5 5 5
```

### Vectorized Sequences

```r
> 2^(0:10)
[1]    1    2    4    8   16   32   64  128  256  512 1024
```

**Lecture Example:**
```r
> 1:4 + rep(seq(from=0, by=10, to=40), each=4)
[1]  1  2  3  4 11 12 13 14 21 22 23 24 31 32 33 34 41 42 43 44
```

**Explanation**: `1:4` = (1,2,3,4) is repeated (recycled) and added to the longer vector `rep(seq(0,10,...,40), each=4)` = (0,0,0,0,10,10,10,10,...).

## Recycling

When two vectors of different lengths are combined by a binary operation, R reuses the shorter one cyclically.

```r
> 1:10 * c(-1, 1)
[1] -1  2 -3  4 -5  6 -7  8 -9 10
```

`c(-1,1)` is recycled: position 1 → ×(−1), position 2 → ×1, position 3 → ×(−1), etc.

If longer length is NOT a multiple of shorter, R gives a warning:
```r
> 1:7 * 1:2
[1]  1  4  3  8  5 12  7
Warning message: longer object length is not a multiple of shorter object length
```

---

# 3.1 Subsetting Vectors

## By Position (Positive Index)

```r
> x <- c(5, 9, 2, 14, -4)
> x[3]             # third element
[1] 2              # note: indexing starts from 1 in R!

> x[c(2,3,5)]      # second, third, fifth elements
[1]  9  2 -4

> x[1:3]           # first three
[1] 5 9 2

> x[3:length(x)]   # from third to last
[1]  2 14 -4
```

## By Exclusion (Negative Index)

```r
> x[-1]            # everything except the first
[1]  9  2 14 -4

> x[-c(1,4)]       # exclude first and fourth
[1]  9  2 -4
```

**Note**: Negative indices in R mean "exclude these positions", unlike Python where `-1` means the last element.

## By Logical Vector

```r
> x > 4
[1]  TRUE  TRUE FALSE  TRUE FALSE

> x[x > 4]         # elements greater than 4
[1]  5  9 14
```

## Using drop=FALSE

When subsetting a matrix, R drops dimensions by default. `drop=FALSE` preserves the matrix structure:
```r
> A[2, 2:ncol(A), drop=FALSE]   # returns a 1×2 matrix instead of a vector
```

---

# 3.2 Exercise Solutions from Lecture Notes

### Exercise 2.1
Read before and after weights, compute weight lost and average:
```r
before <- c(78, 72, 78, 79, 105)
after  <- c(67, 65, 79, 70,  93)

weight_lost <- before - after
# [1] 11  7 -1  9 12

mean(weight_lost)
# [1] 7.6
```

Person 3 actually gained weight (−1). Average loss = 7.6 kg.

### Exercise 2.3 — Creating specific vectors

**(i)** 1, 1.5, 2, 2.5, ..., 12
```r
seq(1, 12, by=0.5)
```

**(ii)** 1, 8, 27, 64, ..., 1000 (cubes of 1 to 10)
```r
(1:10)^3
```

**(iii)** 1, −1/2, 1/3, −1/4, ..., −1/100
```r
(-1)^(1+1) / 1    # pattern
# General formula:
((-1)^(1:100 + 1)) / (1:100)
```

**(iv)** 1, 0, 3, 0, 5, 0, 7, ..., 0, 49
```r
x <- rep(0, 49)
x[seq(1, 49, by=2)] <- seq(1, 49, by=2)
x
# Alternatively:
v <- rep(c(1, 0), 25)    # won't work directly due to pattern
# Better:
result <- numeric(49)
result[seq(1, 49, 2)] <- seq(1, 49, 2)
result
```

**(v)** 1, 3, 6, 10, ..., 210 (cumulative sums)
```r
cumsum(1:20)
# [1]   1   3   6  10  15  21  28  36  45  55  66  78  91 105 120 136 153 171 190 210
```

**(vi)** 1, 2, 2, 3, 3, 3, 4, ..., 10 (each number k repeated k times)
```r
rep(1:10, times=1:10)
# [1]  1  2  2  3  3  3  4  4  4  4  5  5  5  5  5 ... 10 10 ...
```

### Exercise 2.4 — Taylor expansion of log(1+x)

The i-th term is `(-1)^(i+1) * x^i / i` for `x = 0.5`:

```r
x <- 0.5
i <- 1:100
terms <- ((-1)^(i+1) * x^i) / i

# Sum of first 100 terms:
sum(terms)
# Compare with true value:
log(1 + 0.5)  # = log(1.5) ≈ 0.4054651
```

**Remainder rn(1) for n = 10, 100, 1000, ..., 10^6** (at x=1):
```r
x <- 1
rn <- function(n) {
  i <- 1:n
  log(2) - sum(((-1)^(i+1) * x^i) / i)
}
sapply(10^(1:6), rn)
```

Note: The Taylor series for log(1+x) converges only for |x| ≤ 1 (conditionally at x=1), so large n gives better approximations.

### Exercise 2.5 — LETTERS subsetting

```r
# (i) First 12 letters:
LETTERS[1:12]
# [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L"

# (ii) Odd-numbered letters (1st, 3rd, 5th...):
LETTERS[seq(1, 26, by=2)]
# [1] "A" "C" "E" "G" "I" "K" "M" "O" "Q" "S" "U" "W" "Y"

# (iii) English consonants (exclude vowels A,E,I,O,U):
vowels <- c("A","E","I","O","U")
LETTERS[!LETTERS %in% vowels]
```

### Exercise 2.6 — Subvectors of normals

```r
set.seed(42)
x <- rnorm(20)

# (i) entries less than 1:
x[x < 1]

# (ii) entries between -0.5 and 1:
x[x > -0.5 & x < 1]

# (iii) entries with absolute value > 1.5:
x[abs(x) > 1.5]
```

---

# 4. Logical Operators

## Comparison Operators

| Operator | Meaning |
|----------|---------|
| `>` | Greater than |
| `<` | Less than |
| `>=` | Greater than or equal |
| `<=` | Less than or equal |
| `==` | Equal (double equals!) |
| `!=` | Not equal |

```r
> x <- c(5, 9, 2, 14, -4)
> x <= 2
[1] FALSE FALSE  TRUE FALSE  TRUE
> x == 2
[1] FALSE FALSE  TRUE FALSE FALSE
> x != 2
[1]  TRUE  TRUE FALSE  TRUE  TRUE
```

## Combining Logical Vectors

- `&` — pointwise AND
- `|` — pointwise OR
- `!` — negation (NOT)

```r
> (x > 0) & (x < 10)   # AND: between 0 and 10
[1]  TRUE  TRUE  TRUE FALSE FALSE

> (x == 5) | (x > 10)  # OR: equals 5 or greater than 10
[1]  TRUE FALSE FALSE  TRUE FALSE

> !(x > 5)             # NOT: less than or equal to 5
[1]  TRUE FALSE  TRUE FALSE  TRUE
```

**Lecture Examples:**
```r
> (x ==5) | (x > 10)
[1]  TRUE FALSE FALSE  TRUE FALSE

> !(x > 2)
[1]  TRUE FALSE  TRUE FALSE  TRUE
```

---

# 5. Matrices

## Creating Matrices

`matrix(data, nrow, ncol)` fills **column by column** (column-major order):

```r
> matrix(1:12, nrow=3, ncol=4)
     [,1] [,2] [,3] [,4]
[1,]    1    4    7   10
[2,]    2    5    8   11
[3,]    3    6    9   12
```

Fill row by row with `byrow=TRUE`:
```r
> matrix(1:12, nrow=3, byrow=TRUE)
     [,1] [,2] [,3] [,4]
[1,]    1    2    3    4
[2,]    5    6    7    8
[3,]    9   10   11   12
```

### Special Matrices

```r
diag(3)          # 3x3 identity matrix
diag(1:3)        # diagonal matrix with 1,2,3 on diagonal
1:5 %o% 1:5      # outer product: (i,j)-th entry = i*j
outer(1:3, 1:4, "+")  # (i,j)-th entry = i+j
```

### Matrix Operations

```r
A %*% x      # matrix-vector multiplication
A * x        # element-wise multiplication (NOT matrix mult)
t(A)         # transpose
det(A)       # determinant
diag(A)      # extract diagonal elements
solve(A)     # inverse of A
solve(A, b)  # solve Ax = b for x
```

**Lecture Example:**
```r
A <- matrix(c(1:8, 10), 3, 3)
x <- c(1, 2, 3)

A %*% x    # matrix multiplication
#      [,1]
# [1,]   30
# [2,]   36
# [3,]   45

A * x      # element-wise (columns recycled by x)
#      [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    4   10   16
# [3,]    9   18   30
```

## Matrix Subsetting

```r
A[2, 1]         # element at row 2, col 1
A[2, 2:ncol(A)] # row 2, from col 2 to end
A[, 1:2]        # all rows, first 2 columns (blank = everything)
```

## Combining Matrices

```r
cbind(A, t(A))  # column-bind: put A and A^T side by side
rbind(A, 1, 0)  # row-bind: append rows of 1s and 0s
```

## Solving Systems of Linear Equations

For Ax = b, use `solve(A, b)`:
```r
# x + y + z = 6
# 2x + 3y + z = 11
# x + 2y + 3z = 14
A <- matrix(c(1,2,1, 1,3,2, 1,1,3), nrow=3)
b <- c(6, 11, 14)
solve(A, b)
# [1] 1 2 3
```

---

# 5.1 Matrix Exercise Solutions

### Exercise 2.7 — Show B³ is scalar multiple of identity

```r
B <- matrix(c(1,4,-3, 2,2,-1, 3,6,-3), nrow=3)
B3 <- B %*% B %*% B
B3
# Should be k * diag(3) for some scalar k
# Check: B3 / B3[1,1] should be identity
k <- B3[1,1]
B3 / k
```

Let's compute manually: B has det = 1(2×(−3)−6×(−1)) − 2(4×(−3)−(−3)×(−1)) + 3(4×(−1)−2×(−3))
= 1(−6+6) − 2(−12−3) + 3(−4+6) = 0 + 30 + 6 = 36

B³ = 36 × I₃, so k = 36.

### Exercise 2.8 — Construct specific matrices

**(a)** 2×4 matrix [[1,3,5,7],[2,4,6,8]]:
```r
matrix(c(1,2,3,4,5,6,7,8), nrow=2)
# or
matrix(1:8, nrow=2)
```

**(b)** 15×10 matrix of alternating 1,−1:
```r
matrix(rep(c(1,-1), length.out=150), nrow=15, ncol=10)
```

**(c)** 5×15 matrix with three 1s in shifting positions:
```r
M <- matrix(0, nrow=5, ncol=15)
for(i in 1:5) M[i, ((i-1)*3+1):(i*3)] <- 1
M
```

**(d)** 10×10 Toeplitz-like matrix where (i,j) entry = i+j−1:
```r
outer(1:10, 1:10, "+") - 1
# or equivalently:
outer(0:9, 0:9, "+") + 1
```

Actually: entry (i,j) = i+j-1. Row 1: 1,2,...,10. Row 2: 2,3,...,11. Etc.
```r
outer(1:10, 1:10, "+") - 1
```

**(e)** Circulant matrix: (i,j)-th entry = ((i+j-2) mod 9) + 1:
```r
outer(1:9, 1:9, function(i,j) ((i+j-2) %% 9) + 1)
```

**(f)** Block matrix [I₅, 1; 0, −I₆]:
```r
top <- cbind(diag(5), matrix(1, 5, 6))
bot <- cbind(matrix(0, 6, 5), -diag(6))
rbind(top, bot)
```

### Exercise 2.9 — System of 5 equations

```r
# a + 2b + 3c + 4d + 5e = -5
# 2a + 3b + 4c + 5d +  e =  2
# 3a + 4b + 5c +  d + 2e =  5
# 4a + 5b +  c + 2d + 3e = 10
# 5a +  b + 2c + 3d + 4e = 11

# Construct A without typing by hand:
r1 <- 1:5
A <- outer(0:4, 0:4, function(i,j) ((i+j) %% 5) + 1)
b <- c(-5, 2, 5, 10, 11)
solve(A, b)
```

---

# 6. Lists

A list in R can hold elements of **any type**, even other lists. Use `list()` to create:

```r
> x <- list(1:3, TRUE, "Hello", list(1:2, 5))
```

Access elements:
- `x[[3]]` — extract the 3rd element (single element)
- `x[c(1,3)]` — extract a sub-list (still a list)

Named lists:
```r
> x <- list(y=1:3, TRUE, z="Hello")
> x$y         # access by name
[1] 1 2 3
> x[[1]]      # same, by position
[1] 1 2 3
> names(x)
[1] "y" ""  "z"
```

**Key difference**: `x[[3]]` returns the object itself; `x[3]` returns a list containing that object.

---

# 7. Data Frames and Factors

## Data Frames

A data frame is a rectangular table where each column can be a different type (numeric, character, logical). Each column is a vector of the same length.

```r
> library(MASS)
> head(hills)     # rows = races, columns = dist, climb, time
```

Data frames behave like both lists and matrices:
```r
> hills$time          # access column by name (list behavior)
> hills[hills$dist >= 12, ]  # filter rows (matrix behavior)
```

Creating a data frame:
```r
> books <- data.frame(
+   author=c("Ripley","Cox","Snijders","Cox"),
+   year=c(1980,1979,1999,2006),
+   publisher=c("Wiley","Chapman","Sage","CUP")
+ )
```

## with() — Avoiding Repeated Typing

```r
# Instead of:
plot(hills$climb[hills$dist < 10], hills$time[hills$dist < 10])

# Use:
with(hills, plot(climb[dist < 10], time[dist < 10]))
```

`with()` evaluates expressions in the context of the data frame, so column names are recognized directly.

## Factors — Categorical Variables

A factor stores categorical data with discrete **levels**:
```r
sex <- c("M","M","F","F","M")
Sex <- as.factor(sex)
levels(Sex)    # [1] "F" "M"
```

R knows to treat factors as categorical in plots, summaries, and models:
```r
plot(Sex, height)   # automatically makes a boxplot
```

A factor is internally stored as integers with a levels attribute:
```r
as.integer(Sex)     # 2 2 1 1 2 (F=1, M=2 alphabetically)
attributes(Sex)     # $levels and $class
as.character(Sex)   # back to character
```

---

# 7.1 Exercise Solutions

### Exercise 3.2 — Mean speed for races 5–10 miles
```r
with(hills, mean((dist/time * 60)[dist >= 5 & dist <= 10]))
# speed = dist/time * 60 mph (time in minutes)
```

### Exercise 3.4 — Factor manipulation
```r
# (a) Sample {1,2,3} 50 times, factor with labels:
x <- sample(1:3, 50, replace=TRUE)
f <- factor(x, labels=c("Yes","No","Maybe"))

# (b) Remove Maybe:
f2 <- f[f != "Maybe"]
levels(f2)    # still shows Maybe!

# (c) Drop unused levels:
f2 <- droplevels(f2)
levels(f2)    # now only Yes and No
```

---

# 8. Functions, Loops, and Control Flow

## Writing Functions

```r
square <- function(x) {
  x^2
}
square(4)   # [1] 16
```

Objects created inside a function are local — they don't exist outside:
```r
mean2 <- function(x) {
  n <- length(x)
  sum(x) / n
}
mean2(1:10)   # [1] 5.5
# n doesn't exist outside
```

## for() Loops

```r
factorial2 <- function(n) {
  out <- 1
  for (i in 1:n) {
    out <- out * i
  }
  out
}
factorial2(10)   # [1] 3628800
```

**Use `seq_len(n)` instead of `1:n`** when n might be 0:
```r
n <- 0
1:n          # [1] 1 0  -- WRONG! Gives a 2-element vector
seq_len(n)   # integer(0)  -- CORRECT! Empty sequence
```

## if/else Conditional Code

```r
abs2 <- function(x) {
  if (x < 0) out <- -x
  else        out <- x
  out
}
abs2(-4)   # [1] 4
```

**Warning**: `if` expects a single TRUE/FALSE, not a vector. Use `ifelse()` for vectors:
```r
ifelse(TRUE, 94, "hello")    # [1] 94
ifelse(FALSE, 94, "hello")   # [1] "hello"
```

## while() Loops

```r
isPrime <- function(n) {
  i <- 2
  if (n < 2) return(FALSE)
  while (i < sqrt(n)) {
    if (n %% i == 0) return(FALSE)
    i <- i + 1
  }
  return(TRUE)
}
isPrime(37)   # [1] TRUE
isPrime(10)   # [1] FALSE
```

`return()` exits the function immediately with that value.

## Speed: Vectorize Instead of Loop

Loops are slow in R. Vectorized operations are much faster:
```r
# Slow:
system.time(for (i in 1:1e6) i^2)

# Fast:
system.time(seq_len(1e6)^2)
```

The difference can be 10x or more because vectorized operations use compiled C/FORTRAN code internally.

## Recursion

```r
fib <- function(n) {
  if (n < 2) return(1)
  else return(fib(n-1) + fib(n-2))
}
fib(10)   # [1] 89
```

**Caution**: Recursion in R is slow due to function call overhead. Prefer loops for performance.

## Scope

R uses **lexical scoping**: functions look for variables first in their own environment, then in the parent environment.

```r
x <- 3
f <- function(y) {
  x <- 5       # local x, doesn't affect global x
  x + y
}
f(4)   # [1] 9
x      # [1] 3 (unchanged)

g <- function(y) {
  x + y        # uses global x since no local x
}
g(4)   # [1] 7
```

---

# 8.1 Exercise Solutions

### Exercise 4.1 — logit function
```r
logit <- function(x) log(x / (1 - x))

logit(0.5)    # [1] 0
logit(0)      # [1] -Inf
logit(1)      # [1] Inf
logit(2)      # [1] NaN (not in domain (0,1))
```

### Exercise 4.2 — Taylor approximation of log(1+x)
```r
taylor_log <- function(x, n) {
  i <- 1:n
  sum((-1)^(i+1) * x^i / i)
}

# How many terms for x=0.99 to within 1e-6?
true_val <- log(1.99)
n <- 1
while(abs(taylor_log(0.99, n) - true_val) > 1e-6) n <- n + 1
n   # the number of terms needed (will be large since x=0.99 is near radius of convergence)
```

### Exercise 4.3 — Least squares slope
```r
least_squares <- function(x, y) {
  beta <- sum((x - mean(x)) * (y - mean(y))) / sum((x - mean(x))^2)
  alpha <- mean(y) - mean(x) * beta
  c(alpha=alpha, beta=beta)
}

# Verify with lm():
x <- rnorm(50); y <- 2*x + rnorm(50)
least_squares(x, y)
coef(lm(y ~ x))
```

### Exercise 4.4 — Matrix-vector multiplication with loops
```r
matvec <- function(A, b) {
  n1 <- nrow(A); n2 <- ncol(A)
  out <- numeric(n1)
  for (i in 1:n1) {
    for (j in 1:n2) {
      out[i] <- out[i] + A[i,j] * b[j]
    }
  }
  out
}
```

### Exercise 4.5 — Towers of Hanoi (recursive)
```r
hanoi <- function(k) {
  if (k == 1) return(1)
  2 * hanoi(k-1) + 1
}
hanoi(5)   # [1] 31
```

### Exercise 4.6 — Fibonacci with loop
```r
fib_loop <- function(n) {
  if (n < 2) return(1)
  a <- 1; b <- 1
  for (i in 3:n) {
    tmp <- a + b
    a <- b
    b <- tmp
  }
  b
}

# Timing comparison:
system.time(fib(30))       # recursive (slow)
system.time(fib_loop(30))  # loop (fast)
```

---

# 9. Graphics and Visualization

## Basic plot()

`plot()` is a generic function that adapts to input types:
- `plot(x)` — series plot (x vs index)
- `plot(x, y)` — scatter plot
- `plot(factor, numeric)` — boxplot
- `plot(function, from, to)` — function graph

**Types**: `type="l"` (line), `"p"` (points), `"b"` (both), `"h"` (histogram-like vertical lines), `"s"` (staircase).

```r
x <- cumsum(rnorm(250))
plot(x, type="l", col=3)
```

## Adding to Plots

```r
x <- rnorm(300); y <- x + rnorm(300)
plot(x, y, pch=20, col=4, cex=0.5)     # scatter plot
abline(a=0, b=1, lty=4, lwd=1.5)       # line y = 0 + 1*x
abline(lm(y ~ x), col=2)               # fitted line in red
```

- `pch`: point character (20 = filled circle)
- `cex`: character expansion (size of points, 0.5 = half size)
- `lty`: line type (1=solid, 2=dashed, 3=dotted, 4=dot-dash)
- `lwd`: line width

## Legends

```r
legend(x=-4, y=4,
       legend=c("y=x","line of best fit"),
       lty=c(4,1), lwd=c(1.5,1), col=1:2)
```

## Histograms

```r
hist(nlschools$lang, breaks=25, col=2,
     xlab="Score", main="Language test scores")
```

- `freq=FALSE` or `probability=TRUE` — shows density instead of counts
- `breaks` — number of bins (approximate)

## Density Plots

```r
plot(density(painters$Drawing))
plot(density(painters$Drawing, kernel="epanechnikov"))
plot(density(painters$Composition, adjust=0.5))  # more wiggly
plot(density(painters$Composition, adjust=2))    # smoother
```

## Boxplots

```r
boxplot(Wt ~ Litter, data=genotype)
```

Formula interface: left side is the response, right side is the grouping variable.

## Barplots

```r
qualification <- c(1,2,1,2,1,1,1,2,1,1)
barplot(table(qualification)/length(qualification),
        col=c("blue","green"),
        main="Graduates and Non-Graduates",
        ylab="Probability", xlab="Category",
        names.arg=c("Graduates","Non-Graduates"))
```

Stacked (grouped) barplot with matrix:
```r
customers <- matrix(c(2,26,42,30, 20,53,15,75, 30,40,25,100), nrow=4)
barplot(customers, ylab="Customers", xlab="Shops",
        names.arg=c("Shop1","Shop2","Shop3"),
        col=c("blue","green","yellow","red"),
        main="Stacked Barplot")
```

## Pie Charts

```r
pie(table(qualification),
    labels=c("Graduate","Nongraduate"),
    main="Qualification", col=c("red","yellow"))
```

3D pie chart (requires `plotrix` package):
```r
library(plotrix)
pie3D(table(qualification), labels=c("Graduate","Nongraduate"),
      explode=0.2, col=c("yellow","violet"))
```

## Stem-and-Leaf Plots

```r
defective <- c(46,24,53,40,18,34,65,54,66,35,48,56,73,38,49)
stem(defective, scale=2)
```

## Treemaps

```r
library(treemap)
treemap(painters, index="School", vSize="Composition")
```

## Lattice Graphics

```r
library(lattice)
xyplot(log(FL) ~ log(RW) | sp*sex, data=crabs)
histogram(~ height | voice.part, data=singer)
densityplot(galaxies)
```

## Customized Plots from Scratch

```r
set.seed(1328)
x <- rnorm(100)

plot.new()
plot.window(xlim=c(-3,3), ylim=c(-0.1,0.5))
axis(side=1, pos=-0.1)
hist(x, breaks=15, add=TRUE, freq=FALSE, col=2)
plot(dnorm, -3, 3, add=TRUE)
points(x, rep(-0.05, 100), pch="|")
title(main="Normal random variables")
```

## Saving Plots

```r
pdf("plotfile.pdf")
plot(hills)
dev.off()
```

---

# 10. Central Tendency and Variation

## Why Measure Central Tendency?

When we have a dataset (e.g., exam scores of 60 students), we want a **single representative value** that summarizes the entire data. Different measures of central tendency are useful in different contexts.

## 10.1 Arithmetic Mean

The arithmetic mean is the sum of all observations divided by n:
$$\bar{x} = \frac{1}{n}\sum_{i=1}^n x_i$$

```r
time <- c(32,35,45,83,79,55,68,38,35,55,66,65,42,68,72,79,67,36,42,58)
mean(time)
# [1] 56.2
```

### With Missing Data (NA)

```r
time_NA <- c(NA,NA,45,83,79,55,68,38,35,55,66,65,42,68,72,79,67,36,42,58)
mean(time_NA, na.rm=TRUE)   # na.rm=TRUE removes NAs before computing
# [1] 56.72222
```

### Weighted Mean

Used when observations have different frequencies or importance:
$$\bar{x}_w = \frac{\sum w_i x_i}{\sum w_i}$$

```r
wt <- c(5, 5, 4, 1)
x  <- c(3.7, 3.3, 3.5, 2.8)
weighted.mean(x, wt)
# [1] 3.4
```

### Mean from Grouped (Frequency) Data

Use `cut()` to divide continuous data into intervals, then compute weighted mean using midpoints:

```r
breaks <- seq(30, 90, by=10)
time.cut <- cut(time, breaks, right=FALSE)
table(time.cut)
# [30,40) [40,50) [50,60) [60,70) [70,80) [80,90)
#       5       3       4       5       2       1

f <- as.numeric(table(time.cut))   # frequencies
m <- c(35, 45, 55, 65, 75, 85)    # midpoints
weighted.mean(m, f)
# This approximates the mean using grouped data
```

## 10.2 Median

The median is the middle value when data is sorted. It is robust to outliers.

```r
median(time)
# [1] 60.5

median(time_NA, na.rm=TRUE)
```

## 10.3 Quartiles and Quantiles

Quartiles divide data into 4 equal parts. The p-th quantile Q(p) is the value below which proportion p of data falls.

```r
quantile(time)           # 0%, 25%, 50%, 75%, 100%
quantile(time, probs=seq(0,1,0.1))   # deciles
quantile(time, probs=seq(0,1,0.01))  # percentiles
```

R has 9 different quantile algorithms (types 1–9):
- Types 1, 2, 3: for discrete data
- Types 4–9: for continuous data

```r
quantile(time, probs=seq(0,1,0.01), type=1)
quantile(time, probs=seq(0,1,0.01), type=7)  # default
```

Specific quantile values:
```r
quantile(time, 1/19)
quantile(time, c(1/19, 2/19, 5.5/19, 9/19))
```

## 10.4 Mode

The mode is the most frequently occurring value. R's built-in `mode()` returns the storage type of an object, NOT the statistical mode!

```r
# To find the mode:
modetable <- table(singer$height)
names(modetable)[modetable == max(modetable)]
```

**When is mode used?**
- A fruit juice shop wants to know which juice is most preferred.
- A clothing shop wants to know which shirt size is most in demand.
- In general: mode is useful for **nominal/categorical** data.

## 10.5 Geometric Mean

Used for **rates of growth or interest** (multiplicative processes):
$$G = \left(\prod_{i=1}^n x_i\right)^{1/n}$$

```r
(prod(x))^(1/length(x))

# With frequencies:
prod(x^wt)^(1/sum(wt))
```

## 10.6 Harmonic Mean

Used for **average speed when distances are equal** (harmonic processes):
$$H = \frac{n}{\sum_{i=1}^n \frac{1}{x_i}}$$

```r
1 / mean(1/x)

# With frequencies:
1 / weighted.mean(1/x, wt)
```

**Example**: A car travels 100km at 50 km/h and 100km at 100 km/h. Average speed = harmonic mean of 50 and 100 = 2/(1/50 + 1/100) = 66.67 km/h. (NOT arithmetic mean of 75!)

---

## 10.7 Measures of Variation (Dispersion)

Measures of variation tell us how spread out the data is around the center.

### Range

$$\text{Range} = \max - \min$$

```r
max(time) - min(time)
# [1] 51

range(time)   # gives both min and max: [1] 32 83
range(time_NA, na.rm=TRUE)
```

### Interquartile Range (IQR)

$$IQR = Q_3 - Q_1$$

Robust to outliers — only uses the middle 50% of data.

```r
IQR(time)
# [1] 33

IQR(time_NA, na.rm=TRUE)
```

### Quartile Deviation (Semi-IQR)

$$QD = \frac{IQR}{2} = \frac{Q_3 - Q_1}{2}$$

```r
IQR(time) / 2
```

### Absolute Deviation About a Point

$$\frac{1}{n}\sum |x_i - a|$$

```r
mean(abs(time - 50))         # about 50
mean(abs(time_NA - 50), na.rm=TRUE)
```

### Mean Absolute Deviation (MAD) About the Median

$$MAD = \frac{1}{n}\sum |x_i - \tilde{x}|$$

```r
mean(abs(time - median(time)))
```

### Mean Absolute Deviation About the Mean

$$\frac{1}{n}\sum |x_i - \bar{x}|$$

```r
mean(abs(time - mean(time)))
```

### Variance

**Population variance**: $\sigma^2 = \frac{1}{n}\sum(x_i - \bar{x})^2$

**Sample variance** (used in R's `var()`): $s^2 = \frac{1}{n-1}\sum(x_i - \bar{x})^2$

```r
var(time)
# [1] 249.5368

var(time_NA, na.rm=TRUE)
```

The `n-1` denominator (Bessel's correction) makes `s²` an **unbiased estimator** of the population variance σ².

### Standard Deviation

$$s = \sqrt{s^2}$$

```r
sqrt(var(time))   # same as sd(time)
```

### Coefficient of Variation (CV)

Relative measure of dispersion — expresses standard deviation as a fraction of the mean:
$$CV = \frac{s}{\bar{x}}$$

Useful for comparing variability across datasets with different units or scales.

```r
sqrt(var(time)) / mean(time)          # as proportion
sqrt(var(time)) / mean(time) * 100    # as percentage
```

---

# 11. Distribution Functions in R

## The Four Function Families

For any distribution `dist` in R, there are four functions:
- `d`dist — **density** (PDF) or **probability mass** (PMF) at x
- `p`dist — **CDF**: P(X ≤ q)
- `q`dist — **quantile**: smallest x such that P(X ≤ x) ≥ p
- `r`dist — generate **random numbers**

## 11.1 Uniform Discrete Distribution

```r
a <- sample(1:10, size=10000, replace=TRUE)
mean(a)          # should be ≈ 5.5 = (1+10)/2
var(a)           # should be ≈ 8.25 = (10^2-1)/12
table(a)
barplot(table(a)/length(a), ylim=c(0,0.15))
```

## 11.2 Binomial Distribution

X ~ Bin(n, p): number of successes in n independent trials with success probability p.
- E[X] = np, Var(X) = np(1−p)

```r
# PMF: P(X=x) for X ~ Bin(100, 0.5)
k <- 0:100
prob_mass <- dbinom(x=k, size=100, prob=0.5)
plot(k, prob_mass, type="h", main="Binomial PMF")

# CDF: P(X ≤ 48) for X ~ Bin(100, 0.5)
pbinom(48, 100, 0.5)            # ≈ 0.4602
pbinom(48, 100, 0.5, lower.tail=FALSE)  # P(X > 48) ≈ 0.5398

# Median of Bin(100, 0.5):
qbinom(0.5, 100, 0.5)           # [1] 50

# Generate random numbers from Bin(10, 0.7):
g <- rbinom(n=10000, size=10, prob=0.7)
mean(g)    # ≈ 7 = 10×0.7
```

## 11.3 Poisson Distribution

X ~ Poisson(λ): number of events in a fixed interval when events occur at rate λ.
- E[X] = Var(X) = λ

```r
dpois(x, lambda)      # PMF
ppois(q, lambda)      # CDF
qpois(p, lambda)      # quantile
rpois(n, lambda)      # random generation
```

## 11.4 Geometric Distribution

X ~ Geom(p): number of failures before first success.

```r
dgeom(x, prob)
pgeom(q, prob)
qgeom(p, prob)
rgeom(n, prob)
```

## 11.5 Normal Distribution

X ~ N(μ, σ²): the most important continuous distribution.
- Bell-shaped, symmetric about μ
- Standard normal: Z ~ N(0,1)

```r
# PDF: plot normal density with mean=2, sd=2
curve(dnorm(x, mean=2, sd=2), xlim=c(-1,5),
      ylab="Density", main="Normal Density: N(2,4)")

# CDF: P(X ≤ 18) for X ~ N(20, 4)
pnorm(18, mean=20, sd=2)         # ≈ 0.1587
pnorm(18, mean=20, sd=2, lower.tail=FALSE)  # P(X>18) ≈ 0.8413

# P(17 < X < 21):
pnorm(21, mean=20, sd=2) - pnorm(17, mean=20, sd=2)

# Standardization: P(X≤18) for N(20,4) = P(Z≤-1)
pnorm(-1)    # ≈ 0.1587 ✓

# Quantiles:
qnorm(0.9, mean=20, sd=2)   # 90th percentile ≈ 22.56
qnorm(0.1, mean=20, sd=2, lower.tail=FALSE)  # same result

# Random generation:
rnorm(4, 20, 2)   # 4 values from N(20,4)

x <- rnorm(10, 20, 2)
mean(x)    # ≈ 20
var(x)     # ≈ 4
```

**Key properties of normal distribution:**
- ~68% of data within μ ± σ
- ~95% within μ ± 2σ
- ~99.7% within μ ± 3σ

## 11.6 Exponential Distribution

X ~ Exp(rate=λ): time between events in a Poisson process.
- E[X] = 1/λ, Var(X) = 1/λ²

```r
dexp(x, rate=1)      # PDF
pexp(q, rate=1)      # CDF: P(X ≤ q) = 1 - e^(-λq)
qexp(p, rate=1)      # quantile
rexp(n, rate=1)      # random generation
```

---

# 12. Confidence Intervals

## 12.1 Key Concepts

A **confidence interval (CI)** for a parameter θ is a random interval [L̂, Û] such that:
$$P_\theta(L̂ \leq \theta \leq Û) \geq 1 - \alpha$$

- **(1−α)** is called the **confidence coefficient** (e.g., 95% CI has α=0.05)
- The interval is **random** (it varies from sample to sample); the parameter θ is **fixed** (but unknown)
- We say the interval covers θ with probability (1−α), **not** that there's a (1−α) probability that θ is in any particular realized interval

**Length of CI**: shorter intervals indicate more precise estimation. Wider intervals reflect more uncertainty.

**Frequency interpretation**: If we take N independent samples and compute N CIs, approximately N(1−α) of them will contain the true parameter.

## 12.2 Pivotal Quantity Method

A **pivotal quantity** g(X₁,...,Xₙ; θ) depends on both the sample and θ but has a distribution that doesn't depend on θ.

**Example**: For X ~ N(μ, σ₀²) with known variance:
$$g = \frac{\bar{X} - \mu}{\sigma_0/\sqrt{n}} \sim N(0,1)$$

This is the standard normal — its distribution doesn't depend on μ. We can use it to construct a CI for μ.

## 12.3 CI for Mean with Known Variance

$$\bar{X} \pm z_{\alpha/2} \cdot \frac{\sigma_0}{\sqrt{n}}$$

where $z_{\alpha/2}$ = `qnorm(1-α/2)` = upper α/2 critical value of N(0,1).

```r
mu <- 3; sigma_0 <- 7
x <- rnorm(10000, mu, sigma_0)

LB <- mean(x) - qnorm(0.975) * sigma_0 / sqrt(length(x))
UB <- mean(x) + qnorm(0.975) * sigma_0 / sqrt(length(x))
cat(LB, UB)
```

For 95% CI: z_{0.025} = qnorm(0.975) ≈ 1.96

## 12.4 CI for Mean with Unknown Variance (t-interval)

When σ is unknown, replace it with the sample standard deviation S:
$$\frac{\bar{X} - \mu}{S/\sqrt{n}} \sim t(n-1)$$

**t distribution** has heavier tails than normal; as n → ∞, t(n-1) → N(0,1). For n > 30, the difference is negligible in practice.

### Example: 20 Temperature Readings

```r
temp <- c(40.2,32.8,38.2,43.5,47.6,36.6,38.4,45.5,44.4,40.3,
          34.6,55.6,50.9,38.9,37.8,46.8,43.6,39.5,49.9,34.2)
n <- length(temp)       # 20
Xbar <- mean(temp)      # ≈ 41.965
S <- sqrt(var(temp))    # sample SD

# t critical values for α=0.05, df=19:
qt(0.025, 19)    # ≈ -2.093
qt(0.975, 19)    # ≈  2.093 (symmetric)

# Two-sided 95% CI:
Lower <- Xbar + qt(0.025, 19) * S / sqrt(n)
Upper <- Xbar - qt(0.025, 19) * S / sqrt(n)
cat(Lower, Upper)
```

Equivalently:
```r
lower <- mean(temp) - qt(0.975,19) * sqrt(var(temp)/20)
upper <- mean(temp) + qt(0.975,19) * sqrt(var(temp)/20)
cat(lower, upper)
```

**One-sided CIs:**
```r
mean(temp) - qt(0.95,19)*sqrt(var(temp)/20)   # upper confidence bound
mean(temp) + qt(0.95,19)*sqrt(var(temp)/20)   # lower confidence bound
```

### Using t.test()

```r
t.test(temp, conf.level=0.95)$conf.int              # two-sided
t.test(temp, conf.level=0.95, alternative="less")$conf.int    # one-sided upper
t.test(temp, conf.level=0.95, alternative="greater")$conf.int  # one-sided lower
```

## 12.5 CI for Variance

$$(n-1)S^2/\sigma^2 \sim \chi^2(n-1)$$

The chi-squared distribution is **not symmetric**, so both critical values matter:

$$\left(\frac{(n-1)S^2}{\chi^2_{1-\alpha/2,n-1}},\ \frac{(n-1)S^2}{\chi^2_{\alpha/2,n-1}}\right)$$

```r
var(temp)             # ≈ 28.25

qchisq(0.025, 19)     # ≈ 8.907 (lower critical value)
qchisq(0.975, 19)     # ≈ 32.85 (upper critical value)
# Note: chi-sq is NOT symmetric!

lower <- (n-1) * var(temp) / qchisq(0.975, 19)
upper <- (n-1) * var(temp) / qchisq(0.025, 19)
cat(lower, upper)

# One-sided:
(n-1)*var(temp)/qchisq(0.95, 19)   # lower confidence bound
(n-1)*var(temp)/qchisq(0.05, 19)   # upper confidence bound
```

### Using packages:
```r
library(EnvStats)
varTest(temp, alternative="two.sided", conf.level=0.95)$conf.int

library(DescTools)
VarTest(temp, alternative="two.sided", conf.level=0.95)$conf.int
VarCI(temp, method="classic", conf.level=0.95, sides="two.sided")
```

## 12.6 CI for Standard Deviation

$$\left(\sqrt{\frac{(n-1)S^2}{\chi^2_{1-\alpha/2}}},\ \sqrt{\frac{(n-1)S^2}{\chi^2_{\alpha/2}}}\right)$$

```r
sqrt((n-1)*var(temp)/qchisq(0.975,19))   # lower bound for SD
sqrt((n-1)*var(temp)/qchisq(0.025,19))   # upper bound for SD
```

---

# 13. Statistical Inference

## 13.1 Why Statistical Inference?

We observe a **sample** and want to draw conclusions about the **population**. The key challenge: we only see part of the data, so our conclusions carry uncertainty.

**Assumptions**:
- X₁, ..., Xₙ are i.i.d. (independent and identically distributed)
- The sample is representative of the population

**Parametric inference**: The form of the population distribution is known; we estimate unknown parameters.

**Nonparametric inference**: The distribution is unspecified; methods are distribution-free.

## 13.2 Point Estimation

A **point estimate** is a single value used to estimate a population parameter.

### Unbiasedness

θ̂ is an **unbiased estimator** (UBE) of θ if:
$$E[\hat{\theta}] = \theta$$

**Bias**: $B(\hat{\theta}) = E[\hat{\theta}] - \theta$

**Example** (from notes): Population {1, 3, 5}, μ = 3. Samples of size 2:
- (1,3): x̄ = 2
- (1,5): x̄ = 3
- (3,5): x̄ = 4
- E(x̄) = (2+3+4)/3 = 3 = μ ✓

So x̄ is an unbiased estimator of μ.

### R Demonstration of Unbiasedness

```r
unbiasednormal <- function(n, rep) {
  out <- matrix(nrow=rep, ncol=4, data=0)
  colnames(out) <- c("Mean","Variance","Median","Sum_dev_frm_M")
  mu <- 10; sigma2 <- 25
  
  for(r in 1:rep) {
    x <- rnorm(n, mu, sqrt(sigma2))
    out[r,1] <- mean(x)
    out[r,2] <- var(x)
    out[r,3] <- median(x)
    out[r,4] <- sum(x - median(x)^2)
  }
  
  cat("E(sample mean) =", mean(out[,1]), "\n")
  cat("E(sample variance) =", mean(out[,2]), "\n")
  cat("E(sample median) =", mean(out[,3]), "\n")
  cat("E(sum(x-median^2)) =", mean(out[,4]), "\n")
}

unbiasednormal(100, 3)
unbiasednormal(1000, 300)
```

**Results**:
- E(sample mean) ≈ 10 = μ ✓ (unbiased)
- E(sample variance) ≈ 25 = σ² ✓ (unbiased — because R uses n-1)
- E(sample median) ≈ 10 = μ ✓ (also unbiased for symmetric distributions)
- But variance of median > variance of mean — so mean is a **better** estimator

## 13.3 Efficiency

When we have multiple unbiased estimators, prefer the one with **smaller variance**.

**Relative efficiency** of θ̂₁ vs θ̂₂:
$$e(\hat{\theta}_1, \hat{\theta}_2) = \frac{Var(\hat{\theta}_1)}{Var(\hat{\theta}_2)}$$

If this ratio > 1, θ̂₂ is more efficient.

**MSE (Mean Squared Error)**:
$$MSE(\hat{\theta}) = E[(\hat{\theta} - \theta)^2] = Var(\hat{\theta}) + [Bias(\hat{\theta})]^2$$

For unbiased estimators, MSE = Variance.

### Three Estimators of μ for N(10, 25)

```r
varnormal <- function(n, rep) {
  out <- matrix(nrow=rep, ncol=3, data=0)
  mu <- 10; sigma2 <- 25
  
  for(r in 1:rep) {
    x <- rnorm(n, mu, sqrt(sigma2))
    out[r,1] <- mean(x)      # estimator 1: sample mean
    out[r,2] <- x[1]         # estimator 2: just first observation
    out[r,3] <- (x[1]+x[2])/2  # estimator 3: average of first two
  }
  
  cat(var(out[,1]), var(out[,2]), var(out[,3]), "\n")
}

varnormal(1000, 50)
```

**Expected variances** (theoretical):
- Var(x̄ₙ) = σ²/n = 25/1000 = 0.025
- Var(X₁) = σ² = 25
- Var((X₁+X₂)/2) = σ²/2 = 12.5

So x̄ₙ is vastly more efficient — the UMVUE (Uniformly Minimum Variance Unbiased Estimator).

---

# 14. Q-Q Plots

## What is a Q-Q Plot?

A **Quantile-Quantile (Q-Q) plot** compares the quantile structure of two datasets (or a dataset vs a theoretical distribution). If the two distributions are the same, the points fall along the diagonal line y = x.

## Two-Sample Q-Q Plot

```r
A <- c(0,2,4,6,8,10)
B <- c(10,8,6,4,2,0)
qqplot(A, B)
abline(0,1, col="red")
# Points fall on a line (but not y=x — it's a reflected distribution)
```

```r
C <- c(10,5.12,2.16,0.64,0.08,0)
qqplot(A, C)
abline(0,1, col="red")
# Points NOT on a line → different distributions
```

## Q-Q Plot vs Normal (qqnorm)

`qqnorm()` compares data against standard normal quantiles. If data is normal, points lie on a straight line.

```r
x <- rnorm(10000)
qqnorm(x)
qqline(x, col="red", lwd=2)   # connects Q1 and Q3, should be straight
```

```r
y <- rexp(10000)   # from exponential dist
qqnorm(y)
qqline(y)           # points curve upward → NOT normal
```

## Q-Q Plot vs Exponential

```r
qqplot(qexp(ppoints(10000), 1), y,
       xlab='Theoretical Quantiles', ylab='Sample Quantiles')
abline(0,1, col="green", lwd=3)
# Points lie on y=x → data is exponential ✓
```

`ppoints(n)` generates the sequence (i−0.5)/n for i=1,...,n — a uniform grid of probabilities.

## Q-Q Plot vs Weibull

```r
r <- rweibull(1000, shape=2, scale=3)
s <- qweibull(ppoints(1000), 2, 3)
qqplot(s, r, xlab='Theoretical Quantiles', ylab='Sample Quantiles')
abline(0,1, col="green", lwd=3)
# Good fit → data is Weibull ✓
```

### Comparing Two Weibull Distributions with Different Parameters

```r
x.wei <- rweibull(2000, shape=2.1, scale=1)   # slightly different shape
x.teo <- rweibull(2000, shape=2.0, scale=1)
qqplot(x.teo, x.wei, main="QQ-plot: Weibull")
abline(0,1, col="cyan", lwd=2.5)
# Points deviate from line → different distributions
```

**Tip**: For theoretical quantiles in Q-Q plots, always use `q*dist(ppoints(n), ...)` instead of generating random numbers — this gives exact quantile points without randomness.

---

# 15. CLT and Weak Law of Large Numbers

## 15.1 Central Limit Theorem (CLT)

**Statement**: Let X₁, ..., Xₙ be i.i.d. with mean μ and variance σ². Then:
$$\sqrt{n}\frac{(\bar{X}_n - \mu)}{\sigma} \xrightarrow{d} N(0,1) \text{ as } n \to \infty$$

Or equivalently: $\bar{X}_n \approx N(\mu, \sigma^2/n)$ for large n.

**Key insight**: Regardless of the original distribution, sample means become approximately normal as n grows.

### Demonstration: Density of Sample Mean for Different n (Normal Population)

```r
Density_Normal_mean <- function(n, col) {
  rep <- 100000; mu <- 0; sigma_2 <- 1
  M <- numeric(rep)
  for(i in 1:rep) {
    x <- rnorm(n, mu, sigma_2)
    M[i] <- mean(x)
  }
  lines(density(M), col=col, lwd=2)
}

plot(NULL, xlim=c(-1.5,1.5), ylim=c(0,10),
     xlab="Sample Mean", ylab="Density",
     main="Density of Sample Mean for Different n")

Density_Normal_mean(10,  "red")
Density_Normal_mean(30,  "blue")
Density_Normal_mean(100, "green")
Density_Normal_mean(500, "purple")

legend("topright",
       legend=c("n=10","n=30","n=100","n=500"),
       col=c("red","blue","green","purple"), lwd=1)
```

**What you observe**: As n increases, the density curve becomes narrower and taller — the sampling distribution concentrates around the true mean μ = 0.

### CLT with Exponential Distribution

```r
rep <- 5000; n_values <- c(5, 10, 30, 50)
par(mfrow=c(2,2))

for(n in n_values) {
  means <- numeric(rep)
  for(i in 1:rep) {
    x <- rexp(n, rate=1)
    means[i] <- mean(x)
  }
  
  hist(means, probability=TRUE,
       main=paste("Sample Mean (n =", n, ")"),
       xlab="Sample Mean", col="lightblue", border="white")
  
  # Overlay normal approximation: N(1, 1/n)
  curve(dnorm(x, mean=1, sd=1/sqrt(n)), col="red", lwd=2, add=TRUE)
  abline(v=1, col="darkgreen", lwd=2)
}
```

**What you observe**: Even though Exp(1) is right-skewed, the sampling distribution of x̄ becomes approximately normal as n increases. By n=30, the approximation is excellent.

## 15.2 Weak Law of Large Numbers (WLLN)

**Statement**: For X₁, ..., Xₙ i.i.d. with mean μ:
$$\bar{X}_n \xrightarrow{P} \mu \text{ as } n \to \infty$$

i.e., $\forall \epsilon > 0$: $P(|\bar{X}_n - \mu| > \epsilon) \to 0$

**Convergence in probability** — the sample mean is increasingly likely to be arbitrarily close to μ as n grows.

### Demonstration: Bernoulli Trials (Law of Large Numbers for Coin Flips)

```r
x <- sample(c(0,1), 1000, replace=TRUE)
sample_mean <- cumsum(x) / (1:1000)

plot(sample_mean, type="l", lwd=2,
     ylab="Proportion of Heads",
     xlab="Number of Tosses")
abline(h=0.5, col="red", lwd=2)
```

**What you observe**: The running proportion fluctuates wildly at the start, then stabilizes near 0.5.

### Demonstration: Normal Distribution

```r
n <- 1000
x <- rnorm(n, 10, 0.01)
sample_mean <- cumsum(x) / (1:n)

plot(sample_mean, type="l", col="blue", lwd=2,
     xlab="n", ylab="Sample Mean",
     main="Weak Law of Large Numbers")
abline(h=10, col="red", lwd=2)
```

### Estimating P(|X̄ₙ − 0| > 0.2) for Different n

```r
rep <- 1000; n_values <- c(10, 50, 100, 200); eps <- 0.2
results <- numeric(length(n_values))

for(j in 1:length(n_values)) {
  n <- n_values[j]
  means <- numeric(rep)
  for(i in 1:rep) {
    x <- rnorm(n, 0, 1)
    means[i] <- mean(x)
  }
  results[j] <- mean(abs(means - 0) > eps)
}

data.frame(n=n_values, Probability=results)
```

**Expected results**: As n increases, P(|X̄ₙ| > 0.2) → 0. This demonstrates WLLN empirically.

**Theoretical probabilities** (using CLT, X̄ₙ ~ N(0, 1/n)):
- n=10: P(|Z| > 0.2√10) = P(|Z| > 0.632) ≈ 0.527
- n=50: P(|Z| > 0.2√50) ≈ P(|Z| > 1.414) ≈ 0.157
- n=100: P(|Z| > 0.2√100) = P(|Z| > 2) ≈ 0.046
- n=200: P(|Z| > 0.2√200) = P(|Z| > 2.83) ≈ 0.005

---

# 16. MLE Using optim()

## 16.1 Maximum Likelihood Estimation (MLE)

Given data x = (x₁,...,xₙ) and a parametric model f(x;θ), the MLE maximizes:
$$L(\theta) = \prod_{i=1}^n f(x_i;\theta)$$

Equivalently, minimize the **negative log-likelihood**:
$$-\ell(\theta) = -\sum_{i=1}^n \log f(x_i;\theta)$$

## 16.2 optim() — General-Purpose Optimization

```r
optim(par, fn, method="Nelder-Mead", lower, upper, ...)
```
- `par`: initial parameter guess
- `fn`: function to minimize
- `method`: optimization algorithm
- Returns list with `$par` (optimal parameters), `$value` (minimum value), `$convergence`

## 16.3 Example 1: Beta Distribution MLE

```r
x <- rbeta(100, shape1=2, shape2=5)

neg_loglik <- function(par) {
  a <- par[1]; b <- par[2]
  -sum(dbeta(x, shape1=a, shape2=b, log=TRUE))
}

result <- optim(
  par = c(1, 1),          # initial guesses
  fn = neg_loglik
)

result$par   # ≈ c(2, 5) — recovers true parameters
```

## 16.4 Example 2: Custom Distribution MLE

**Distribution**: f(x;θ) = (1 + θx)/c where c = 1 + θ/2 is the normalizing constant (x ∈ [0,1]).

**Generating data via inverse transform**:

The CDF is F(x;θ) = (x + θx²/2)/(1 + θ/2). Setting F(x) = u and solving for x:
$$x = \frac{-1 + \sqrt{1 + 2\theta u(1 + \theta/2)}}{\theta}$$

```r
n <- 100; theta <- 2
u <- runif(n)
x <- (-1 + sqrt(1 + 2*theta*u*(1 + theta/2))) / theta
range(x)   # should be in [0,1]
```

**Negative log-likelihood**:
$$-\ell(\theta) = -\sum \log(1 + \theta x_i) + n \log(1 + \theta/2)$$

```r
neg_loglik <- function(theta) {
  -sum(log(1 + theta*x)) + length(x)*log(1 + theta/2)
}

result <- optim(
  par = 0.5,
  fn = neg_loglik,
  method = "L-BFGS-B",
  lower = -0.99    # constraint: theta > -1
)

result$par   # ≈ 2 (the true theta)
```

**Plotting the log-likelihood**:
```r
theta_seq <- seq(-0.9, 5, length=1000)
loglik <- sapply(theta_seq, function(t) -neg_loglik(t))

plot(theta_seq, loglik, type="l", lwd=2,
     xlab="theta", ylab="Log-Likelihood")
abline(v=result$par, col="red", lwd=2)
```

## 16.5 Simulation Study: Bias and MSE of MLE

```r
n <- 500; theta_true <- 2; rep <- 500
theta_mle <- numeric(rep)

for(i in 1:rep) {
  u <- runif(n)
  x <- (-1 + sqrt(1 + 2*theta_true*u*(1 + theta_true/2))) / theta_true
  
  neg_loglik <- function(theta) {
    -sum(log(1 + theta*x)) + length(x)*log(1 + theta/2)
  }
  
  result <- optim(
    par = 0.5, fn = neg_loglik,
    method = "L-BFGS-B", lower = -0.99
  )
  
  theta_mle[i] <- result$par
}

bias <- mean(theta_mle - theta_true)
mse  <- mean((theta_mle - theta_true)^2)

cat("Bias:", bias, "\n")
cat("MSE:", mse, "\n")
```

For large n (n=500), MLE is approximately unbiased (bias ≈ 0) and has small MSE — demonstrating **asymptotic unbiasedness** and **consistency** of MLE.

---

# 17. PROBLEM SET 1 (Math Start) — Full Solutions

## Problem 1: Count positives, negatives, zeros

```r
x <- c(3, -5, 0, 12, -7, 8, 0, 4)

count_pos <- 0; count_neg <- 0; count_zero <- 0

for(i in 1:length(x)) {
  if(x[i] > 0)      count_pos  <- count_pos  + 1
  else if(x[i] < 0) count_neg  <- count_neg  + 1
  else               count_zero <- count_zero + 1
}

cat("Positive:", count_pos, "\n")    # 4
cat("Negative:", count_neg, "\n")    # 2
cat("Zero:", count_zero, "\n")       # 2

# Faster vectorized approach:
cat("Positive:", sum(x > 0), "\n")
cat("Negative:", sum(x < 0), "\n")
cat("Zero:",     sum(x == 0), "\n")
```

## Problem 2: while loop — divisible by 4 and 6

A number divisible by both 4 and 6 is divisible by LCM(4,6) = 12.

```r
iterations <- 0
found <- FALSE

while(!found) {
  num <- sample(1:100, 1)
  iterations <- iterations + 1
  if(num %% 4 == 0 && num %% 6 == 0) {
    found <- TRUE
  }
}

cat("Number found:", num, "\n")
cat("Total iterations:", iterations, "\n")
```

**Probability of finding such a number in one draw**: Numbers from 1:100 divisible by 12: 12,24,36,...,96 → 8 numbers out of 100 → probability = 0.08 per draw.

## Problem 3: Sum of first 20 natural numbers (while loop)

$$\sum_{i=1}^{20} i = \frac{20 \times 21}{2} = 210$$

```r
total <- 0
i <- 1

while(i <= 20) {
  total <- total + i
  i <- i + 1
}

cat("Sum =", total, "\n")    # Sum = 210

# Verify:
sum(1:20)    # [1] 210
```

## Problem 4: Log-Logistic Distribution

**CDF**: $F(x) = \frac{1}{1 + (x/\alpha)^{-\beta}}$

**Inverse CDF** (derived by setting F(x) = u and solving):
$$F^{-1}(u) = \alpha \left(\frac{u}{1-u}\right)^{1/\beta}$$

*Derivation*: $u = \frac{1}{1+(x/\alpha)^{-\beta}} \Rightarrow 1-u = \frac{(x/\alpha)^{-\beta}}{1+(x/\alpha)^{-\beta}} \Rightarrow \frac{u}{1-u} = (x/\alpha)^\beta \Rightarrow x = \alpha(u/(1-u))^{1/\beta}$

### (a) Generate 5000 samples (α=2, β=3):

```r
alpha <- 2; beta <- 3; n <- 5000
u <- runif(n)
x <- alpha * (u/(1-u))^(1/beta)
```

### (b) Estimate P(X > 4):

```r
mean(x > 4)
# Compare with theoretical: 1 - F(4) = 1 - 1/(1+(4/2)^{-3}) = 1 - 1/(1+1/8) = 1 - 8/9 ≈ 0.111
```

### (c) Theoretical value:

$$P(X > 4) = 1 - F(4) = 1 - \frac{1}{1+(4/2)^{-3}} = 1 - \frac{1}{1+\frac{1}{8}} = \frac{1}{9} \approx 0.1111$$

```r
1 - 1/(1 + (4/alpha)^(-beta))   # = 1/9
```

## Problem 5: Gompertz Distribution

**CDF**: $F(x) = 1 - \exp\left(-\frac{b}{a}(e^{ax}-1)\right)$, a=0.4, b=1.5

**Inverse CDF** (set F(x) = u and solve):
$$1 - \exp\left(-\frac{b}{a}(e^{ax}-1)\right) = u$$
$$\exp\left(-\frac{b}{a}(e^{ax}-1)\right) = 1-u$$
$$-\frac{b}{a}(e^{ax}-1) = \log(1-u)$$
$$e^{ax}-1 = -\frac{a}{b}\log(1-u)$$
$$e^{ax} = 1 - \frac{a}{b}\log(1-u)$$
$$x = \frac{1}{a}\log\left(1 - \frac{a}{b}\log(1-u)\right)$$

### (a) Generate 10,000 samples:

```r
a <- 0.4; b <- 1.5; n <- 10000
u <- runif(n)
x <- (1/a) * log(1 - (a/b)*log(1-u))
```

### (b) P(X > 3 | X > 2):

```r
mean(x > 3) / mean(x > 2)

# Theoretical: [1 - F(3)] / [1 - F(2)]
S3 <- exp(-(b/a)*(exp(a*3)-1))
S2 <- exp(-(b/a)*(exp(a*2)-1))
S3/S2
```

### (c) Plot ECDF vs theoretical CDF:

```r
plot(ecdf(x), main="ECDF vs Theoretical CDF (Gompertz)",
     xlab="x", ylab="CDF")

x_seq <- seq(0, max(x), length=500)
F_theoretical <- 1 - exp(-(b/a)*(exp(a*x_seq)-1))
lines(x_seq, F_theoretical, col="red", lwd=2)
legend("topleft", c("ECDF","Theoretical"), col=c("black","red"), lwd=2)
```

## Problem 6: LFR and Makeham Distributions

### (i) LFR Distribution

**CDF**: $F_1(x;\theta) = 1 - \exp\left(-(x + \theta x^2/2)\right)$

**Inverse CDF derivation**:
$$\exp\left(-(x + \theta x^2/2)\right) = 1-u$$
$$x + \frac{\theta}{2}x^2 = -\log(1-u)$$
$$\frac{\theta}{2}x^2 + x + \log(1-u) = 0$$

Using quadratic formula (a=θ/2, b=1, c=log(1-u)):
$$x = \frac{-1 \pm \sqrt{1 - 4(\theta/2)\log(1-u)}}{\theta} = \frac{-1 + \sqrt{1 - 2\theta\log(1-u)}}{\theta}$$

(Taking + root since x ≥ 0)

```r
theta <- 0.8; n <- 10000
u <- runif(n)
x_LFR <- (-1 + sqrt(1 - 2*theta*log(1-u))) / theta
range(x_LFR)   # should be ≥ 0

# P(X > 2):
mean(x_LFR > 2)
# Theoretical: 1 - F(2) = exp(-(2 + 0.8*4/2)) = exp(-(2+1.6)) = exp(-3.6)
exp(-(2 + theta*4/2))
```

### (ii) Makeham Distribution

**CDF**: $F_2(x;\theta) = 1 - \exp\left(-(x + \theta(x + e^{-x} - 1))\right)$

**Inverse CDF**: Cannot be solved analytically. Use numerical root-finding:

```r
theta <- 0.5; n <- 10000
u <- runif(n)

# Solve F2(x) = u numerically for each u using uniroot:
x_Makeham <- sapply(u, function(ui) {
  f <- function(x) 1 - exp(-(x + theta*(x + exp(-x) - 1))) - ui
  uniroot(f, lower=0, upper=100)$root
})

# P(X > 3 | X > 1):
mean(x_Makeham > 3) / mean(x_Makeham > 1)

# Theoretical:
S3 <- exp(-(3 + theta*(3 + exp(-3) - 1)))
S1 <- exp(-(1 + theta*(1 + exp(-1) - 1)))
S3/S1
```

## Problem 7: Rolling a Die

```r
library(extraDistr)   # for rdunif

die <- rdunif(100, min=1, max=6)   # 100 rolls of a fair die
# Or equivalently:
die <- sample(1:6, 100, replace=TRUE)

mean(die)     # should be ≈ 3.5 = (1+6)/2
var(die)      # should be ≈ 35/12 ≈ 2.917 = (6^2-1)/12

# PMF barplot:
barplot(table(die)/100, main="Empirical PMF of Die Roll",
        xlab="Outcome", ylab="Probability",
        col="steelblue")
abline(h=1/6, col="red", lty=2)  # theoretical probability
```

**Theoretical values**: For Uniform Discrete on {1,...,6}:
- E[X] = 3.5, Var(X) = (6²−1)/12 = 35/12 ≈ 2.917

## Problem 8: Insurance Claims (Poisson)

Let X ~ Poisson(λ=6) be the number of claims per day.

### (a) P(X < 3) = P(X ≤ 2)

```r
ppois(2, lambda=6)
# Theoretical: e^{-6}(1 + 6 + 18) = e^{-6}×25 ≈ 0.0620
```

### (b) P(exactly 4 claims on exactly 3 of the next 5 days)

Let p = P(X=4) for a single day. Then Y ~ Bin(5, p) and we want P(Y=3).

```r
p <- dpois(4, lambda=6)   # P(X=4) on a single day ≈ 0.1339
dbinom(3, size=5, prob=p)  # P(Y=3)
```

**Calculation**: p = e^{-6}×6⁴/4! = e^{-6}×1296/24 ≈ 0.1339

P(Y=3) = C(5,3)×p³×(1-p)² = 10×0.1339³×0.8661² ≈ 0.00277

---

# 18. PROBLEM SET 1 (Stat Version) — Full Solutions

## Problem 1: Sequences

### (a) 1, 5, 9, 13, ..., 2025 → Sum and t = Σx³

```r
# Arithmetic sequence: a=1, d=4
s_seq <- seq(1, 2025, by=4)
length(s_seq)   # 507 terms

s <- sum(s_seq)
cat("s =", s, "\n")    # = 507 * 1013 = 513591

# Sum of cubes:
t <- sum(s_seq^3)
cat("t =", t, "\n")

# Verification: sum of sequence = n*(a + l)/2 = 507*(1+2025)/2 = 507*1013
507 * 1013   # = 513591
```

**Note**: The sequence 1, 5, 9, ..., 2025 has last term 2025 = 1 + 4(n-1) → n = 507.

### (b) 17, 68, 272, ..., 4456448 → Sum

This is a **geometric sequence**: ratio = 68/17 = 4.

```r
# 17 * 4^0, 17 * 4^1, ..., 17 * 4^k where 17*4^k = 4456448
# 4^k = 4456448/17 = 262144 = 4^9 → k=9, so 10 terms

geo_seq <- 17 * 4^(0:9)
geo_seq[length(geo_seq)]   # should be 4456448

sum(geo_seq)
# Geometric sum: 17 * (4^10 - 1)/(4-1) = 17 * 1048575/3 = 5941099.7...

# Actually let's verify:
17 * (4^10 - 1) / (4-1)
```

### (c) 1,4,4,9,9,9,16,16,16,16,...,100×10 → Store, length, sum

```r
vec <- rep((1:10)^2, times=1:10)
# 1 appears 1 time, 4 appears 2 times, ..., 100 appears 10 times

length(vec)   # = 1+2+3+...+10 = 55
sum(vec)      # = 1*1 + 2*4 + 3*9 + ... + 10*100 = sum(k * k^2) for k=1..10
              # = sum(k^3) = [10*11/2]^2 = 3025
```

### (d) 5,10,...,50 → Extract elements > 25

```r
v <- seq(5, 50, by=5)   # [1]  5 10 15 20 25 30 35 40 45 50
v[v > 25]               # [1] 30 35 40 45 50
```

### (e) x = c(8,12,20,5,18)

```r
x <- c(8, 12, 20, 5, 18)

# (a) Greater than 10 AND less than 20:
x[x > 10 & x < 20]    # [1] 12 18

# (b) Less than 10 OR greater than 15:
x[x < 10 | x > 15]    # [1]  8 20  5 18
```

### (f) x = 1:15, extract elements in {2,5,7,11}

```r
x <- 1:15
x[x %in% c(2,5,7,11)]    # [1]  2  5  7 11
```

### (g) z = c("apple","banana","cherry","date","fig")

```r
z <- c("apple","banana","cherry","date","fig")

# (a) First and third elements:
z[c(1,3)]          # [1] "apple"  "cherry"

# (b) All except "banana":
z[z != "banana"]   # [1] "apple"  "cherry" "date"   "fig"
```

### (h) x = seq(1,50)

```r
x <- seq(1, 50)

# (a) Between 10 and 40 inclusive:
x[x >= 10 & x <= 40]

# (b) Not divisible by 2 AND not divisible by 5:
x[x%%2 != 0 & x%%5 != 0]
# [1]  1  3  7  9 11 13 17 19 21 23 27 29 31 33 37 39 41 43 47 49
```

### (i) x = c("cat","dog","cow","camel","deer")

```r
x <- c("cat","dog","cow","camel","deer")

# (a) Start with "c":
x[startsWith(x, "c")]    # [1] "cat"   "cow"   "camel"

# (b) Exactly 3 characters:
x[nchar(x) == 3]         # [1] "cat" "dog" "cow"
```

## Problem 10: 4×5 Matrix

```r
# Create 4×5 matrix with 1:20, filled column-wise (default):
M <- matrix(1:20, nrow=4, ncol=5)
M
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    5    9   13   17
# [2,]    2    6   10   14   18
# [3,]    3    7   11   15   19
# [4,]    4    8   12   16   20

# (a) Row sums:
rowSums(M)     # [1] 45 50 55 60

# (b) Column means:
colMeans(M)    # [1]  2.5  6.5 10.5 14.5 18.5

# (c) 3rd row, 4th column:
M[3, 4]        # [1] 15
```

## Problem 11: Matrix A with negative elements

```r
A <- matrix(c(3,-1,7,-2,4,-8,5,-6,9), nrow=3)
# Note: filled column-wise!
#       [,1] [,2] [,3]
# [1,]    3   -2    5
# [2,]   -1    4   -6
# [3,]    7   -8    9

# (a) Replace negatives with 0:
A_nonneg <- A
A_nonneg[A_nonneg < 0] <- 0

# (b) Number of negative elements:
sum(A < 0)    # [1] 4

# (c) Square every element:
A^2
```

Wait, the matrix in the problem is given row-by-row:
$$A = \begin{pmatrix} 3 & -2 & 5 \\ -1 & 4 & -6 \\ 7 & -8 & 9 \end{pmatrix}$$

```r
A <- matrix(c(3,-2,5,-1,4,-6,7,-8,9), nrow=3, byrow=TRUE)

# (a)
A_clean <- A; A_clean[A_clean < 0] <- 0

# (b)
sum(A < 0)    # 4

# (c)
A^2
```

## Problem 12: Matrix B and vector v

```r
B <- matrix(c(10,30,50, 20,40,60), nrow=3)
v <- c(1, 2, 3)

# (a) Already created above

# (b) cbind to add v as third column:
C <- cbind(B, v)

# (c) Name the new column "ID":
colnames(C)[3] <- "ID"
# or from scratch:
C <- cbind(B, ID=v)
```

## Problem 13: Matrix A diagonal and trace

$$A = \begin{pmatrix} 4 & 7 & 2 \\ 1 & 5 & 3 \\ 6 & 8 & 9 \end{pmatrix}$$

```r
A <- matrix(c(4,1,6, 7,5,8, 2,3,9), nrow=3)   # column-wise
# or
A <- matrix(c(4,7,2, 1,5,3, 6,8,9), nrow=3, byrow=TRUE)

# (a) Already created

# (b) Main diagonal:
diag(A)    # [1] 4 5 9

# (c) Trace = sum of diagonal:
sum(diag(A))    # [1] 18
```

## Problem 14: Solve system of equations

$$x + y + z = 6$$
$$2x + 3y + z = 11$$
$$x + 2y + 3z = 14$$

```r
A <- matrix(c(1,2,1, 1,3,2, 1,1,3), nrow=3)   # column-wise fill
# The matrix should be:
# [1  1  1]
# [2  3  1]
# [1  2  3]
A <- matrix(c(1,1,1, 2,3,1, 1,2,3), nrow=3, byrow=TRUE)
b <- c(6, 11, 14)
solve(A, b)
# Solution: x=1, y=2, z=3 (verify: 1+2+3=6 ✓, 2+6+3=11 ✓, 1+4+9=14 ✓)
```

## Problem 15: Upper and Lower Triangular Matrices

```r
# Generate 3×3 matrix from standard normal:
set.seed(123)
M <- matrix(rnorm(9), nrow=3)

# Upper triangular:
U <- upper.tri(M, diag=TRUE)
M_upper <- M; M_upper[!U] <- 0
M_upper

# Lower triangular:
L <- lower.tri(M, diag=TRUE)
M_lower <- M; M_lower[!L] <- 0
M_lower
```

---

# 19. PROBLEM SET 2 — Full Solutions

## Problem 1: Sequences

### (a) 1, 5, 9, ..., 2025: s = sum, t = sum of cubes

*(Same as Problem Set 1 Stat, Problem 1(a) — see above)*

### (b) 17, 68, 272, ..., 4456448: sum

*(Same as Problem Set 1 Stat, Problem 1(b) — see above)*

### (c) 1,4,4,9,9,9,...,100 repeated 10 times

*(Same as Problem Set 1 Stat, Problem 1(c) — see above)*

---

# 20. QUIZ 1 — Full Solutions

## Question 1: while loop — divisible by 4 and 6

*(Same as Problem Set 1 Math Start, Problem 2 — see above)*

## Question 2: Sum of first 50 natural numbers (while loop)

$$\sum_{i=1}^{50} i = \frac{50 \times 51}{2} = 1275$$

```r
total <- 0
i <- 1

while(i <= 50) {
  total <- total + i
  i <- i + 1
}

cat("Sum =", total, "\n")    # [1] 1275
```

## Question 3: LFR Distribution

*(Same as Problem Set 1 Math, Problem 6(i) — see detailed solution above)*

## Question 4: Makeham Distribution

*(Same as Problem Set 1 Math, Problem 6(ii) — see detailed solution above)*

## Question 5: Covariance and Correlation (Linear Model)

Generate x ~ N(60, 12²) and y = 4x + ε, ε ~ N(0, 8):

```r
set.seed(42)
n <- 100
x <- rnorm(n, mean=60, sd=12)
eps <- rnorm(n, mean=0, sd=8)   # Note: sd=8, NOT sd=sqrt(8)
y <- 4*x + eps

# (a) Sample covariance:
cov(x, y)
# Theoretical: Cov(4x+ε, x) = 4*Var(x) = 4*144 = 576

# (b) Sample correlation:
cor(x, y)
# Theoretical: Cor = Cov/[sd(x)*sd(y)] = 576/(12*sqrt(4*144+64))
#           = 576/(12*sqrt(640)) ≈ 576/(12*25.3) ≈ 0.9994

# (c) Scatter plot:
plot(x, y, pch=20, col="blue",
     main="Scatter Plot of (x, y) where y = 4x + ε",
     xlab="x", ylab="y")
abline(lm(y ~ x), col="red", lwd=2)
```

**Comment**: The scatter plot shows a strong, positive linear relationship between x and y. The correlation is very close to 1 because the signal (4x) dominates the noise (ε with sd=8 vs y ranging from ~4×36=144 to ~4×84=336). Points cluster tightly around a straight line with slope approximately 4.

## Question 6: Quadratic Relationship Y = X² + ε

```r
x <- seq(-3, 3, length=200)
eps <- rnorm(200, 0, 0.5)
y <- x^2 + eps

# (b) Covariance:
cov(x, y)
# ≈ 0 (approximately zero)

# (c) Correlation:
cor(x, y)
# ≈ 0

# (d) Scatter plot:
plot(x, y, pch=20, col="blue",
     main="Y = X² + ε: Quadratic Relationship",
     xlab="x", ylab="y")
curve(x^2, add=TRUE, col="red", lwd=2)
```

**Explanation for near-zero correlation despite clear pattern**:

Pearson correlation measures only **linear** association. For x symmetric around 0 (from -3 to 3), and y = x²:
$$Cov(X, X^2) = E[X \cdot X^2] - E[X] \cdot E[X^2] = E[X^3] - 0 \cdot E[X^2] = 0$$

because E[X³] = 0 for symmetric distributions. So correlation = 0 even though there is a perfect deterministic relationship Y = X²! Correlation only captures linear relationships.

## Question 7: Subdivided Bar Diagram

```r
# Data:
grain <- matrix(c(40,50,60, 30,35,40, 20,25,30), nrow=3, byrow=TRUE)
rownames(grain) <- c("Wheat","Rice","Maize")
colnames(grain) <- c("2021","2022","2023")

barplot(grain,
        main="Grain Production (tons) by Year",
        xlab="Year", ylab="Production (tons)",
        col=c("gold","green","orange"),
        legend.text=c("Wheat","Rice","Maize"),
        args.legend=list(x="topleft"),
        beside=FALSE)   # beside=TRUE for grouped, FALSE for stacked
```

---

# 21. QUIZ 2 — Full Solutions

## Question 1: while loops

### (a) Collect 10 numbers divisible by 3

```r
count <- 0
collected <- c()

while(count < 10) {
  num <- sample(1:100, 1)
  if(num %% 3 == 0) {
    count <- count + 1
    collected <- c(collected, num)
  }
}

print(collected)
```

### (b) Sum exceeds 100 with classification

```r
total <- 0
numbers <- c()

while(total <= 100) {
  n <- sample(1:20, 1)
  numbers <- c(numbers, n)
  total <- total + n
}

cat("Numbers generated:", numbers, "\n")
cat("Final sum:", total, "\n")
cat("\nClassification:\n")
for(n in numbers) {
  if(n > 10) cat(n, "> 10\n")
  else       cat(n, "< 10\n")
}
```

## Question 2: Y = X² + ε

*(Identical to Quiz 1 Question 6 — full solution above)*

## Question 3: Boxplots for Two Normal Populations

```r
set.seed(100)
data1 <- rnorm(2000, mean=60, sd=10)   # N(60, 10²)
data2 <- rnorm(2000, mean=70, sd=12)   # N(70, 12²)

boxplot(data1, data2,
        names=c("N(60,100)", "N(70,144)"),
        col=c("lightblue","lightgreen"),
        main="Comparison of Two Normal Distributions",
        ylab="Values")
```

**Comparison Commentary**:
- **Median**: N(70,144) has a higher median (~70) compared to N(60,100) (~60). The horizontal line inside the box is visibly higher for the second distribution.
- **Spread (IQR)**: N(70,144) has wider spread (larger IQR) since sd=12 > sd=10. The box height is larger for the second dataset.
- **Whisker length**: Also longer for N(70,144), confirming greater variability.
- **Outliers**: Some outlier points may appear beyond the whiskers (1.5×IQR rule), more likely in N(70,144) due to higher variance.
- **Overall**: The second distribution is shifted upward by ~10 units and is slightly more spread out.

## Question 4: F distribution proof

**Claim**: If X ~ N(5, 4) and Y ~ N(7, 9), then $\frac{9}{4}\left(\frac{X-5}{Y-7}\right)^2 \sim F(1,1)$.

**Theory**:
- $(X-5)/2 \sim N(0,1)$, so $((X-5)/2)^2 \sim \chi^2(1)$
- $(Y-7)/3 \sim N(0,1)$, so $((Y-7)/3)^2 \sim \chi^2(1)$
- If U~χ²(m) and V~χ²(n) independently: (U/m)/(V/n) ~ F(m,n)
- So: $\frac{((X-5)/2)^2/1}{((Y-7)/3)^2/1} = \frac{9(X-5)^2/4}{(Y-7)^2} \cdot \frac{1}{1} = \frac{9}{4}\left(\frac{X-5}{Y-7}\right)^2 \sim F(1,1)$

**R demonstration**:

```r
set.seed(42)
n_sim <- 100000

X <- rnorm(n_sim, mean=5, sd=2)    # N(5, 2²=4)
Y <- rnorm(n_sim, mean=7, sd=3)    # N(7, 3²=9)

Z <- (9/4) * ((X-5)/(Y-7))^2

# Compare empirical distribution to F(1,1):
hist(Z[Z < 20], probability=TRUE, breaks=200,
     main="Empirical vs F(1,1) Distribution",
     xlab="Value", col="lightblue")

x_seq <- seq(0.01, 20, length=500)
lines(x_seq, df(x_seq, df1=1, df2=1), col="red", lwd=2)
legend("topright", c("Empirical","F(1,1)"), col=c("lightblue","red"),
       lwd=c(5,2))

# KS test to check goodness of fit:
ks.test(Z, "pf", df1=1, df2=1)
```

**Note**: F(1,1) has a very heavy tail (Cauchy-like), so the histogram needs xlim restriction for visibility.

## Question 5: Running Sample Mean (WLLN)

```r
set.seed(42)
n <- 500
X <- rnorm(n, mean=0, sd=1)

# (b) Running sample mean:
X_bar_n <- cumsum(X) / (1:n)

# (c) Plot:
plot(1:n, X_bar_n, type="l", lwd=1.5, col="blue",
     xlab="n", ylab=expression(bar(X)[n]),
     main="Running Sample Mean: X₁,...,X₅₀₀ ~ N(0,1)")

# (d) True mean reference line:
abline(h=0, col="red", lwd=2, lty=2)
legend("topright", c("Running mean","True mean μ=0"),
       col=c("blue","red"), lty=c(1,2), lwd=2)
```

**(e) Comment**: The running sample mean fluctuates considerably for small n (high variance), but as n increases, it stabilizes and converges toward the true mean μ = 0. This illustrates the **Weak Law of Large Numbers**: for any ε > 0, P(|X̄ₙ| > ε) → 0. The convergence is a consequence of the variance of X̄ₙ = σ²/n → 0 as n → ∞.

## Question 6: WLLN — Probability Estimation

```r
rep <- 1000
n_values <- c(10, 50, 100, 200)
eps <- 0.2
results <- numeric(length(n_values))

for(j in 1:length(n_values)) {
  n <- n_values[j]
  means <- numeric(rep)
  for(i in 1:rep) {
    x <- rnorm(n, 0, 1)
    means[i] <- mean(x)
  }
  results[j] <- mean(abs(means - 0) > eps)
}

# (c) Table:
result_table <- data.frame(
  n = n_values,
  Probability = results,
  Theoretical = 2*(1 - pnorm(eps * sqrt(n_values)))
)
print(result_table)
```

**(d) & (e) Comment**: The estimated probability P(|X̄ₙ| > 0.2) decreases as n increases. This is because X̄ₙ ~ N(0, 1/n) by CLT, so:

$$P(|\bar{X}_n| > 0.2) = P\left(|Z| > \frac{0.2}{\sqrt{1/n}}\right) = P(|Z| > 0.2\sqrt{n}) \to 0$$

As n grows, 0.2√n → ∞, so the probability → 0. This empirically illustrates the WLLN: the sample mean converges in probability to the true mean (0 in this case).

---

# APPENDIX: Key R Functions Reference

## Statistical Functions
| Function | Description |
|----------|-------------|
| `mean(x)` | arithmetic mean |
| `var(x)` | sample variance (n-1 denominator) |
| `sd(x)` | sample standard deviation |
| `median(x)` | median |
| `quantile(x, p)` | p-th quantile |
| `IQR(x)` | interquartile range |
| `cor(x,y)` | Pearson correlation |
| `cov(x,y)` | covariance |

## Distribution Functions (example for normal)
| Function | Description |
|----------|-------------|
| `dnorm(x, mu, sd)` | PDF at x |
| `pnorm(q, mu, sd)` | P(X ≤ q) |
| `qnorm(p, mu, sd)` | quantile at p |
| `rnorm(n, mu, sd)` | n random samples |

*Same pattern for: binom, pois, exp, t, chisq, f, beta, gamma, geom, unif, weibull, ...*

## Key Critical Values for CIs
```r
qnorm(0.975)      # 1.96 (95% CI, known variance)
qt(0.975, df=n-1) # t critical value (unknown variance)
qchisq(0.025, df=n-1)  # lower chi-sq critical value
qchisq(0.975, df=n-1)  # upper chi-sq critical value
```

---

*End of Document — DSC 318 Complete Study Notes*
*All topics from lecture notes, all examples, all problem set questions fully solved.*
