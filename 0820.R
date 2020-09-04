##������ Ž�� : ������ �м� ���� �ܰ�

#�ڷ��� Ư���� ���� �з�
#1. ������ �ڷ� : �����ڷ����� �θ���. ������ ���� ���� �Ǵ� �׷����� ������ �� �ִ� ������ ������ �ڷ�
#2. ������ �ڷ� : �����ڷ����� �θ���. ũ�Ⱑ �ִ� ���ڵ�� ������ �ڷ� (������� ����)

#������ ������ �ڷῡ Ư���� ���� ����ȭ�� �з��� �����ϰ�, ���� �м� ����� �����Ѵ�.
#���� / ���� ���� , ���� / �������� ����

#���� ���� �ڷ��� Ž�� 1.������ 2.����м� 3.���׷��� 4.�ڷ��� Ž�� �ǽ�

#������: 2���� ������ ������ �ڷ��� ������ �˾ƺ��� �׷���.
#���ߺ���(�Ǵ� �ٺ����ڷ�) �� 2�����ڷḦ �м� (�������������̳� ��Ʈ������ �־)


######
#�� ���� ������ ������. mtcar���� �߷�(wt)�� ����(mpg)�� ���踦 �˾ƺ���
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt,mpg, #plot�� R�ȿ� ����ִ�.
     main="�߷�-���� �׷���",
     xlab="�߷�",
     ylab="����(MPG)",
     col="red",
     pch=19)

#���� �����鰣�� ������. pairs�� �̿�����
vars <- c("mpg", "disp", "drat", "wt")
target <- mtcars[,vars]
head(target)
pairs(target,
      main="Multi Plots")

#�׷� ������ �ִ� �� ������ ������
#�׷� ������ �˰� �ִٸ� �������� �ۼ� �� �� �׷캰 ���������� �ٸ� ����� ���� ������� ǥ���� ������
iris.2 <- iris[,3:4]
point <- as.numeric(iris$Species)
point
color <- c("red", "green", "blue")
plot(iris.2, main="iris plot",
     pch=c(point),
     col=color[point])

#######
#����м�, ���ַ��� ���� ���ݳ��� �������
beers = c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1, 0.03, 0.19, 0.12, 0.04, 0.0095, 0.07, 0.06, 0.02, 0.05)
tbl <- data.frame(beers, bal)
tbl
plot(bal~beers, data=tbl)
res <- lm(bal~beers, data=tbl)
abline(res) #ȸ�ͼ� �׸���
cor(beers,bal) #���������
#���: ���� ������踦 ����. ���� �������� �ƴ����� ���� ����� �ִ�.

cor(iris[,1:4])

########
#���׷����� �ۼ�, ���� ������
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month, 
     late,
     main="������ ���", #ydata
     type = "l", #����
     lty = 1, #������
     lwd = 1, #���� ����
     xlab = "Month", #x�� ���̺�
     ylab = "Late cnt" #y�� ���̺�
     )
     