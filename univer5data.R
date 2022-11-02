install.packages("dplyr")
library(dplyr)
df_csv <- read.csv("C:/Rdata_csv/csv_exam.csv")
data <- as.data.frame(ggplot2::midwest)

data <- rename(mpg, m7 = model)
data<- rename(mpg, m6 = displ)
data<-rename(mpg,highway = hwy)
data<- rename(mpg,clas = class)
View(data)


