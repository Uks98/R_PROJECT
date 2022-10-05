library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)
class(mpg)
dim(mpg)
tail(mpg)
qplot(data = mpg , x = drv,y=hwy,geom = 'boxplot')

qplot(data = mpg, x = class, y = hwy, geom = "line")

score <- c(80,60,70,50,90,70,70,40,80)

score_mean <- mean(score)
score_mean

qplot(score)

english <- c(40,60,70,90)
math <- c(50,80,70,90)
class <- c(1,1,2,2)

#------------- 4장 --------------
data_class = data.frame(english,math,class)
mean(data_class$english)
data_class

n1 <- data.frame(name = c("김지훈","이유진","박동현","김민지"),
                 english = c(90,80,60,70),
                 math = c(50,60,100,20))
n1

#------------엑셀 불러오기----

install.packages("readxl")
library("readxl")

df_exam<- read_excel("C:/Rdata_excel/excel_exam.xlsx")
df_novar<- read_excel("C:/Rdata_excel/excel_exam_novar.xlsx",col_names = F)
df_sheet<- read_excel("C:/Rdata_excel/excel_exam_sheet.xlsx",sheet = 3)
df_student <- read_excel("C:/Rdata_excel/studentInfo.xlsx ")
df_student

df_exam
df_novar
df_sheet

df_csv <- read.csv("C:/Rdata_csv/csv_exam.csv")
df_cnovar <- read.csv("C:/Rdata_csv/csv_exam_novar.csv",header = F)
df_csv
df_cnovar

#데이터 프레임 csv로 만들기
df_mid<- data.frame(math = c(40,50,90,60),
                    english = c(80,70,30,50),
                    science = c(92,10,50,80))

df_mid

write.csv(df_mid,"df_midcsv.csv")

df_class <- data.frame(name = c("김","성","이","홍"),
                       class = c(1,2,3,4),
                       school = c("한라대학교","서울대학교","건국대학교","강릉원주대학교"))

df_class
write.csv(df_class,"df_class.csv")

####97page

df_ex2 = data.frame(id = c(11,12,13,14),name = c("김","성","박","이"))
class(df_ex2)
write.csv(df_ex2,file = "df_ex2.csv")
#r데이터 파일로 저장
save(df_ex2, file = "df_exe.rda")
load("df_ex2.rda")
