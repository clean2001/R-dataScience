names(airquality)
colnames(airquality)
rownames(airquality)
table(iris[,5])
colSums(iris[,-5])
head(airquality)

Temp.max <- 
  
  
#(3)
Temp.max <- max(airquality$Temp)
air.sub <- subset(airquality, airquality$Temp==Temp.max)
air.sub[, c("Month", "Day")]

#(4)
sub.6 <- subset(airquality, airquality$Month==6)
max(sub.6$Wind)

#(5)
sub.7 <- subset(airquality, airquality$Month==7)
sub.7
colMeans(sub.7["Wind"]) ##���� Ʋ�Ⱦ���......... ���� ��������

#(6)
sub.5 <- subset(airquality, airquality$Month==5&
                            airquality$Ozone!='NA') ##���� NA�� ����ǥ�� �ٿ��־�� ���ư���
colMeans(sub.5["Ozone"])

#(7)
sub.Ozone100 <- subset(airquality, airquality$Ozone>100)
nrow(sub.Ozone100) 