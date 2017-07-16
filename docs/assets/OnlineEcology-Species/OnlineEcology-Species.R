## ----addStatus, echo=FALSE, results="asis", message=FALSE----------------
# if following the tutorial, do not run this block and/or feel free to delete the entire block
# this is only for 'website building purposes'
  source("Rscripts/addStatus.R")
  addStatus("OnlineEcology-Species.Rmd")
  knitr::opts_chunk$set(error = TRUE)

## ---- results = "hide", echo = FALSE, message = FALSE--------------------
rm(list=ls())
library(raster)
library(magrittr)
library(knitr)
library(kableExtra)

## ----infosession---------------------------------------------------------
sessionInfo()[[1]]$version.string

## ----parameters----------------------------------------------------------
# Species of interest
    sp <- 'Gadus morhua'

# Extent of area of interest
    latmax <- 52.01312
    latmin <- 45.52399
    lonmax <- -55.73636
    lonmin <- -71.06333

# Create a spatial bounding box for the area of interest using the 'sf' package:
# create a matrix:
    bb <- cbind(c(lonmin,lonmax,lonmax,lonmin,lonmin),
                   c(latmin,latmin,latmax,latmax,latmin)) %>%
        # put that matrix into a list, because that's what `st_polygon()` needs
        list() %>%
        # Make the matrix a 'simple features' polygon:
        sf::st_polygon() %>%
        # and let's make it a simple feature column and give it information about the projection:
        sf::st_sfc(crs="+proj=longlat +datum=WGS84") %>%
        # finally, let's put the sfc in a simple features data.frame in the variable `geometry`:
        sf::st_sf(name="Study Site",geometry=.)

## ---- ecology, eval = TRUE-----------------------------------------------
# Species ecology
ecol <- rfishbase::ecology(sp)
ecol <- cbind(colnames(ecol), t(ecol))
rownames(ecol) <- NULL
ecol <- ecol[ecol[,2] != 0, ] # remove 0
ecol <- ecol[!is.na(ecol[,2]), ] # remove NAs

knitr::kable(ecol, col.names = c('Descriptors', 'Attributes'), "html") %>%
    kable_styling(full_width = F)

## ---- taxonomy, eval = TRUE, message = FALSE-----------------------------
# Export the taxonomy of the species of interest
    knitr::kable(taxize::classification(sp, db = 'worms', verbose = FALSE)[[1]], "html") %>%
        kable_styling(full_width = F)

# We can also extract the common or scientific names using sci2comm() & comm2sci(), respectively.
    taxize::sci2comm(sp, db = 'itis')

# Or find out whether there are other names under which the species is known
    taxize::synonyms(sp, db = 'itis')

# Another really interesting feature is to extract all known species at a given taxonomic scale.
# Let's take the genus level and see the first 20 species that are part of that genus on the itis database
    knitr::kable(taxize::children(strsplit(sp, ' ')[[1]][1], db = 'itis')[[1]], "html") %>%
        kable_styling(full_width = F)

## ---- trophic, eval = TRUE-----------------------------------------------
# There are multiple types of interactions available on GloBI
    knitr::kable(rglobi::get_interaction_types()[,1:3], 'html') %>%
        kable_styling(full_width = F)

# For now let's focus on predator-prey interactions
    prey <- rglobi::get_prey_of(sp)$target_taxon_name # Retrieve prey
    pred <- rglobi::get_predators_of(sp)$target_taxon_name # Retrieve predators
    length(prey) # Number of prey
    length(pred) # Number of predators
    prey[1:20] # First 20 prey
    pred[1:20] # First 20 predators

## ---- OBIS data, eval=TRUE-----------------------------------------------
# Download occurrence data for species and area of interest between 2010 and 2017
    OBIS <- robis::occurrence(scientificname = sp, geometry=sf::st_as_text(bb$geometry), startdate = as.Date("2010-01-01"), enddate = as.Date("2017-01-01"), fields = c("species", "yearcollected","decimalLongitude", "decimalLatitude"))

# Remove duplicates
    OBIS <- unique(OBIS)

