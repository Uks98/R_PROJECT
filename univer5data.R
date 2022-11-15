install.packages("dplyr")
library(dplyr)
df_csv <- read.csv("C:/Rdata_csv/csv_exam.csv")
data <- as.data.frame(ggplot2::midwest)

View(data)
#213

df = data.frame(v1=c(1,2,3),v2 = c(3,6,8))
View(df)

df$tf = df$v1 + df$v2
df$df_mean <- mean(df$v1 + df$v2)
df

mpg$total <- (mpg$cty + mpg$hwy)/2
summary(mpg$total)
hist(mpg$total)

mpg$test <- ifelse(mpg$total >= 20, "pass","fail")
View(mpg)

table(mpg$test)
qplot(mpg$test)

mpg$grade <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 25, "B", ifelse(mpg$total >=20,"C","D")))
View(mpg)  

qplot(mpg$grade)

data <- as.data.frame(ggplot2::midwest)
data <- rename(midwest,total = poptotal)
data <- rename(midwest,asian = popasian)

midwest$ratio <- data$asian/data$total*100
hist(midwest$grade)
mean(data$grade)

