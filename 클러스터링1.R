#클러스터링 실습

#1. 데이터 작성
id <- 1:10
x <- c(2,20,20,5,12,4,15,27,25,16)
y <- c(20,18,5,28,24,15,5,10,4,12)
data <- data.frame(ID=id, 식료품=x, 의류=y)
data

#2.
plot(data$식료품, data$의류,
     xlab="식료품", ylab="의류",
     xlim=c(0,30), ylim=c(0,30)) #산포도
text(data$식료품, data$의류,
     labels=data$ID, pos=4, col="blue") #기호 우측에 라벨(ID)표시

#3. 데이터 표준화
data.scaled <- as.data.frame(scale(data[,-1],center=TRUE,scale=TRUE))
data.scaled

#4. 결과 분석
twss <- NULL
for(i in 1:9) {
  kc <- kmeans(data.scaled, center=i)
  twss <- c(twss, kc$tot.withinss)
}

plot(1:9, twss,
     xlim=c(0,10), type="b",
     xlab="군집 수", ylab="TWSS")
