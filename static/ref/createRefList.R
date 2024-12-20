# Ref from doi
dois <- read.csv("dois.csv")
inSilecoRef::add_doi_reference(dois$DOI, "inSileco_doi.bib")

# Package references
pkgs <- c("terra", "igraph")
citationk <- function(x) {
    # gt a weird behavior when there are 2+ citation for one package
    out <- citation(x)[[1]]
    out$key <- paste0(x, "_", out$year)
    return(out)
}
ref_pkg <- do.call(c, lapply(pkgs, citationk))

# Combining refs
unlink("inSileco.bib")
bibtex::write.bib(
    c(
        bibtex::read.bib("inSileco_doi.bib"),
        bibtex::read.bib("inSileco_nodoi.bib"),
        ref_pkg
    ),
    file = "inSileco.bib"
)
