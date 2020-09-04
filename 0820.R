##데이터 탐색 : 데이터 분석 전의 단계

#자료의 특성에 따른 분류
#1. 범주형 자료 : 질적자료라고도 부른다. 성별과 같이 범주 또는 그룹으로 구분할 수 있는 값으로 구성된 자료
#2. 연속형 자료 : 양적자료라고도 부른다. 크기가 있는 숫자들로 구성된 자료 (산술연산 가능)

#변수의 개수와 자료에 특성에 따라 세분화된 분류가 가능하고, 각각 분석 방법이 존재한다.
#단일 / 다중 변수 , 범주 / 연속형에 따라

#다중 변수 자료의 탐색 1.산점도 2.상관분석 3.선그래프 4.자료의 탐색 실습

#산점도: 2개의 변수로 구성된 자료의 분포를 알아보는 그래프.
#다중변수(또는 다변량자료) 즉 2차원자료를 분석 (데이터프레임이나 매트릭스에 넣어서)


######
#두 변수 사이의 산점도. mtcar에서 중량(wt)과 연비(mpg)의 관계를 알아보자
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt,mpg, #plot은 R안에 들어있다.
     main="중량-연비 그래프",
     xlab="중량",
     ylab="연비(MPG)",
     col="red",
     pch=19)

#여러 변수들간의 산점도. pairs를 이용하자
vars <- c("mpg", "disp", "drat", "wt")
target <- mtcars[,vars]
head(target)
pairs(target,
      main="Multi Plots")

#그룹 정보가 있는 두 변수의 산점도
#그룹 정보를 알고 있다면 산점도를 작성 시 각 그룹별 관측값들을 다른 색깔과 점의 모양으로 표시할 수있음
iris.2 <- iris[,3:4]
point <- as.numeric(iris$Species)
point
color <- c("red", "green", "blue")
plot(iris.2, main="iris plot",
     pch=c(point),
     col=color[point])

#######
#상관분석, 음주량과 혈중 알콜농도의 상관관계
beers = c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1, 0.03, 0.19, 0.12, 0.04, 0.0095, 0.07, 0.06, 0.02, 0.05)
tbl <- data.frame(beers, bal)
tbl
plot(bal~beers, data=tbl)
res <- lm(bal~beers, data=tbl)
abline(res) #회귀선 그리기
cor(beers,bal) #상관계수계산
#결론: 양의 상관관계를 보임. 강한 상관관계는 아니지만 양의 상관이 있다.

cor(iris[,1:4])

########
#선그래프의 작성, 월별 지각생
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month, 
     late,
     main="지각생 통계", #ydata
     type = "l", #제목
     lty = 1, #선종류
     lwd = 1, #선의 굵기
     xlab = "Month", #x축 레이블
     ylab = "Late cnt" #y축 레이블
     )
     