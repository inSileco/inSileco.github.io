library(wordcloud2)
library(webshot)
library(htmlwidgets)


dat <- readLines('words2wordle.txt')
dat <- strsplit(dat, ':')
word <- unlist(lapply(dat, function(x) x[1]))
freq <- unlist(lapply(dat, function(x) x[2]))
dat <- data.frame(word, freq)
dat$word <- as.character(dat$word)
dat$freq <- as.numeric(as.character(dat$freq))
dat <- dat[order(dat$freq), ]

# Make the wordcloud
my_graph <- wordcloud2(dat, figPath = "img/moose.png", size = 1.5)



# save it in html
saveWidget(my_graph,"tmp.html",selfcontained = F)

# and in png
webshot("tmp.html","fig_1.pdf", delay =5, vwidth = 480, vheight=480)
