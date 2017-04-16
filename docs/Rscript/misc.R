library(leaflet)
library(yaml)
library(magrittr)
# 
addiconurl <- function(url, icon){
  paste0("<a href='", url, "'><i class='", icon, "'></i></a>")
}
