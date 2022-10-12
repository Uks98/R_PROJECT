#텍스트 마이닝

install.packages("rJava")
install.packages("memoise")
install.packages("multilinguer")
source("https://install-github.me/talgalili/installr")
install.packages("KoNLP")

install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")

install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library("KoNLP")

.libPaths()
extractNoun("나는 지금 공부를 하고있다.")