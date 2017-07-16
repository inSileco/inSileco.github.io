## ----addStatus, echo=FALSE, results="asis", message=FALSE----------------
  source("Rscripts/addStatus.R")
  addStatus("AcademiconsInR.Rmd")

## ----infosession---------------------------------------------------------
sessionInfo()[[1]]$version.string

## ---- eval = FALSE-------------------------------------------------------
## install.packages(c('magrittr', 'showtext'))

## ----libraries, message=FALSE--------------------------------------------
library(magrittr)
library(showtext)
library(graphicsutils)

## ----showtext------------------------------------------------------------
showtext.auto()

## ---- echo=FALSE---------------------------------------------------------
font.paths("assets/AcadeiconsInR")

## ----addfont-------------------------------------------------------------
font.add(family = 'Academicons', regular = 'academicons.ttf')
font.add(family = 'FontAwesome', regular = 'FontAwesome.otf')
font.add(family = 'Ionicons', regular = 'ionicons.ttf')

## ----academ, fig.width=9.5, fig.height=5---------------------------------
nb <- 35
acs <- sprintf("%02d", 0:nb) %>% paste0("E9",.)

## ----figacadem, fig.width=9.5, fig.height=5------------------------------
coord <- expand.grid(1:9, 1:4)
cols <- c("#6b9952", "#8059a7", "#c9780c", "#0d3b6b")
##
par(mar=c(0,0,0,0))
plot(c(0,9), c(0,5), type="n", ann=FALSE, axes=FALSE)
text(coord[,1], coord[,2], labels= acs,  offset = 1.6, cex=.66, pos=1)
##
par(family = "Academicons")
points(coord[,1], coord[,2], pch=-as.hexmode(acs), cex=3, col=cols)

## ----figfontawe, fig.width=9.5, fig.height=9-----------------------------
nsq <- 12
fas <- 1:(nsq*nsq) %>% as.hexmode %>% paste0("f0", .)
coord <- expand.grid(1:nsq, 1:nsq)
par(mar=c(2,2,2,2), family = 'FontAwesome')
plot(coord[,1], coord[,2], pch=-as.hexmode(fas), cex=2.5, col=cols, ann=FALSE, axes=FALSE)

## ----figionic, fig.width=9.5, fig.height=8-------------------------------
val <- 61970:62046
ias <- sapply(val, FUN=intToUtf8)
coord <- expand.grid(rev(1:11), 1:7)
##
par(mar=c(2,2,2,2), family = "Ionicons")
plot(coord[,1], coord[,2], ann=FALSE, axes=FALSE, pch=ias, cex=2.5, col=cols)

## ----volcano, fig.width=9.5, fig.height=7--------------------------------
data(volcano)
par(las=1, mar=c(4,5,4,4))
image(volcano, col=colorRampPalette(c("grey10", "grey90"))(100))
contour(volcano, add=T, col="#c9780c")
title(main = toupper("My volcano"), cex.main=2)
##
par(family="FontAwesome")
title(ylab=intToUtf8(61552), cex.lab=2)
points(0.336, 0.58, pch=-as.hexmode("F041"), col="#b92a0a", cex=2.5)
##
par(family = "Ionicons")
points(0.946, 0.943, pch=-as.hexmode("F203"), col="grey95", cex=4)
points(0.451, 0.091, pch=-as.hexmode("F448"), col="#b92a0a", cex=2)
##
par(family = "Academicons")
mtext(text=intToUtf8("59651"), side=4, adj=1, line=3, cex=3)