# Transform as spatial file
    OBIS <- sf::st_as_sf(OBIS,
                     coords = c("decimalLongitude", "decimalLatitude"),
                     crs="+proj=longlat +datum=WGS84",
                     remove=FALSE)

# Visualize with mapview
    mapview::mapview(OBIS, cex = 4)@map

## ---- sdmpredictors------------------------------------------------------
# List sdmpredictors datasets
    knitr::kable(sdmpredictors::list_datasets())

## ---- importEnvVarhidden, echo = FALSE, eval = TRUE----------------------
# if following the tutorial, do not run this block and/or feel free to delete the entire block
# this is only for saving/loading the data from our repository, the steps to download the data are in the next chunk
# Import marine layers
    layers <- c('BO_chlomean','BO_dissox','BO_ph','BO_salinity','BO_sstmean','BO_bathymean')
    ##
    envCov <- readRDS("assets/envCov.Rds")
    ##
    vec_fl <- paste0("./_tmp/", c(
        "BO_bathymean_lonlat.tif", "BO_chlomean_lonlat.tif",
        "BO_dissox_lonlat.tif",    "BO_ph_lonlat.tif",
        "BO_salinity_lonlat.tif",  "BO_sstmean_lonlat.tif"
        ))
    ##
    if (all(file.exists(c("_tmp/envCov.Rds", vec_fl)))) {
      envCov <- readRDS("./_tmp/envCov.Rds")
    } else  {
      envCov <- sdmpredictors::load_layers(layers, datadir = paste0( getwd(), "/_tmp"), rasterstack = TRUE)
      saveRDS(envCov, "./_tmp/envCov.Rds")
    }

## ---- importEnvVar, eval = FALSE-----------------------------------------
## # Import marine layers
##     layers <- c('BO_chlomean','BO_dissox','BO_ph','BO_salinity','BO_sstmean','BO_bathymean')
##     # layers <- 'BO_ph'
##     envCov <- sdmpredictors::load_layers(layers, datadir = paste0(getwd(), "/_tmp"), rasterstack = TRUE)

## ---- cropEnvCov, eval = TRUE--------------------------------------------
# Clip to study area extent
    envCov <- raster::crop(envCov, raster::extent(lonmin, lonmax, latmin, latmax))
    print(envCov)
    envCov %<>% raster::stack()

# Data description
    knitr::kable(sdmpredictors::get_layers_info(layers)$current[,1:4])

## ---- plotEnvVar, eval = TRUE, fig.width = 9.5, fig.height = 6-----------
# Plot 'em!
    raster::plot(envCov)

## ---- SDM data, eval = TRUE, results = 'hide'----------------------------
SDMdata <- biomod2::BIOMOD_FormatingData(resp.var = rep(1,nrow(OBIS)),
                                        expl.var = envCov,
                                        resp.xy = data.frame(OBIS$decimalLongitude, OBIS$decimalLatitude),
                                        resp.name = sp,
                                        PA.nb.rep = 1)

## ---- SDM model, eval = TRUE, results = 'hide', warning = FALSE----------
# Basic options for modelling
    SDMoption <- biomod2::BIOMOD_ModelingOptions()

# SDM model
    SDM <- biomod2::BIOMOD_Modeling(data = SDMdata,
                                    models = "MAXENT.Tsuruoka",
                                    model.options = SDMoption,
                                    SaveObj = FALSE)

## ---- modelEval----------------------------------------------------------
# Model evaluation
    knitr::kable(biomod2::get_evaluations(SDM))

## ---- sdmSpatial, results = 'hide', fig.width = 7, fig.height = 7--------
# Model spatial projection
    SDMproj <- biomod2::BIOMOD_Projection(modeling.output = SDM,
                                          new.env = envCov,
                                          proj.name = 'Awesome!',
                                          selected.models = 'all',
                                          binary.meth = 'TSS',
                                          compress = 'xz',
                                          clamping.mask = F,
                                          output.format = '.grd')
# ... and visualize them!
    biomod2::plot(SDMproj)

