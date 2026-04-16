#loops
#for loop
for(i in 1:10){
  print(i)
}

for(i in 1:5){
  print(1:i)
}

factorial1<-function(m){
  n=1
  for(i in 1:m){
    n=n*i
  }
  return(n)
}

factorial1(6)


#if
if(x<0){
  print("s is negative")
}else{
  print("x is non negative")
}


abs<-function(x){
  if(x<0){
    x<-x*(-1)
  }
  else{
    x<-x
  }
  return(x)
}
abs(-5)


#while 
i=1
while(i<=5){
  print("Fuck UGC")
  i=i+1
}

i=1
while(i<=10){
  print(i)
  i=i+1
}


