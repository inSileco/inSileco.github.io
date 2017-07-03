## packages
library(leaflet)
library(magrittr)
library(knitr)
library(wordcloud2)
library(webshot)
library(htmlwidgets)
library(htmltools)
library(tm)

#### functions

addiconurl <- function(url, icon){
  paste0("<a href='", url, "'><i class='", icon, "'></i></a>")
}

##

addSpace <- function(nb=1){
  paste(rep("&nbsp;", nb), collapse=" ")
}

##

readYaml <- function(rmd_file){
  ## Read current file
  doc <- readLines(rmd_file)
  id <- which(doc=="---")
  ##
  yml_cur <- NULL
  ## there must be at least on line betwenn the two --- lines
  if ((length(id))>=2) {
    if ((id[2L]-id[1L])>=2) {
      tmp <- (id[1L]+1):(id[2L]-1)
      yml_cur <- yaml::yaml.load(paste(doc[tmp], collapse="\n"))
    }
  }
  return(yml_cur)
}


##

source("Rscripts/addAuthorsLinks.R")
