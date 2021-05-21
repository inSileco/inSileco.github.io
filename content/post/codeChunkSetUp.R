knitr::opts_chunk$set(
  comment = "#R>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  #fig.width = 7.5,
  #fig.height = 6,
  fig.align = 'center',
  width = 100
)
library(inSilecoRef)


rfa <- function(...) icons::icon_style(icons::fontawesome(...), fill = "currentColor")
gh <- function() rfa("github")
rp <- function() rfa("r-project")
wk <- function() rfa("wikipedia-w")