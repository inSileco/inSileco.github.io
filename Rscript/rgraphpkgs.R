source("Rscript/init.R")
#
tal <- yaml.load_file("data/software.yml")
sz <- length(tal)
# vec_categ <- lapply(tal, . %>% extract('categ')) %>% unlist
# vec_categu <- vec_categ %>% unique
txt <- ""

# for (i in 1:length(vec_categu)){
#   txt %<>% paste0("##", vec_categu[[i]], "\n")
#   id <- which(vec_categ==vec_categu[[i]])
for (j in 1:length(tal)){
  txt %<>% paste0(j,
    ". **", # to get the numbered list in markdown and start the bold font
    tal[[j]]$name,
    "** ")
  if (!is.null(tal[[j]]$github)) txt %<>% paste0(" ", addiconurl(paste0("https://github.com/", tal[[j]]$github), "fa fa-github"))
  ##
  chc <- c(tal[[j]]$travis, tal[[j]]$appveyor, tal[[j]]$codecov)
  for (k in length(chc)){
    if (!is.null(chc[k])) txt %<>% paste0(" ", chc[k])
  }
  ##
  txt %<>% paste0("\n")
}
#   txt %<>% paste0("<br/><br/> \n\n")
# }
cat(txt)
