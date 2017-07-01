source("Rscripts/init.R")
#
#
map_aut <- leaflet() %>%
  setView(lng = -74, lat = 46, zoom = 5) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addProviderTiles(providers$Stamen.Toner)
# load the yaml files
aut <- yaml::yaml.load_file("data/authors_info.yml")
uni <- yaml::yaml.load_file("data/univ.yml")
# Univ ID's by authors
aut_uni <- lapply(aut, function (x) x$institution) %>%
  lapply(function (x) lapply(x, function(y) unlist(y$id))) %>%
  lapply(unlist)
##

for (i in 1:length(uni)) {
  ida <- lapply(aut_uni, function(x) uni[[i]]$id %in% x) %>% unlist %>% which
  nba <- length(ida)
  if (nba){
    txt <- paste0("<h4>", uni[[i]]$name, "</h4>")
    for (j in 1:nba) {
      txt %<>% paste0("<b>", aut[[ida[j]]]$given_name, " ",
        aut[[ida[j]]]$family_name, "</b>   ", aut[[ida[j]]]$institution$office, "<br/>")
      txt %<>% paste0(addAuthorsLinks(aut[[ida[j]]]), "<br>")
    }
  }
  txt %<>% HTML
  map_aut <- addMarkers(
    map_aut,
    lng=uni[[i]]$lon,
    lat=uni[[i]]$lat,
    popup = txt
  )
}
