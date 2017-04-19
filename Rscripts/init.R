## packages
library(leaflet)
library(yaml)
library(magrittr)
library(knitr)
library(wordcloud2)
library(webshot)
library(htmlwidgets)

## function
addiconurl <- function(url, icon){
  paste0("<a href='", url, "'><i class='", icon, "'></i></a>")
}
