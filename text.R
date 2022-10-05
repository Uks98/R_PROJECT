#텍스트 마이닝

install.packages("rJava")
install.packages("memoise")
source("https://install-github.me/talgalili/installr")
#installr::in staill.java()
install.packages("KoNLP")

library("KoNLP")

.libPaths()
useNIDic()
extractNoun("나는 지금 공부를 하고있다.")

