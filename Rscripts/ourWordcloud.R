source("Rscripts/init.R")
# Ref: http://onepager.togaware.com/TextMiningO.pdf
system("for f in ~/Dropbox/LetiR/publi/*.pdf; do pdftotext -enc ASCII7 -nopgbrk $f; done")
###################
docs <- Corpus(
  DirSource(
    directory = "~/Dropbox/LetiR/publi",
    pattern="*.txt")
    )
###################
# inspect(docs[1])
# getTransformations()
stopwords_pers <-  c("since", "university", "can", "also", "null", "using",
  "first", "will", "one", "two", "three", "fig", "tab", "eqn", "therefore", "although", "aij")
docs %<>% tm_map(content_transformer(tolower))
docs %<>% tm_map(removeNumbers)
docs %<>% tm_map(removePunctuation)
docs %<>% tm_map(removeWords, stopwords("english"))
docs %<>% tm_map(removeWords, stopwords_pers)
substit <- content_transformer(function(x, from, to) gsub(from, to, x))
docs %<>% tm_map(substit, from="species distribution model ", to="sdm ")
docs %<>% tm_map(substit, from="species distribution models ", to="sdm ")
docs %<>% tm_map(substit, from="model ", to="models ")
docs %<>% tm_map(substit, from="probabilities", to="probability")
docs %<>% tm_map(substit, from="probabilistic", to="probability")
docs %<>% tm_map(substit, from="theories", to="theory")
docs %<>% tm_map(substit, from="network ", to="networks ")
docs %<>% tm_map(substit, from="distribution ", to="distributions ")
docs %<>% tm_map(substit, from="ecol ", to="ecology ")
docs %<>% tm_map(substit, from="SDMs", to="SDM")
###################
# cat("*Wourdcloud to be added* <br/><br/>")
dtm <- DocumentTermMatrix(docs)
freq <- colSums(as.matrix(dtm))
datdoc <- data.frame(names=names(freq), freq=freq)
datdoc <- datdoc[rev(order(datdoc$freq)), ]
datext <- data.frame(
  names=c("R", "Open-Science", "Markdown", "Latex", "Python", "C/C++", "Web", "Javascript"),
  freq=c(100, 100, 90, 40, 40, 40, 80, 40))
dat <- rbind(datext, datdoc)
wc_aut <- wordcloud2(dat, figPath = "./img/butterfly.png", size = 2, color="white", backgroundColor=1)
