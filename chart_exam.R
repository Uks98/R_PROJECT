#그래프 살펴보기

library(ggplot2)

#산점도를 만들어보자
#배경 -> 차트 -> 차트설정
#1. 배경
#2. + 기호를 사용해 gemo_point추가, ggplot은 +기호를 사용한다.
#2-1 데이터를 일부만 보여주고 싶을때 축 설정을 사용한다. 
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() +
  xlim(3,6) + 
  ylim(10,30)

#mpg데이터의 도시연비와 고속도로 연비간에 어떤 관계가 있는지 알아보려한다.
ggplot(data = mpg,aes(x = cty,y = hwy)) + geom_point()

#미국 지역별 아시아인 인구 간에 어떤 관계가 있는지 알아보자
ggplot(data = midwest, aes(x = poptotal,y = popasian)) + geom_point() + xlim(0,500000) + ylim(0, 10000)

#막대그래프, 데이터의 크기를 그래프로 표현
library(dplyr)

df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

df_mpg

#reorder() 설정시 막대값을 크기 순으로 정렬, x축의 변수와 정렬 기준으로 삼을 변수 설정 - 붙일시 내림차순
ggplot(data = df_mpg,aes(x = reorder(drv,-mean_hwy),y=mean_hwy)) + geom_col()

#빈도 막대 그래프,x축만표시
ggplot(data = mpg,aes(x = drv))+ geom_bar()

#어떤 회사에서 생산한 suv차종의 도시연비가 높은지 알아보려한다.
mpg
cty_suv = mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(5)
cty_suv
ggplot(data = cty_suv, aes(x = reorder(manufacturer,-mean_cty),y = mean_cty)) + geom_col()

#자동차 중에서 어떤 class(자동차종류) 많은지 알아보려한다. 빈도표를 만들자
ggplot(data = mpg, aes(x = class)) + geom_bar()

#선그래프 시계열 그래프
ggplot(data = economics,aes(x = date,y = unemploy)) + geom_line()

#시간에 따라 개인저축률 알아보기
ggplot(data = economics,aes(x = date,y=psavert)) + geom_line()

#상자그림 데이터의 분포(퍼져있는 형태)를 직사각형 상자모양으로 표현한 그래프이다.
ggplot(data = mpg,aes(x = drv, y= hwy)) + geom_boxplot()

