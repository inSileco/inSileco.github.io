source("Rscripts/init.R")
#####
aut <- yaml::yaml.load_file("data/authors_info.yml")
names <- descri <- character(length(aut))
txt <- ""
#####
for (i in 1:length(aut)){
  txt %<>% paste0("<h4 class='big'> <b>",
    aut[[i]]$given_name,
    " ",
    aut[[i]]$family_name,
    "</b>",
    addSpace(3),
    addAuthorsLinks(aut[[i]], sz=1),
    "</h4>\n",
    aut[[i]]$description,
    "\n\n<b>Research project</b>: ",
    aut[[i]]$project,
    "<br/><br/><br/> \n\n")
}
txt %<>% htmltools::HTML()
cat(txt)
