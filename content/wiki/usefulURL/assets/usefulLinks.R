library(magrittr)


addurl <- function(url, txt){
  paste0("<a href='", url, "'>", txt,"</a>")
}

addiconurl <- function(url, icon){
  paste0("<a href='", url, "'><i class='", icon, "'></i></a>")
}


txt <- ""


lsyf <- list.files("assets", pattern="*.yaml", full.names=TRUE)

for (i in 1:length(lsyf)) {
  tmp <- yaml::yaml.load_file(lsyf[i])
  txt %<>% paste0("### ", tmp[[1L]]$category, "\n\n")
  for (j in 1:length(tmp)) {
    txt %<>% paste0(j, ". **[", tmp[[j]]$name, "](", tmp[[j]]$link, ")**: ", tmp[[j]]$text,
      " *", tmp[[j]]$lang, "*. \n")
  }
  txt %<>% paste0("\n\n")
}

cat(txt)
