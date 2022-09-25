
#foreign 패키지로 소프트웨어 파일 분석가능

install.packages("foreign")
install.packages('tidyverse')
library('tidyverse')
library(foreign)
library(dplyr) #전처리
library(ggplot2) #시각화
library(readxl)

#raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T) #to.data.frame은 spss파일을 데이터 프레임으러 변경 , F = 리스트
welfare <- raw_welfare

#데이터 검토하기
head(welfare)
View(welfare)
dim(welfare)
str(welfare)

#변수명 변경
welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

table(welfare$sex)

#이상치 결측 처리
welfare$sex <- ifelse(welfare$sex == 9, NA,welfare$sex)

table(is.na(welfare$sex))

#성별 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male","female")
table(welfare$sex)

class(welfare$income)
summary(welfare$income)
class(welfare$income)

qplot(welfare$income) + xlim(0,1000)

#월급 전처리

welfare$income <- ifelse(welfare$income %in% c(0,9999),NA,welfare$income)
table(is.na(welfare$income))

sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))

sex_income
options(scipen = 99)
#차트만들기
ggplot(data = welfare , aes(x = sex,y=income)) + geom_col(fill = "#edae49")
