## Basics of Loops

###########################################################
#for loop

###########################################################
#syntax
#for (range){
 # statement
#}
###########################################################
#Ex1
#print first 10 natural numbers using for loop


for(i in 1:10){
  print(i)
}
###########################################################
#Ex2
#Print the following:

#1
#1 2
#1 2 3 
#1 2 3 4 
#1 2 3 4 5

for(i in 1:5)
{
  print(1:i)
}

###########################################################

# define a funtion to find the factorial and find the factorial of 4
#Ex3
factorial2 = function(n) {
   out = 1
  for (i in 1:n) {
   out = out*i
  }
   return(out)
}


factorial2(4)

###########################################################

# iF Loop


#if (condition) {
#  statement1
#  else (condition) statement2
#}

###########################################################

#Ex1

# define a funtion to find the absolute value and find the absolute value of -4
 abs2 = function(x) {
   if (x < 0) out = -x
   else out = x
   out
 }
abs2(-4)
 

###########################################################

 #Ex2

#triangular function

 Triangular_fun <- function(x) {
   if (0 <= x & x <= 1/2) {
     out <- x
   } else if (x > 1/2 & x < 1) {
     out <- 1 - x
   } else {
     out <- 0
   }
   return(out)
 }
 Triangular_fun(0.7)
 
 ########################################################### 

 #plotting the triangular function
 Triangular_fun <- function(x) {
   
   out<-numeric(length(x))
   
  for(i in 1:length(x)){
  
   if (0 <= x[i] & x[i] <= 1/2) {
     out[i] <- x[i]
   } else if (x[i] > 1/2 & x[i] < 1) {
     out[i] <- 1 - x[i]
   } else {
     out[i] <- 0
   }
  }
   return(out)
 }
 x <- seq(0, 1, 0.001)
   y <- Triangular_fun(x)
 plot(x, y)

 ########################################################### 
 #while
 
 #print 5 times "respectfully"
 x=1
 while(x<=5){
   x=x+1
   print("respectfully")
 }
 
 ###########################################################
 
#ex2
 
 #define a function to find whether a number is prime and check for 10
  Find_Prime = function(n) {
    i = 2
    if (n < 2) return(FALSE)
    while (i < sqrt(n)) {
      if (n %% i == 0) return(FALSE)
      i = i+1
      }
    return(TRUE)
    }
Find_Prime(10)

  ###########################################################
  
  

