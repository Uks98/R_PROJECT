ex <- exam

library(dplyr)

# 7,8번
ex %>% 
  mutate(total = math +english + science,
         mean = (math + english + math)/3) %>% 
        head(5)

# 7,8번 실행시 exam 필드가 5개가 있다 78번 필드가 생긴다 안생긴다? - 안생긴다 변수 안에 집어 넣어야 생긴다.

mpg <- as.data.frame(ggplot2::mpg)
mpx <- as.data.frame(ggplot2::mpg)

mp_ex <- mpg %>% 
  mutate(sum = cty+hwy)

mp_average <- mp_ex %>%
  mutate(average = sum / 2)

mp_average %>% arrange(-average) %>% 
  head(5)

mpx %>% mutate(sum = cty+hwy, average = cty + hwy / 2) %>% 
  arrange(-average) %>% 
  head(5)
