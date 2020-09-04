head(swiss)


#1.
subset(swiss, Catholic>=80)["Agriculture"]

#2.
plot(swiss$Catholic, swiss$Fertility,
     xlab="Catholicism", ylab="Fertility")

#3.
#모두 0~1의 값으로 변환
new.swiss <- transform(swiss,
                          Fertility=(Fertility-min(Fertility))/(max(Fertility)-min(Fertility)),
                          Agriculture=(Agriculture-min(Agriculture))/(max(Agriculture)-min(Agriculture)),
                          Examination=(Examination-min(Examination))/(max(Examination)-min(Examination)),
                          Education=(Education-min(Education))/(max(Education)-min(Education)),
                          Catholic=(Catholic-min(Catholic))/(max(Catholic)-min(Catholic)),
                          Infant.Mortality=(Infant.Mortality-min(Infant.Mortality))/(max(Infant.Mortality)-min(Infant.Mortality)))

                       
                       
head(new.swiss)
summary(new.swiss)

#4
set.seed=123
cluster.swiss <- kmeans(new.swiss, centers=3)
plot(new.swiss$Catholic,new.swiss$Fertility,
     xlab="Catholicism", ylab="Fertility",
     pch=21, col=cluster.swiss$cluster)
points(cluster.swiss$centers,
       pch=19, cex=1.5, col=rownames(cluster.swiss$center))


#5
library(arules)
library(arulesViz)
rules1 <- apriori(new.swiss,
                  parameter=list(supp=0.25, conf=0.6, minlen=2))
inspect(rules1)

#Examination과 Catholic 그리고 Catholic과 Fertility의 상관관계가 높다고 판단하였습니다.


x=new.swiss$Examination
y=new.swiss$Catholic
plot(x, y,
     xlab="Examination", ylab="Catholic")
res=lm(y~x)
abline(res)
#####
x=new.swiss$Catholic
y=new.swiss$Fertility
plot(x, y,
     xlab="Catholic", ylab="Fertility")
res=lm(y~x)
abline(res)

summary(res)
res
