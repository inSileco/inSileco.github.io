source("Rscripts/init.R")
#
soft <- yaml::yaml.load_file("data/software.yml")
sz <- length(soft)
txt <- ""
##
vec_categ <- lapply(soft, . %>% magrittr::extract('category')) %>% unlist
vec_categu <- vec_categ %>% unique

for (i in 1:length(vec_categu)){
  txt %<>% paste0("## ", vec_categu[[i]], "\n<br/>\n\n")
  id <- which(vec_categ==vec_categu[[i]])
  for (j in 1:length(id)){
    txt %<>% paste0(
    "### **",
    soft[[id[j]]]$name,
    "**\n")
    if (!is.null(soft[[id[j]]]$github)) txt %<>% paste0(" ", addiconurl(paste0("https://github.com/", soft[[id[j]]]$github), "fa fa-github fa-2x"))
    txt %<>% paste0(paste0(rep("&nbsp;",6), collapse=""))
    chc <- c(soft[[id[j]]]$travis, soft[[id[j]]]$appveyor, soft[[id[j]]]$codecov)
    for (k in 1:length(chc)){
      if (!is.null(chc[k])) txt %<>% paste0(" ", chc[k])
    }
    ##
    txt %<>% paste0("\n\n")
  }
}
##
cat(txt)
