# REMEMBER to restart R after you modify and save this file!

# First, execute the global .Rprofile if it exists. You may configure blogdown
# options there, too, so they apply to any blogdown projects.
if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}
# Now set options to customize the behavior of blogdown for this project. Below
# are a few sample options; for more options, see
# https://bookdown.org/yihui/blogdown/global-options.html
options(
  # to automatically serve the site on RStudio startup, set this option to TRUE
  blogdown.serve_site.startup = FALSE,
  # to disable knitting Rmd files on save, set this option to FALSE
  blogdown.knit.on_save = TRUE,
  # build .Rmd to .html (via Pandoc); to build to Markdown, set this option to 'markdown'
  blogdown.method = "html",
  width = 100
  # fix Hugo version
  # blogdown.hugo.version = "0.96.0"
)

# If is used to avoid problems with GHA worklow when knitr is missing
if ("knitr" %in% unlist(lapply(.libPaths(), list.files))) {
  knitr::opts_chunk$set(
    comment = "#R> ",
    collapse = TRUE,
    warning = FALSE,
    message = FALSE,
    # fig.width = 7.5,
    # fig.height = 6,
    fig.align = "center",
    width = 100
  )
  if (requireNamespace("inSilecoRef", quietly = TRUE)) {
    library(inSilecoRef)
  }
  rfa <- function(...) {
    icons::icon_style(icons::fontawesome(...), fill = "currentColor")
  }
  ar <- function() rfa("arrow-right")
  gh <- function() rfa("github")
  rp <- function() rfa("r-project")
  wk <- function() rfa("wikipedia-w")
  lk <- function() rfa("link")

  # hyperlinks
  href <- function(href, desc = href) {
    paste0("[", desc, "]", "(", href, ")")
  }
  # using shortcode
  ref <- function(ref, desc = lk(), alt = "") {
    htmltools::HTML(
      paste0('[', desc, ']({{< ref "', ref, '" >}} "', alt, '")')
    )
  }
  path_root <- getwd()
  path_session_info <- file.path(path_root, "static/Rscript/sessionInfo.Rmd")
  path_ref_bib <- file.path(path_root, "static/ref/inSileco.bib")
  path_ref_csl <- file.path(path_root, "static/ref/peerj.csl")
}
