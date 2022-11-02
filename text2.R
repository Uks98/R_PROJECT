
a <- readLines("asdasda")

useNIADic()

x <- str_replace_all(a,"\\W"," ")

c<- extractNoun(x)

b<- table(unlist(c))

u <- data.frame(b)

u <- filter(u,nchar(20)>=2)

renam <- rename(u,
                word = var1,
                freq = frq)

top20 <- renam %>% 
  arrange(desc(word)) %>% 
  head(20)

library(RcolorBrewer)
R.pal()

wordcloud(
  d
)