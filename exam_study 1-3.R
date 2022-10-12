
mpg <- as.data.frame(mpg)

class(mpg$drv)
mpg$drv <- as.factor(mpg$drv)
class(mpg$drv)

levels(mpg$drv)

s1 <- c(80,20,30)
names(s1) <- c("빅터","야쿠지","키미")
names(s1)[2]

d <- c(1,4,3,7,8)
d

d[1:3]
d[c(1,3,5)]
d[-2]
d[-c(3:5)]

d1 <- c(101:200)
d1

d1[10]
d1[c(0:90)]

d1[0:100 %% 2 == 0]


d_20 <- d1[0:20]
d_20
d_20[-5]
d_20[-c(5,7,9)]

#데이터 구조 혼자서 해보기 

#ppt 1장 맨 밑

h1 <- c(1:50)
h2 <- c(51:100)

sum(h1,h2)
min(h2)
max(h2)
mean(h1)
mean(h2)
v3 <- sort(h1,decreasing = T)
v4 <- sort(h2,decreasing = T)

h3<- v3[0:10]
v4[0:10]

#혼자서 해보기

v1<- 51:90
v1

v1[51:90 < 60]
x1 <- v1[51:90 %% 7 == 3]
x1

mpg<- boxplot(mpg$cty)
mpg <- as.data.frame(ggplot2::mpg)
mpg$stats

str <- c("hello!","world")
str

str <- paste(str,collapse = ",")
str

score <- c(80,60,70,50,90)

score_m <- mean(score)
score_m

