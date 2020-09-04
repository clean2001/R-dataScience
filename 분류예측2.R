#iris 데이터 분류 예측

#패키지 불러오기
library(C50)

#데이터 준비
iris

set.seed(3598) #씨드 초기화
idx <- sample(1:nrow(iris), size=nrow(iris)*0.8)
idx

train_data <- iris[idx,]
train_data

test_data <- iris[-idx,]
test_data


#모형 1. 가지치기가 없는 경우
c5_options <- C5.0Control(noGlobalPruning=T, CF=1)
model1 <- C5.0(Species~., data=train_data, control=c5_options)
summary(model1)
plot(model1)

#모형2. 지역적 가지치기
c5_options <- C5.0Control(noGlobalPruning=T, CF=0.25)
model2 <- C5.0(Species~., data=train_data, control=c5_options)
summary(model2)
plot(model2)

#모형3: 전역적 가지치기
c5_options <- C5.0Control(noGlobalPruning=F, CF=1)
model3 <- C5.0(Species~., data=train_data, control=c5_options)
summary(model3)
plot(model3)

#분류 예측
results <- predict(object=model1, newdata=test_data)
table(results, test_data[,5])
