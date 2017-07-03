source("Rscripts/init.R")


slcLang <- function(rmd_file){

  yml_cur <- readYaml(rmd_file)
  nlg <- length(yml_cur$slclang)
  if (is.null(yml_cur) | !nlg) return(invisible(NULL))

  lgs <- unlist(yml_cur$slclang)
  txt <- "<div class='flag'>\n"

  for (i in 1:nlg) {
    txt %<>% paste0(
      "<a alt='lang-", lgs[i], "' id='lang-", lgs[i], "'>",
      "<i style='font-size:1.6em' class='flag-icon flag-icon-",
      lgs[i],
      "'></i></a> &nbsp;\n")
  }

  txt %<>% paste0("</div>\n")


  # Build jQuery script to show/hide elements
  # inspired by https://github.com/ahasverus/ahasverus.github.io/blob/master/layout/js/language-selector.js
  # first lang in the list is the default one

  sllg <- ""

  for (i in 1:nlg) {
    sllg %<>% paste0(
      "$(\"#lang-", lgs[i], "\").click(function() {\n",
      "$('[lang=\"", lgs[i], "\"]').show();\n",
      paste(
        paste0("$('[lang=\"", lgs[-i], "\"]').hide();"),
        collapse = ""
        ),
        "});\n"
      )
  }

  jqs <- paste0(
    "<script>\n",
    "$(document).ready(function() {\n",
    paste(paste0("$('[lang=\"", lgs[-1L], "\"]').hide();\n"), collapse=""),
    sllg,
    "});\n</script>"
    )


  txt %<>% paste0(jqs)

  cat(txt)
  invisible(txt)
}


# // jQuery script to show/hide elements depending on a click event


# $(document).ready(function() {
#
#   // Default language FR
#   $('[lang="en"]').hide();
#   $('[lang="es"]').hide();
#
#   // SELECTION OF FR
#   $("#lang-fr").click(function() {
#     $('[lang="fr"]').show(); $('[lang="en"]').hide(); $('[lang="es"]').hide();
#   });
#
#   // SELECTION OF EN
#   $("#lang-en").click(function() {
#     $('[lang="fr"]').hide(); $('[lang="en"]').show(); $('[lang="es"]').hide();
#   });
#
#   // SELECTION OF ES
#   $("#lang-es").click(function() {
#     $('[lang="fr"]').hide(); $('[lang="en"]').hide(); $('[lang="es"]').show();
#   });
# });


#
# <div class="flag">
#   <a alt="french" title="french" id="lang-fr">
#     <i class="flag-icon flag-icon-fr"></i>
#   </a>
#   <a alt="english" title="english" id="lang-en">
#     <i class="flag-icon flag-icon-en"></i>
#   </a>
# </div>
