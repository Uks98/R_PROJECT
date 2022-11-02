#텍스트 마이닝

install.packages("rJava")
install.packages("memoise")
install.packages("multilinguer")
source("https://install-github.me/talgalili/installr")
install.packages("KoNLP")
install.packages("dplyr")
library("dplyr")
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")

install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
install.packages('wordcloud')
library("wordcloud")


library("KoNLP")
useNIADic()

.libPaths() #경로 알아보기



extractNoun("나는 지금 R을 공부 하고있다.")
extracNoun("공부")

ex1 <- extractNoun("우리는 지금 10장 텍스트마이닝을 공부하고 있다, 10장은 마이닝 공부입니다")

ex12<- table(unlist(ex1))
ex12


c <- readLines("C:/Rdata_csv/hiphop.txt")


t1 <- str_replace_all(c,"\\W"," ") #특수문자를 빈 공간으로
t1

#명사만 추출
noun <- extractNoun(t1)
View(noun)

#추출한 명사 list를 문자열 벡터로 변환  단어별 빈도표 생성
word_count <- table(unlist(noun))
word_count
head(word_count,9)


#데이터 프레임으로 변환
df_word <- as.data.frame(word_count,stringsAsFactors = F)
View(df_word)

df_word = rename(df_word, word = Var1,freq = Freq)
df_word = filter(df_word,nchar(word) >= 2)


top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

top_20

#x축 y축 변경 
ggplot(top_20,aes(x = word,y=freq)) +
  geom_col()+
  coord_flip()
library("worldcloud")
pal <- brewer.pal(8,"Dark2")
pal_1 <- brewer.pal(9,"Blues")[5:9]
set.seed(1234)
pal
set.seed(1234)
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per =.1,
          scale=c(3,0.1),
          colors = pal_1)



library("stringr")

twitter <- read.csv("C:/Rdata_csv/twitter.csv",header = T,stringsAsFactors = F,fileEncoding = "UTF-8")
twitter <- rename(twitter,no = 번호,
                  id = 계정이름,
                  date = 작성일,
                  tw = 내용)

twitter$tw <- str_replace_all(twitter$tw, "\\W", " ")
head(twitter$tw)

nouns1 <- extractNoun(twitter$tw)
nouns1

word_count <- table(unlist(nouns1))
word_count
head(word_count,9)

#데이터 프레임으로 변환
df_word <- as.data.frame(word_count,stringsAsFactors = F)

df_word<- rename(df_word,word = Var1,freq = Freq)
df_word <- filter(df_word,nchar(word)>=2)

top20<- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

top20

order<- arrange(top20,freq)$word

ggplot(data = top20, aes(x = word,y = freq))+
  ylim(0,2500)+
  geom_col()+
  coord_flip()+
  scale_x_discrete(limit = order) +
  geom_text(aes(label = freq), hjust = -0.3)

pal<- brewer.pal(8,"Dark2")
set.seed(1234)




y2 <- table(unlist(y))

y2 <- filter(y2 , ncahr(y2)>=2)
str_replace_all(y2,"\\W"," ")


#########wordcloud2##########
install.packages("wordcloud2")
library("wordcloud2")

w <- wordcloud2(df_word, color = "blue",shape = "star")
w_diamond <- wordcloud2(df_word,color = "blue",shape = "diamond")
w_diamond
wordcloud2(df_word,color = "blue",shape = "cardioid")

####트위터 전처리 ####

t2<- read.csv("C:/Rdata_csv/twitter.csv",stringsAsFactors = F,header = F,encoding = "UTF-8")
library("dplyr")
install.packages("dplyr")
t2 <- rename(t2,no=번호,id = 계정이름,date = 작성일,tw=내용)

library("stringr")

t2$tw<- str_replace_all(t2,"\\W"," ")

noun <- extaractNoun(t2$tw)
world <- table(unlist(tw))

