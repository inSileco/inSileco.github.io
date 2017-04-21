## packages
library(leaflet)
library(yaml)
library(magrittr)
library(knitr)
library(wordcloud2)
library(webshot)
library(htmlwidgets)

## functions
addiconurl <- function(url, icon){
  paste0("<a href='", url, "'><i class='", icon, "'></i></a>")
}
##
source("Rscripts/addAuthorsLinks.R")
