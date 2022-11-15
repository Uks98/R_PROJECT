library(dplyr)
library(readxl)
exam<- read_excel("C:/Rdata_excel/excel_exam.xlsx")

exam %>% 
  filter(class != 1) %>% 
  head()

exam %>% filter(english > 30)
exam %>% filter(class != 3)
exam %>% filter(science > 70)

exam %>% filter(math < 30 & science == 15)

exam %>% filter(math >= 90 | english  >=90)

exam %>% filter(science > 30 & math < 50)

exam %>% filter(math < 50 | science > 30)
library("ggplot2")
data <- as.data.frame(ggplot2::mpg)
data

dispel_a <- data %>%
  filter(displ <= 4)
dispel_b <- data %>% 
  filter(displ >= 5)

mean(dispel_a$hwy)
mean(dispel_b$hwy)

manufac_a <- data %>% filter(manufacturer == "audi") 
manufac_b <- data %>% filter(manufacturer == "toyota") 

mean(manufac_a$cty)
mean(manufac_b$cty)

kind_of_menu <- data %>% filter(manufacturer %in% c("chevrolet","ford","honda"))
kind_of_menu
mean(kind_of_menu$hwy)

data %>% select(-manufacturer, cty)
data %>% select(manufacturer, cty)

exam %>%
  filter(class == 1) %>% 
  select(english)

class_cty <- data %>% 
  select(class,cty)
class_cty

c1 <- class_cty %>% 
  filter(class == "suv")
c2 <- class_cty %>% 
  filter(class == "compact")

mean(c1$cty)
mean(c2$cty)

#오름차순
exam %>% arrange(math)

#큰 순서대로
exam %>% arrange(-math)

exam %>% arrange(class,math)

data %>% filter(manufacturer == "audi") %>% 
  arrange(-hwy) %>% 
  head(5)

