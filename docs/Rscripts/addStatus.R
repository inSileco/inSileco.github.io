source("Rscripts/init.R")

## add System requirements
## add R packages R github packages

addStatus <- function(rmd_file){

  yml_cur <- readYaml(rmd_file)
  if (is.null(yml_cur)) return(invisible(NULL))

  #### Format
  txt <- ""
  ## Statut
  if (!is.null(yml_cur$status) | !is.null(yml_cur$pgmlang)) {
    txt %<>% paste0("**Status**:", addSpace(2))
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
      badge, ".svg) ", plg, " <br/>"
      )
  }

  ## Keywords
  if (!is.null(yml_cur$keywords)){
    txt %<>% paste0("**Keywords**: ")
    for (i in 1:length(yml_cur$keywords)){
      txt %<>% paste0(
        "<a class='btn btn-primary btn-outline btn-xs' href='indexPosts.html#",
        tolower(gsub(yml_cur$keywords[[i]], pat=" ", rep="_")), "'>",
        yml_cur$keywords[[i]], "</a> ")
    }
  }
  ##

  cat(txt)
  invisible(txt)
}
