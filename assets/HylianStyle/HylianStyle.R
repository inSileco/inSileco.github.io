## ----addStatus, echo=FALSE, results="asis", message=FALSE----------------
  source("Rscripts/addStatus.R")
  addStatus("HylianStyle.Rmd")

## ---- echo = TRUE, eval = TRUE-------------------------------------------
sessionInfo()[[1]]$version.string

## ---- echo = TRUE, eval = TRUE-------------------------------------------
# Create a directory < fonts >
dir <- "_tmp/dir"
dir.create("_tmp/fonts", showWarnings = FALSE)

# Download Triforce font < Triforce.ttf >
url <- "http://zeldauniverse.net/wp-content/uploads/2014/01/Triforce.ttf_.zip"
download.file(url, paste0("dir", basename(url)))
dir("dir")

# Unzip the file
untar(paste0("dir", basename(url)), exdir = "dir", compressed = "gzip")
dir("dir")

# Remove .zip
file.remove(paste0("dir", basename(url)))
dir("dir")

## ---- echo = TRUE, eval = FALSE------------------------------------------
## install.package("showtext", dependencies = TRUE)
## library(showtext)

## ---- echo = FALSE, eval = TRUE------------------------------------------
library(showtext)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
showtext.auto()
font.files()

## ---- echo = TRUE, eval = FALSE------------------------------------------
## font.paths("dir")

## ---- echo = FALSE, eval = TRUE------------------------------------------
gsub("/Users/nicolascasajus/", "~/", font.paths("dir"))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
# Is the TTF present?
font.files()[grep("Triforce", font.files())]

## ---- echo = TRUE, eval = TRUE-------------------------------------------
font.add(family = 'Triforce', regular = 'Triforce.ttf')
font.families()

## ---- echo = TRUE, eval = TRUE, fig.width = 9.5, fig.height = 7, fig.showtext = TRUE----
par(family = "Triforce", las = 1, cex.lab = 2, cex.main = 2, mar = c(4, 5, 5, 0))
plot(x = c(0, 1), y = c(0, 1), type = "n", xlab = "X-axis", ylab = "Y-axis")
title(main = "Hylian Style - Link must be proud of us!")
points(x = runif(7), y = runif(7), pch = "*", cex = 2)
points(x = runif(7), y = runif(7), pch = "$", cex = 2, col = "#347AB7")
points(x = 0.1, y = 0.1, pch = "%", cex = 6, col = "#347AB7")

