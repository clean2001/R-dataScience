##히든있는 딥러닝

concrete <- read.csv("concrete.csv")
str(concrete)

#최대,최소 정규화
normalize <- function(x)(
  return ((x-min(x))/(max(x)-min(x))))

concrete_norm <- as.data.frame(lapply(concrete, normalize))
summary(concrete_norm)

#sample 안하고 그냥 나눔
concrete_train <- concrete_norm[1:773,]
concrete_test <- concrete_norm[774:1030,]
library(neuralnet)
concrete_model1 <- neuralnet(formula=strength~., data=concrete_train)
concrete_model2 <- neuralnet(formula=strength~., data=concrete_train, hidden=3)

plot(concrete_model1)
plot(concrete_model2)

#모델 적용해서 예측
model_results <- compute(concrete_model1, concrete_test[1:8])
pre_str <- model_results$net.result
pre_str

model_results2 <- compute(concrete_model2, concrete_test[1:8])
model_results2$net.result
pre_str2 <- model_results2$net.result
pre_str2
#결과값과 예측값의 상관관계를 분석해서 어느정도 맞아들어가는지 확인
cor(pre_str2, concrete_test$strength)


#평균 제곱근 오차 RMSE확인
diff <- function(x,y)(
  (x-y)^2
)

d <- diff(pre_str, concrete_test$strength)

RESM <- sum(d)/length(d)^(1/2)
RESM

#layer를 추가한 딥러닝
d2 <- diff(pre_str2, concrete_test$strength)

RESM2 <- sum(d2)/length(d2)^(1/2)
RESM2

######복습
concrete

nomalize <- function(x)(
  return ((x-min(x))/(max(x)-min(x)))
)

concrete_norm <- as.data.frame(lapply(concrete, nomalize))

##데이터 나누기
trainset <- concrete_norm[1:800,]
testset <- concrete_norm[801:1030,]
summary(trainset)

library(neuralnet)

nn <- neuralnet(formula=strength~.,
                data=trainset
                )
nn2 <- neuralnet(formula=strength~.,
                data=trainset,
                hidden=3
)

plot(nn)
plot(nn2)


result <- compute(nn, testset[1:8])
result_str <- result$net.result

#결과값과 예측값의 상관관계를 분석해서 어느정도 맞아들어가는지
cor(result_str, testset$strength)
