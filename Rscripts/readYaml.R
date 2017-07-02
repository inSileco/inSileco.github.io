source("Rscripts/init.R")

##

readYAML <- function(rmd_file){
  ## Read current file
  doc <- readLines(rmd_file)
  id <- which(doc=="---")
  ##
  ##
  if ((length(id))>=2) {
    if ((id[2L]-id[1L])>=2) {
      tmp <- (id[1L]+1):(id[2L]-1)
      yml_cur <- yaml::yaml.load(paste(doc[tmp], collapse="\n"))
    } else return(invisible(NULL))
  } else return(invisible(NULL))

  #### Format
  txt <- ""
  ## Statut
  if (!is.null(yml_cur$status) | !is.null(yml_cur$pgmlang)) {
    txt %<>% paste0("Status:", addSpace(2))
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
  ## Keyword
  if (!is.null(yml_cur$keywords)){
    length(yml_cur$keywords)
  }
  ##
  cat(txt)
  invisible(txt)
}
