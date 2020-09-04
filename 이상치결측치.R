library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA

table(is.na(mpg$drv))
table(is.na(mpg$hwy))

#########
#boxplot을 실습
#1 이상치를 만들기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29,43,129,204), "cty"] <- c(3,4,39,42)

#문자형 데이터일때는 boxplot을 그려볼 수 없으니, table로 확인한다.
table(mpg$drv)

# %in%을 이용해서 확인해보자
mpg$drv <- ifelse(mpg$drv %in% c("4","f","r"), mpg$drv, NA) #만약 4,f,r중에 있으면, 그대로, 아니면 NA로 바꿔줘

table(mpg$drv)

boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty<9|mpg$cty>26,NA,mpg$cty) #이상치 없앰

library(dplyr)
mpg %>%
  filter(!is.na(drv)&!is.na(cty)) %>%
  group_by(drv) %>%
  summarise(mean_hwy<-mean(cty))
