library(ggplot2)
library(dplyr)
ggplot(data = mpg,aes(x = displ,y=hwy)) +geom_point() + xlim(3,6) + ylim(10,30)


ggplot(data = mpg, aes(x = cty,y=hwy))+geom_point()

ggplot(data = midwest,aes(x = poptotal,y=popasian)) + geom_point() + xlim(0,500000) + ylim(0,10000)

df_mpg<- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

df_mpg
ggplot(data = df_mpg,aes(x = drv, y = mean_hwy)) + geom_col()
ggplot(data = df_mpg,aes(x = reorder(drv,-mean_hwy), y = mean_hwy)) + geom_col()

mpg_car <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)

mpg_car
ggplot(data = mpg_car,aes(x =reorder(manufacturer,-mean_cty),y=mean_cty)) + geom_col()

ggplot(data = mpg, aes(x = class)) + geom_bar()

ggplot(data = economics,aes(x = date,y=unemploy))+geom_line()

ggplot(data = economics,aes(x = date,y=psavert))+geom_line()


mpg_data <- mpg %>% 
  filter(class %in% c("compact","suv","subcompact"))

ggplot(data = mpg_data,aes(x = class , y = cty)) + geom_boxplot()
