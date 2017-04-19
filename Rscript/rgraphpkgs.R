source("Rscript/init.R")
#
pkg <- yaml.load_file("data/Rpkgs.yml")
sz <- length(pkg)
txt <- ""
##
vec_categ <- lapply(pkg, . %>% extract('category')) %>% unlist
vec_categu <- vec_categ %>% unique
txt <- ""

for (i in 1:length(vec_categu)){
  txt %<>% paste0("### ", vec_categu[[i]], "\n")
  id <- which(vec_categ==vec_categu[[i]])
  for (j in 1:length(id)){
    txt %<>% paste0(j,
        ". **", # to get the numbered list in markdown and start the bold font
        pkg[[id[j]]]$namepkg,
        "** ",
        pkg[[id[j]]]$text,
        " [CRAN](https://cran.r-project.org/web/packages/",
        pkg[[id[j]]]$namepkg,
         ")")
    if (!is.null(pkg[[id[j]]]$github)) txt %<>% paste0(" ", addiconurl(paste0("https://github.com/", pkg[[id[j]]]$github), "fa fa-github"))
    if (!is.null(pkg[[id[j]]]$bitbucket)) txt %<>% paste0(" ", addiconurl(paste0("https://bitbucket.org/", pkg[[id[j]]]$bitbucket), "fa fa-bitbucket"))
    if (!is.null(pkg[[id[j]]]$website)) txt %<>% paste0(" ", addiconurl(pkg[[id[j]]]$website, "fa fa-link"))
    if (!is.null(pkg[[id[j]]]$doi)) txt %<>% paste0(" ", addiconurl(paste0("https://doi.org/", pkg[[id[j]]]$doi), "ai ai-doi"))
    if (!is.null(pkg[[id[j]]]$pdf)) txt %<>% paste0(" ", addiconurl(pkg[[id[j]]]$pdf, "fa fa-file-pdf-o"))
    txt %<>% paste0("\n")
  }
  txt %<>% paste0("<br/><br/> \n\n")
}
cat(txt)
#
#
#
# for (j in 1:length(tal)){
#   txt %<>% paste0(
#     "### ",
#     pkg[[j]]$name,
#     "\n")
#   if (!is.null(pkg[[j]]$github)) txt %<>% paste0(" ", addiconurl(paste0("https://github.com/", pkg[[j]]$github), "fa fa-github fa-2x"))
#   txt %<>% paste0(paste0(rep("&nbsp;",6), collapse=""))
#   chc <- c(pkg[[j]]$travis, pkg[[j]]$appveyor, pkg[[j]]$codecov)
#   for (k in 1:length(chc)){
#     if (!is.null(chc[k])) txt %<>% paste0(" ", chc[k])
#   }
#   ##
#   txt %<>% paste0("<br/><br/> \n\n")
# }
