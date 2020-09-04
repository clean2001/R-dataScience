install.packages("readxl")
library(readxl)
df_exam <- read_excel("test.xlsx")
df_exam
airair <- read.csv("airquality.csv")
airair
install.packages("dplyr")
library("dplyr")

#���� �̸��� �ٲ㺸��
df_raw <- data.frame(var1 = c(1,2,3),
                     var2 = c(4,5,6))
df_raw
df_raw <- rename(df_raw, v2 = var2)


##---ggplot2 ��Ű�� �ȿ� �ִ� mpg�����͸� ����غ���---##
install.packages("ggplot2")
library("ggplot2")
mpg <- as.data.frame(ggplot2::mpg) #mpg�����͸� �ҷ�����
new_mpg <- mpg
new_mpg
head(new_mpg)
new_mpg <- rename(new_mpg, city=cty, highway=hwy)

##----mpg �����Ϳ� �Ļ����� �����----##

new_mpg <- mpg
new_mpg$total <- (new_mpg$cty + new_mpg$hwy)/2 #���� ���� ���� ����
head(new_mpg) #���ӵ��� ����� ���� ������ ���

##----������׷� ----##
summary(new_mpg$total) #��� ��跮 ����
hist(new_mpg$total) #������׷� �׸�
table(new_mpg$total)

##----
colnames(iris)