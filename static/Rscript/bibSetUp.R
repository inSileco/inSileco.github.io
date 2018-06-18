bibFile <- 'inSilecoRef.bib'
bibPath <- 'bib/'
while (file.exists(paste0(bibPath,bibFile)) == F) {
  bibPath <- paste0('../', bibPath)
}
listDOI <- paste0(bibPath, 'listDOI.csv')
bibFile <- paste0(bibPath, bibFile)
DOI <- read.csv(listDOI, stringsAsFactors = F)
inSilecoRef::newDOI(DOI$DOI, bib = bibFile)
