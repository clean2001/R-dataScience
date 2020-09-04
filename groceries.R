##연관 분석

#패키지 설치 및 로딩
library(arules)
library(arulesViz)

#데이터 셋읽기
?Groceries
data("Groceries")
summary(Groceries)

#데이터 출력
inspect(Groceries)
inspect(Groceries[1:3])

#데이터 현황
itemFrequency(Groceries)
itemFrequencyPlot(Groceries,
                  xlab="상품 아이템", ylab="비율",
                  col=1:5, topN=10)

#연관 규칙 생성
rules <- apriori(Groceries,
                 parameter=list(supp=0.02, conf=0.4,
                                minlen=2, maxlen=3))

#연관 규칙 보기
inspect(rules)


#연관 규칙 그래프 출력
plot(rules, method="graph",
     control=list(nodeCol="green", edgeCol="red", alpha=1))

#특정 상품에 영향을 받는 상품
rules2 <- apriori(Groceries,
                  parameter=list(supp=0.02, conf=0.4, minlen=2, maxlen=3),
                  appearance = list(default="rhs",lhs="root vegetables"))
inspect(rules2)
                  