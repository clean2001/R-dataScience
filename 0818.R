#(1)
sum <- 0
count <- 0

for(i in 1:100){
  if(i%%3==0) {
    sum <- sum+i
    count <- count+1
  }
}

sum
count


#(2)
for(i in 101:200){
  if(i%%3==0&i%%4==0) print(i)
}

#(3)
for(i in 1:24){
  if(24%%i==0) print(i)
}

#(4)
fact<-1
for(i in 1:10){
  fact<-fact*i
}
fact


