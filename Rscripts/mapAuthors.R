source("Rscripts/init.R")
#
map_aut <- leaflet() %>%
  setView(lng = -74, lat = 46, zoom = 5) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addProviderTiles(providers$Stamen.Toner)
# add author's popups
aut <- yaml.load_file("data/authors_info.yml")
for (i in 1:length(aut)){
  txt <- paste(
    "<b>", aut[[i]]$given_name, "</b>",
    "<b>", aut[[i]]$family_name, "</b>",
    "<br/>",
    aut[[i]]$institution[[1]]$name,
    "<br/>",
    sep = " "
    )
  txt <- paste0(txt, addAuthorsLinks(aut[[i]]))
  map_aut <- addMarkers(
    map_aut,
    lng=aut[[i]]$institution[[1]]$lon,
    lat=aut[[i]]$institution[[1]]$lat,
    popup = txt
  )
}
