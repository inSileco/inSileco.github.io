source("Rscripts/init.R")

## add System requirements
## add R packages R github packages

addStatus <- function(rmd_file) {

  yml_cur <- readYaml(rmd_file)
  if (is.null(yml_cur)) return(invisible(NULL))

  #### Format
  txt <- ""
  ##----- Statut
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
      badge, ".svg) ", plg, "\n"
      )
  }

  txt %<>% paste0("<br/>")

  ##----- Downloads
  dir <- paste0("assets/", gsub(rmd_file, pat=".[Rr]md", rep=""))
  if(!dir.exists(dir)) dir.create(dir)
  ##
  file.copy(rmd_file, to=paste0(dir, "/", rmd_file), TRUE)
  # knitr::purl(rmd_file, output=paste0(dir, "/", gsub(rmd_file, pat=".[Rr]md", rep=".R")), documentation=1)
  ##
  txt %<>% paste0("<i class='fa fa-download' aria-hidden='true'></i>", addSpace(2))
  txt %<>% paste0("<i class='fa fa-code' aria-hidden='true'></i>", addSpace(1))
  txt %<>% paste0(addurl(paste0(dir, "/", rmd_file), "Rmd file \n"), addSpace(2))
  txt %<>% paste0("<i class='fa fa-code' aria-hidden='true'></i>", addSpace(1))
  txt %<>% paste0(addurl(paste0(dir, "/", gsub(rmd_file, pat=".[Rr]md", rep=".R")), "R only \n"), addSpace(2))

  if (!is.null(yml_cur$download)){
    for (i in 1:length(yml_cur$download)){
      tmp <- yml_cur$download[[i]]
      if (!is.null(tmp$href)){
        alt <- "unknown"
        if (!is.null(tmp$icon)) icn <- paste0("<i class='", tmp$icon, "'></i>", addSpace(1))
        if (!is.null(tmp$text)) alt <- tmp$text
        txt %<>% paste0(icn, addurl(tmp$href, alt), addSpace(2))
      }
    }
  }

  txt %<>% paste0("<br/>")

  ##----- Keywords
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

  ##----- Tweet
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
