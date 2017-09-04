# On pourrait faire utiliser un curl à la place sur le gist, du genre
# curl -L https://gist.githubusercontent.com/KevCaz/aaa83151e9d12cc07fbe379e2c32a385/raw/35a76e7cc192ba5fbc5a761025da87705893a215/letiRWSPkgs.R > pkgsList.R
## CRAN packages
install.packages(
  c(
    "animation",
    # "biomod2",
    # "devtools",
    # "kableExtra",
    # "leaflet",
    "plyr",
    "rmarkdown",
    "sdmpredictors",
    "sf",
    # "tm",
    "showtext",
    "yaml"
  ),
  repos = "https://cran.wu.ac.at/",
  dependencies = TRUE
)


## Github packages
devtools::install_github("iobis/robis")
devtools::install_github("KevCaz/graphicsutils")
