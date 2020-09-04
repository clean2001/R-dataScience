##women 데이터로 회귀분석

women
x<-women$height
y<-women$weight

#선형관계 확인
plot(x,y,
     xlab="키(in)", ylab="몸무게(lbs)")

#linear 모델 생성
res=lm(y~x)
abline(res)
summary(res)
res
