source("Rscripts/init.R")
#
tal <- yaml::yaml.load_file("data/talks.yml")
sz <- length(tal)
vec_categ <- lapply(tal, . %>% magrittr::extract('categ')) %>% unlist
vec_categu <- vec_categ %>% unique
txt <- ""

for (i in 1:length(vec_categu)){
  txt %<>% paste0("##", vec_categu[[i]], "\n")
  id <- which(vec_categ==vec_categu[[i]])
  for (j in 1:length(id)){
    txt %<>% paste0(j,
        ". **", # to get the numbered list in markdown and start the bold font
        tal[[id[j]]]$name,
        "** ",
        "<span class='flag-icon flag-icon-",
        tal[[id[j]]]$lang,
        "'></span> &nbsp;",
        addiconurl(tal[[id[j]]]$link, "fa fa-link"),
        "&nbsp;",
        addiconurl(paste0("https://github.com/", tal[[id[j]]]$github), "fa fa-github"),
        "\n"
        )
  }
  txt %<>% paste0("\n\n")
}

cat(txt)
