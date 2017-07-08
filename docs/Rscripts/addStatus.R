source("Rscripts/init.R")

## add System requirements
## add R packages R github packages

addStatus <- function(rmd_file) {

  yml_cur <- readYaml(rmd_file)
  if (is.null(yml_cur)) return(invisible(NULL))

  #### Format
  txt <- ""
  ## Statut
  if (!is.null(yml_cur$status) | !is.null(yml_cur$pgmlang)) {
    txt %<>% paste0("<i class='fa fa-cogs' aria-hidden='true'></i>", addSpace(2))
    ##
    sta <- c("inDevelopment", "inRevision", "finalVersion")
    idb <- which(sta == yml_cur$status)
    if (length(idb)) {
      badge <- paste0(sta, c("-yellow", "-blue", "-800fa2"))[idb]
    } else badge <- "unknown-red"
    ##
    plg <- ""
    if (!is.null(yml_cur$pgmlang)) {
      plg <- paste0("![](https://img.shields.io/badge/pgmLang-",
        yml_cur$pgmlang, "-blue.svg)")
    }
    ##
    txt %<>% paste0(
      "![](https://img.shields.io/badge/letiR-",
      badge, ".svg) ", plg, " <br/> \n"
      )
  }

  ## Keywords
  if (!is.null(yml_cur$keywords)) {
    txt %<>% paste0("<i class='fa fa-tags' aria-hidden='true'></i>", addSpace(2))
    for (i in 1:length(yml_cur$keywords)){
      txt %<>% paste0(
        " <a class='btn btn-primary btn-outline btn-xs' href='indexPosts.html#",
        tolower(gsub(yml_cur$keywords[[i]], pat=" ", rep="_")), "'>",
        yml_cur$keywords[[i]], "</a>")
    }
  }
  ##

  txt %<>% paste0("<br/><br/>")

  ## Tweet
  if (!is.null(yml_cur$tweet)) {
    twt <- URLencode(yml_cur$tweet)
    url <- URLencode(paste0("https://letir.github.io/docs/", gsub(rmd_file, pat = ".Rmd", rep = ".html")))
    txt %<>% paste0("<a class='twitter-share-button' ",
      "href='https://twitter.com/intent/tweet?text=", twt,
      "&url=", url, "'>Tweet</a> \n")
  }


  cat(txt)
  invisible(txt)
}
