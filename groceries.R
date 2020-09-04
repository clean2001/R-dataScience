##���� �м�

#��Ű�� ��ġ �� �ε�
library(arules)
library(arulesViz)

#������ ���б�
?Groceries
data("Groceries")
summary(Groceries)

#������ ���
inspect(Groceries)
inspect(Groceries[1:3])

#������ ��Ȳ
itemFrequency(Groceries)
itemFrequencyPlot(Groceries,
                  xlab="��ǰ ������", ylab="����",
                  col=1:5, topN=10)

#���� ��Ģ ����
rules <- apriori(Groceries,
                 parameter=list(supp=0.02, conf=0.4,
                                minlen=2, maxlen=3))

#���� ��Ģ ����
inspect(rules)


#���� ��Ģ �׷��� ���
plot(rules, method="graph",
     control=list(nodeCol="green", edgeCol="red", alpha=1))

#Ư�� ��ǰ�� ������ �޴� ��ǰ
rules2 <- apriori(Groceries,
                  parameter=list(supp=0.02, conf=0.4, minlen=2, maxlen=3),
                  appearance = list(default="rhs",lhs="root vegetables"))
inspect(rules2)
                  