#지도학습 분류 예측

install.packages("C50")
library(C50)

#데이터 준비
pclass <- c(1,1,1,1,2,
            2,2,2,2,2)
gender <- c("M","M","M","F","M",
            "M","M","M","F","F")
survived <- c("Y","Y","Y","Y","N",
              "N","N","Y","Y","Y")

train_data <- data.frame("좌석등급"=pclass,
                         "성별"=gender,
                         "생존여부"=survived)
train_data
#테스트 데이터 만들기
pclass<-c(1,2,2)
gender<-c("F","F","M")
test_data <- data.frame("좌석등급"=pclass,
                        "성별"=gender)

#학습 및 모형 출력
str(train_data)
train_data$생존여부 <- as.factor(train_data$생존여부)
train_data$성별 <- as.factor(train_data$성별)
model <- C5.0(생존여부~ ., data=train_data)
summary(model)

plot(model)


#분류 예측
results <- predict(object=model, newdata=test_data)
results
