## packages
library(leaflet)
library(magrittr)
library(knitr)
library(wordcloud2)
library(webshot)
library(htmlwidgets)
library(htmltools)
library(tm)

## functions
addiconurl <- function(url, icon){
  paste0("<a href='", url, "'><i class='", icon, "'></i></a>")
}
##
addSpace <- function(nb=1){
  paste(rep("&nbsp;", nb), collapse=" ")
}
##
source("Rscripts/addAuthorsLinks.R")
