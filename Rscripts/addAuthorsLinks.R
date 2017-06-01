addAuthorsLinks <-function(author){
  txt <- ""
  if (!is.null(author$website)) {
    txt %<>% paste0(addiconurl(author$website, "fa fa-globe fa-2x"), "&nbsp;")
  }
  if (!is.null(author$github)) {
    txt %<>% paste0(addiconurl(paste0("https://github.com/", author$github), "fa fa-github fa-2x"), "&nbsp;")
  }
  if (!is.null(author$twitter)) {
    txt %<>% paste0(
      addiconurl(paste0("http://twitter.com/", author$twitter),
      "fa fa-twitter fa-2x"), "&nbsp;")
  }
  if (!is.null(author$orcid)) {
    txt %<>% paste0(
      addiconurl(paste0("http://orcid.org/", author$orcid),
      "ai ai-orcid-square ai-2x"), "&nbsp;")

  }
  if (!is.null(author$researchgate)) {
    txt %<>% paste0(
      addiconurl(paste0("https://www.researchgate.net/profile/", author$researchgate),
      "ai ai-researchgate ai-2x"), "&nbsp;")
  }
  if (!is.null(author$gscholar)) {
    txt %<>% paste0(
      addiconurl(author$gscholar,
      "ai ai-google-scholar-square ai-2x"), "&nbsp;")
  }
  return(txt)
}
