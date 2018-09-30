---
title: R in Space - Useful resources
author: [marieh, nicolas, kevin, david, elliot, steve]
date: 2018-04-13
tags: [R in Space, R, Spatial, wiki]
draft: false
tweet: "R in Space - Useful resources"
navposts:
  prev: rinspace_homepage
  home: rinspace_homepage
  next: rinspace_spobjects
---


![](https://img.shields.io/badge/inSileco-UnderReview-ffdd55.svg)


## The mapping landscape has changed!

Over the last decade it has become increasingly easy to create and edit maps.
As explained by Mark Zastrow in [“Science on the Map"](http://www.nature.com/news/data-visualization-science-on-the-map-1.17024),
the mapping landscape has dramatically changed over the last decade.
Scientists can now readily draw valuable spatial representations
of their work, even with large data sets and perform powerful analyses
using specific packages of programming languages such as R and Python.
In order to give you a taste of the diversity of tool to manipulate,
analyze and visualize geographic information, we listed a few software
available:


### Geographic Information System (GIS)

- [Quantum GIS](http://qgis.org/en/site/);
- [ArcGIS](http://www.arcgis.com/features/);
- [DIVA-GIS](http://www.diva-gis.org);
- [GRASS GIS](http://grass.osgeo.org);
- [PostGIS](http://www.postgis.org);
- [SAGA GIS](http://www.saga-gis.org/en/index.html).

### Web mapping tools

- [CartoDB](http://cartodb.com);
- [GeoJson](http://geojson.io/#map=2/20.0/0.0);
- [Google Map](https://www.google.fr/maps);
- [Goole Earth](http://www.google.fr/intl/eng/earth/index.html);
- [OpenStreetmap](https://www.openstreetmap.org/);
- [Mapbox](https://www.mapbox.com/).



### Specific packages of various programming languages

#### C/C++ libraries:

- [proj4](http://proj4.org/);
- [gdal](http://www.gdal.org/index.html);
- [geos](https://trac.osgeo.org/geosc).

#### JavaScript:

- [Leaflet](http://leafletjs.com)
- [Turf](http://turfjs.org/)
- more information [here](https://codepen.io/stevepepple/post/javascript-geospatial-examples)

#### Julia packages

- [JuliaGeo](https://github.com/JuliaGeo).

#### Python packages

- [cartopy](http://scitools.org.uk/cartopy/);
- [geopy](https://github.com/geopy/geopy);
- more information [here](http://geopandas.org/).


And if you want to see MORE, look at the Awesome GIS [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sshuair/awesome-gis) and the Awesome Geospatial
[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sacridini/Awesome-Geospatial) :fire:!


### Free GIS data

If you are looking for free GIS data, you should definitively start by carefully
examine the resources listed on this page: https://freegisdata.rtwilson.com/.
Note that in R the function `getData()` from the raster package is fantastic and
some R packages are great data provider, for instance, `osmdata` (see below).




## So... why use R for mapping?

Given the number of tools dedicated to visualization and analyses of spatial
data, it is important that users ask this question and take some time to balance
pros and cons of using R for mapping. According to us, the choice strongly
relies on:

1. your ambition in terms of mapping;
2. your skills in R.

If you aim at creating a good-looking map without analysis and you are not
familiar with R, it does not make sense to use R only for mapping. But if
you are familiar with R or plan on becoming familiar with it to perform and
replicate spatial analyses in R, you can quickly get a good-looking map (a R
plot basically) and then benefit from the plot system you already know. Also,
when you need tricky spatial analysis, even if you are not familiar with R,
you will doubtlessly may benefit from learning it.

Using R to create your maps and perform spatial analyses also means
that you will write your data pipeline in a specific language and thus create
scripts. Such scripts are easy to share and key element to make your analyses
transparent and reproducible. Last but not least, the vast and active R
community, which explains the incredible richness of packages, the abundance
of documentation and tutorials available on line as well as the massive stack
of answered questions on question and answer sites such as
[StackOverflow](https://stackoverflow.com/questions/tagged/r).
To give you something more tangible regarding the abundance of R packages,
we propose below a curated list of R packages you will doubtlessly find very helpful:

{{< rsppkgs >}}

For a more detailed list of packages, have a look at the
[CRAN task view "Spatial"](https://cran.r-project.org/web/views/Spatial.html).
Note that there is a quick way to install all packages listed in the task view
through the [package](https://cran.r-project.org/web/packages/ctv):

```r
install.packages("ctv")
ctv::install.views("Spatial")
```

Also, according to us, a good set of tutorials/documentation to start with
spatial data in R is:

- [r-spatial.org](http://r-spatial.org/);
- [rspatial.org](http://www.rspatial.org/);
- [A DataCamp tutorial](https://www.datacamp.com/courses/spatial-analysis-in-r-with-sf-and-raster);
- [Geocomputation with R](https://geocompr.robinlovelace.net/intro.html);
- [Analyses spatiale sous R](https://qcbs.ca/wiki/_media/gisonr.pdf) (fr).
- [Another tutorial by Claudia Engel](https://cengel.github.io/rspatial)
