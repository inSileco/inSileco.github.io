source("Rscripts/init.R")
#
map <- yaml.load_file("data/maps.yml")
sz <- length(map)
vec_categ <- lapply(map, . %>% extract('category')) %>% unlist
vec_categu <- vec_categ %>% unique
txt <- ""

for (i in 1:length(vec_categu)){
  txt %<>% paste0("##", vec_categu[[i]], "\n")
  id <- which(vec_categ==vec_categu[[i]])
  for (j in 1:length(id)){
    txt %<>% paste0(j,
        ". **", # to get the numbered list in markdown and start the bold font
        map[[id[j]]]$name,
        "** ",
        map[[id[j]]]$description,
        "&nbsp;&nbsp;&nbsp;<span class='flag-icon flag-icon-",
        map[[id[j]]]$lang,
        "'></span> &nbsp;")
    if (!is.null(map[[id[j]]]$github)) txt %<>% paste0(addiconurl(map[[id[j]]]$link, "fa fa-github"), "&nbsp;")
    if (!is.null(map[[id[j]]]$link)) txt %<>% paste0(addiconurl(map[[id[j]]]$link, "fa fa-link"), "&nbsp;")
    if (!is.null(map[[id[j]]]$post)) txt %<>% paste0(addiconurl(map[[id[j]]]$post, "fa fa-globe"), "&nbsp;")
    txt %<>% paste0("\n")
  }
  txt %<>% paste0("<br/><br/> \n\n")
}

cat(txt)
