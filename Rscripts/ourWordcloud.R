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
  "first", "will")
docs %<>% tm_map(content_transformer(tolower))
docs %<>% tm_map(removeNumbers)
docs %<>% tm_map(removePunctuation)
docs %<>% tm_map(removeWords, stopwords("english"))
docs %<>% tm_map(removeWords, stopwords_pers)
docs %<>% tm_map(toString, "species distribution model", "SDM")
docs %<>% tm_map(toString, "species distribution models", "SDM")
docs %<>% tm_map(toString, "ecol", "ecology")
docs %<>% tm_map(toString, "SDMs", "SDM")
###################
# cat("*Wourdcloud to be added* <br/><br/>")
dtm <- DocumentTermMatrix(docs)
freq <- colSums(as.matrix(dtm))
dat <- data.frame(names=names(freq), freq=freq)
dat <- dat[rev(order(dat$freq)), ]
wc_aut <- wordcloud2(dat, figPath = "./img/butterfly.png", size = 2, color="white", backgroundColor=1)
