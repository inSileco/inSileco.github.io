source("Rscripts/init.R")
# setwd("~/Codes/Github/sites/letiR_website")

lsyh <- lapply(list.files(path = "_posts", full.names=TRUE), readYaml)
lskw <- lapply(lsyh, function(x) tolower(x$keywords))
lstt <- lapply(lsyh, function(x) x$title)
lsdt <- lapply(lsyh, function(x) x$date)
lsnm <- list.files(path = "_posts") %>% as.list %>% gsub(pat=".Rmd", rep=".html")

veckw <- unlist(lskw) %>% unique %>% sort
nkw <- length(veckw)

# We may want to add more than one upper letter
firstUpper <- function(str) {
  tmp <- strsplit(str, "")[[1L]]
  tmp[1L] %<>% toupper
  id <- which(tmp %in% c(" ", ".", "-", "_"))
  if (length(id)) {
    for (i in 1:length(id)) {
      if (id[i]<length(tmp)) tmp[id[i]+1] %<>% toupper
    }
  }
  return(paste(tmp, collapse=""))
}



txt <- ""
for (i in 1:nkw) {
  txt %<>% paste0("## ", firstUpper(veckw[i]), " <a name='",
  gsub(veckw[i], pat=" ", rep="_"), "'></a>", "\n\n")
  k <- 0
  for (j in 1:length(lskw)){
    if (veckw[i]%in%lskw[[j]]){
      k <- k+1
      tit <- gsub(lstt[[j]], pat=".html", rep="")
      txt %<>% paste0(k, ". [", tit, "](", lsnm[j], ") *",
      lsdt[[j]], "*", "\n")
    }

  }
  txt %<>% paste0("\n\n")
}

txt %<>% paste0("<br/><br/>")

cat(txt)
