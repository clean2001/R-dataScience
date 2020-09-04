install.packages("readxl")
library(readxl)
df_exam <- read_excel("test.xlsx")
df_exam
airair <- read.csv("airquality.csv")
airair
install.packages("dplyr")
library("dplyr")

#변수 이름을 바꿔보자
df_raw <- data.frame(var1 = c(1,2,3),
                     var2 = c(4,5,6))
df_raw
df_raw <- rename(df_raw, v2 = var2)


##---ggplot2 패키지 안에 있는 mpg데이터를 사용해보자---##
install.packages("ggplot2")
library("ggplot2")
mpg <- as.data.frame(ggplot2::mpg) #mpg데이터를 불러오기
new_mpg <- mpg
new_mpg
head(new_mpg)
new_mpg <- rename(new_mpg, city=cty, highway=hwy)

##----mpg 데이터에 파생변수 만들기----##

new_mpg <- mpg
new_mpg$total <- (new_mpg$cty + new_mpg$hwy)/2 #통합 연비 변수 생성
head(new_mpg) #고속도로 연비와 도시 연비의 평균

##----히스토그램 ----##
summary(new_mpg$total) #요약 통계량 산출
hist(new_mpg$total) #히스토그램 그림
table(new_mpg$total)

##----
colnames(iris)
