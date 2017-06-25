source("Rscripts/init.R")
# Text mining reference: http://onepager.togaware.com/TextMiningO.pdf
###################
# the bash code below should be executed in your terminal when a new publication
# is added in the dropbox folder:
# for f in ~/Dropbox/LetiR/publi/*.pdf; pdftotext -enc ASCII7 -nopgbrk $f"
docs <- Corpus(
  DirSource(
    directory = "~/Dropbox/LetiR/publi",
    pattern="*.txt")
    )
###################
# inspect(docs[1])
# getTransformations()
stopwords_pers <-  c("hence", "since", "university", "can", "also", "null", "using", "may",
  "first", "will", "one", "two", "three", "fig", "tab", "eqn", "therefore", "although", "aij", "clearly")
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
  names=c("R", "Open-data", "Open-Science", "Markdown", "Latex", "Python", "C/C++", "Web", "Javascript", "Julia"),
  freq=c(300, 220, 240, 180, 100, 100, 100, 100, 100, 70)
  )
## Combine the dataset / order and keeb the 500 more frequent words
dat <- rbind(datext, datdoc)
dat <- dat[rev(order(dat$freq)),]
dat <- dat[1:800,]
# print(head(dat))

# imgwc <- "assets/img/butterfly.png"
# imgwc <- "assets/img/favicon.png"
imgwc <- "assets/img/tortue.png"
wc_aut <- wordcloud2(dat, figPath = imgwc, size = 2, color="white", backgroundColor=1)
##
saveWidget(wc_aut, paste0(getwd(),"/assets/ourWordcloud.html"), selfcontained = FALSE)
## convert into png
# webshot("./assets/ourWordcloud.html", "./assets/img/ourWordcloud.png", delay = 10)
