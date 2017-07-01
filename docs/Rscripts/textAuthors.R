source("Rscripts/init.R")
#####
aut <- yaml::yaml.load_file("data/authors_info.yml")
names <- descri <- character(length(aut))
txt <- ""
#####
for (i in 1:length(aut)){
  txt %<>% paste0("#### ",
    aut[[i]]$given_name,
    " ",
    aut[[i]]$family_name,
    "\n\n",
    aut[[i]]$description,
    "\n\n",
    addAuthorsLinks(aut[[i]]),
    "\n\n<b>Research project</b>: ",
    aut[[i]]$project,
    "<br/><br/> \n\n")
}
cat(txt)
