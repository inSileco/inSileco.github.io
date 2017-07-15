addAuthorsLinks <- function(author, sz = 2){
  txt <- ""
  if (!is.null(author$website)) {
    txt %<>% paste0(
      addiconurl(
        author$website,
        paste0("fa fa-globe fa-",  sz, "x")
        ),
      "&nbsp;"
      )
  }
  if (!is.null(author$github)) {
    txt %<>% paste0(
      addiconurl(
        paste0("https://github.com/", author$github),
        paste0("fa fa-github fa-", sz, "x")
        ),
      "&nbsp;")
  }
  if (!is.null(author$twitter)) {
    txt %<>% paste0(
      addiconurl(
        paste0("http://twitter.com/", author$twitter),
        paste0("fa fa-twitter fa-", sz, "x")
        ),
      "&nbsp;")
  }
  if (!is.null(author$orcid)) {
    txt %<>% paste0(
      addiconurl(
        paste0("http://orcid.org/", author$orcid),
        paste0("ai ai-orcid-square ai-", sz, "x")
        ),
      "&nbsp;")

  }
  if (!is.null(author$researchgate)) {
    txt %<>% paste0(
      addiconurl(
        paste0("https://www.researchgate.net/profile/", author$researchgate),
        paste0("ai ai-researchgate ai-", sz, "x")
        ),
      "&nbsp;")
  }
  if (!is.null(author$gscholar)) {
    txt %<>% paste0(
      addiconurl(
        author$gscholar,
        paste0("ai ai-google-scholar-square ai-", sz, "x")
        ),
      "&nbsp;")
  }
  return(txt)
}
