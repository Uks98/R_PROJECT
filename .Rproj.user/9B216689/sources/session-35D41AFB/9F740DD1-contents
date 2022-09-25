install.packages("foreign")
install.packages('tidyverse')
library('tidyverse')
library(foreign)
library(dplyr) #전처리
library(ggplot2) #시각화
library(readxl)

raw_welfare <- read.spss(file = "C:/savfolder/Koweps_hpc10_2015_beta1.sav",to.data.frame = T) #to.data.frame은 spss파일을 데이터 프레임으러 변경 , F = 리스트
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


welfare$income <- ifelse(welfare$income %in% c(0,9999),NA,welfare$income)
table(is.na(welfare$income))

summary(welfare$birth)

#나이변수 결측치 확인
table(is.na(welfare$birth))

#이상치 결측처리
welfare$birth <- ifelse(welfare$birth == 9999,NA,welfare$birth)
table(is.na(welfare$birth))

#파생변수만들기
welfare$age <- 2015 - welfare$birth + 1

summary(welfare$age)
qplot(welfare$age)

#나이별 평균 만들기

age_income <- welfare %>% 
  filter(!is.na(welfare$income)) %>% 
  group_by(age) %>% 
  summarise(income_mean = mean(income)) 
age_income

#그래프 만들기
ggplot(data = age_income, aes(x = age,y = income_mean)) + geom_line() + xlab("나이") + ylab("평균 월급")

