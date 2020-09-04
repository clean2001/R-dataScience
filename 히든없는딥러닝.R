#딥러닝 실습

install.packages("neuralnet")
library(neuralnet)


#데이터 작성 
x1 <- c(0,0,1,1)
x2 <- c(0,1,0,1) #or연산을 위한 입력 데이터들
d <- c(0,1,1,1) #or연산을 위한 출력 데이터

trainset <- data.frame(x1,x2,d)
trainset

testset <- data.frame(x1,x2,d)
testset

nn <- neuralnet(d~x1+x2,
                trainset,
                hidden=0,
                linear.output=FALSE)

#학습 모형 출력
plot(nn)

#인공 신경망 모형 출력
nn$result.matrix
nn$startweights[[1]][[1]]
nn$weights[[1]][[1]]
nn$net.result


#테스트(분류)
predict <- compute(nn, testset)
predict$net.result

#정확도 평가
predict.bin <- ifelse(predict$net.result>=0.5, 1,0)
predict.bin

##women데이터

women

#데이터 분포 확인
plot(women)

#데이터 정규화. 최대최소 정규화
trainset <- women #훈련용 데이터 세트

max1 <- max(women[,1])
max2 <- max(women[,2])
trainset[,1] <- trainset[,1]/max1
trainset[,2] <- trainset[,2]/max2
trainset

plot(trainset)

#test데이터 만들
testset <- data.frame(height=c(65.5, 70.5))
testset[,1] <- testset[,1]/max1
testset

#모형과 학습
nn <- neuralnet(weight~height,
                trainset,
                hidden=0,
                linear.output=TRUE)

plot(nn)

#테스트(예측)
predict <- compute(nn, testset)
predict$net.result

predict$net.result*max2



####복습####
#하고자하는것 : or연산 값 예측..?

x1 <- c(0,0,1,1)
x2 <- c(0,1,0,1)
d <- c(0,1,1,1)

trainset <- data.frame(x1,x2,d)
testset <- data.frame(x1,x2,d)

nn <- neuralnet(d~x1+x2,
                trainset,
                hidden=0,
                linear.output=FALSE)
plot(nn)

predict <- compute(nn, testset)
predict

#이진 분류

predict.bin <- ifelse(predict$net.result>=0.5, 1,0)
predict.bin

####몸무게 추청####
library(neuralnet)

women
plot(women)

trainset <- women
max1 <- max(women[,1])
min1 <- min(women[,1])
max2 <- max(women[,2])
min2 <- min(women[,2])

trainset[,1] <- (trainset[,1]-min1)/(max1-min1)
trainset[,2] <- (trainset[,2]-min2)/(max2-min2)
summary(trainset)

testset <- data.frame(height=c(65.5, 70.5))

normal <- function(x)(
  return ((x-min(x))/(max(x)-min(x)))
)

testset <- as.data.frame(lapply(testset, normal))

summary(testset)

nn <- neuralnet(weight~height,
                trainset,
                hidden=0,
                linear.output=TRUE)
predict <- compute(nn, testset)
predict$net.result*(max2-min2)+min2
