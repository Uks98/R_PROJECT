install.packages("foreign")
install.packages('tidyverse')
library('tidyverse')
library(foreign)
library(dplyr) #전처리
library(ggplot2) #시각화
library(readxl)

raw_welfare <- read.spss(file = "C:/savfolder/Koweps_hpc10_2015_beta1.sav",
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


welfare$income <- ifelse(welfare$income %in% c(0,9999),NA,welfare$income)
table(is.na(welfare$income))
table(welfare$sex)
welfare$sex <- ifelse(welfare$sex == 9, "NA",welfare$sex)
welfare$sex
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)
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

#나이를 연령대로 분류해서 비교
#초년 30세 미만 중년 30~59 노인 60세이상
welfare <- welfare %>% 
  mutate(ageg = ifelse(age < 30, "young", 
                       ifelse(age <= 59,"middle","old")))
table(welfare$ageg)
qplot(welfare$ageg)

age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))

age_income

#나이순으로 정렬
ggplot(data = age_income,aes(x = ageg,y=mean_income))+ geom_col() + scale_x_discrete(limits = c("young","middle","old")) + xlab("연령대") + ylab("월급")

#성별 월급차이는 연령대별로 다른지 분석

sex_income<- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mean_sex_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x = ageg,y = mean_sex_income, fill = sex)) + 
  geom_col(position = "dodge")+
  scale_x_discrete(limits = c("young","middle","old"))+
  xlab("나이 순") + ylab("월급")


#나이 및 성별 월급 평균표를 만들어 그래프 표현

sex_age <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age,sex) %>% 
  summarise(mean_income = mean(income))

ggplot(data = sex_age, aes(x = age, y = mean_income,col = sex)) + geom_line(position = 'dodge')+
  xlab("나이") + ylab("월급")
