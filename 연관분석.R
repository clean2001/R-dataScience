#패키지
install.packages("arules")
install.packages("arulesViz")

library("arules")
library("arulesViz")

#데이터 파일 읽기
trans <- read.transactions(file.choose(), format="basket", sep=",");
trans

#트랜잭션 데이터 출력
inspect(trans)

#데이터 현황 분석
itemFrequencyPlot(trans, type="absolute",
              xlab="상품아이템", ylab="거래 빈도",
              col=1:5)
itemFrequencyPlot(trans,
                  xlab="상품아이템", ylab="거래 비율",
                  col=1:5, topN=5)
#연관 규칙 생성
rules <- apriori(trans, parameter=list(supp=0.4, conf=0.7, minlen=2))

#결과 분석
inspect(rules)
rules2 <- subset(rules, lift>1.0)
rules3 <- sort(rules2, by="lift", decreasing = TRUE)
plot(rules2, method="graph",
     control=list(nodeCol="green", edgeCol="red", alpha=1))

#특정 상품에 영향을 받은 상품
rules4 <- apriori(trans,
                  parameter=list(supp=0.4, conf=0.7, minlen=2),
                  appearance=list(default="rhs", lhs="A"))
inspect(rules4)

#특정 상품 판매에 영향을 준 상품
rules5 <- apriori(trans,
                  parameter=list(supp=0.4,conf=0.7,minlen=2),
                  appearance=list(default="lhs", rhs="B"))
inspect(rules5)
