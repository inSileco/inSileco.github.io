##
pars <- commandArgs(trailingOnly = TRUE)
rmd_file <- pars[1]
##
dir <- paste0("assets/", gsub(rmd_file, pat=".[Rr]md", rep=""))
if(!dir.exists(dir)) dir.create(dir)
##
file.copy(rmd_file, to=paste0(dir, "/", rmd_file), TRUE)
knitr::purl(rmd_file, output=paste0(dir, "/",
  gsub(rmd_file, pat=".[Rr]md", rep=".R")), documentation=1)
