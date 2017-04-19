source("Rscripts/init.R")
#
tal <- yaml.load_file("data/software.yml")
sz <- length(tal)
txt <- ""

for (j in 1:length(tal)){
  txt %<>% paste0(
    "### ",
    tal[[j]]$name,
    "\n")
  if (!is.null(tal[[j]]$github)) txt %<>% paste0(" ", addiconurl(paste0("https://github.com/", tal[[j]]$github), "fa fa-github fa-2x"))
  txt %<>% paste0(paste0(rep("&nbsp;",6), collapse=""))
  chc <- c(tal[[j]]$travis, tal[[j]]$appveyor, tal[[j]]$codecov)
  for (k in 1:length(chc)){
    if (!is.null(chc[k])) txt %<>% paste0(" ", chc[k])
  }
  ##
  txt %<>% paste0("<br/><br/> \n\n")
}
cat(txt)
