---
title: Efficiency of spatial intersects in R
author: [david, remi]
reviewer: [kevin]
date: 2017-09-12
tags: [R, spatial, intersection]
rpkgs: [sf, sp, rgeos]
estime: 10
archived: 2022-04-23
tweet: R spatial intersects efficiency
output:
  rmarkdown::html_page:
    toc: true
    toc_float:
      collapsed: false
    fig_width: 3
    dev: svg
---

<script src="/rmarkdown-libs/kePrint/kePrint.js"></script>
<link href="/rmarkdown-libs/lightable/lightable.css" rel="stylesheet" />
<script src="/rmarkdown-libs/kePrint/kePrint.js"></script>
<link href="/rmarkdown-libs/lightable/lightable.css" rel="stylesheet" />
<script src="/rmarkdown-libs/kePrint/kePrint.js"></script>
<link href="/rmarkdown-libs/lightable/lightable.css" rel="stylesheet" />



## Intersects & R

We are increasingly performing spatial analyses in R. The replicability and the
efficiency of programming languages is much more appealing than using pieces of
user friendly software like [ArcGIS](https://www.arcgis.com/features/index.html),
even though you can still code your way through analyses when using them
(latter versions of [QGIS](http://qgis.org/fr/site/) do a fantastic
job in that regard!). The performance of tools available for spatial analyses in
R is however not completely certain.

In this post, we compare four different methods to perform spatial intersects
between objects in R, from three different packages:

1. `raster::intersect`
2. `rgeos::gIntersects`
3. `rgeos::gIntersection`
4. `sf::st_intersects`
5. `sf::st_intersection`

More specifically, we test how these methods fare when performing binary
(TRUE/FALSE) and zonal or aerial intersects. Keep in mind, not all methods
can be used for both binary and zonal intersects:

<br/>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Function </th>
   <th style="text-align:left;"> Binary </th>
   <th style="text-align:left;"> Zonal </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> raster::intersect </td>
   <td style="text-align:left;"> X </td>
   <td style="text-align:left;"> X </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rgeos::gIntersects </td>
   <td style="text-align:left;"> X </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rgeos::gIntersection </td>
   <td style="text-align:left;"> X </td>
   <td style="text-align:left;"> X </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sf::st_intersects </td>
   <td style="text-align:left;"> X </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> sf::st_intersection </td>
   <td style="text-align:left;"> X </td>
   <td style="text-align:left;"> X </td>
  </tr>
</tbody>
</table>

<br/>

Obviously, if you mean to perform binary intersects only, the binary functions
make more sense as they are built to include less calculations. We nonetheless
compare all the functions together for the sake of comparison in this post.

<br/>

## Initiate R



```r
# R version
sessionInfo()[[1L]]$version.string
#R> [1] "R version 4.2.0 (2022-04-22)"
#--
rm(list=ls())
library(sf)
library(rgdal)
library(sp)
library(raster)
library(rgeos)
library(magrittr)
library(knitr)
library(kableExtra)
##--
opts_chunk$set(fig.align='center')
##--
# Empty plot function
eplot <- function(x = 1, y = 1, xmin = 0, xmax = 1, ymin = 0, ymax = 1) {
  plot(x = x,y = y,bty = "n",ann = FALSE,xaxt = "n",yaxt = "n",type = "n",bg = 'grey',ylim = c(ymin,ymax),xlim = c(xmin,xmax))
}
```

Version of packages that have been used to build this post and are herein discussed:


```r
packageVersion("raster")
packageVersion("rgeos")
packageVersion("sf")
#R> [1] '3.5.15'
#R> [1] '0.5.9'
#R> [1] '1.0.7'
```






<br/>

## Generate spatial objects for testing

We start be generating random spatial object in space. For the record,
the area selected is within the St. Lawrence estuary in eastern Canada
(see [online ecology series](https://insileco.github.io/2017/06/19/online-ecology---individual-species-description/)),
although the actual location really does not matter for this post!


<br/>

## Grid

We use a regular grid to intersect vectorized data, *i.e.* points and polygons
for this post. This simulate the use of a grid used to extract environmental
data (biotic and/or abiotic) from multiple sources to characterize a study area.

<br/>


```r
# Projection in lambers
projSpat <- "+proj=lcc +lat_1=46 +lat_2=60 +lat_0=44 +lon_0=-68.5 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0"

# Bounding box
latmax <- 625000
latmin <- 585000
lonmax <- 150000
lonmin <- 100000

# Create a spatial bounding box for the area of interest using the 'sp' package:
bb <- cbind(c(lonmin,lonmax,lonmax,lonmin,lonmin),
                   c(latmin,latmin,latmax,latmax,latmin)) %>%
      Polygon() %>% list() %>%
      Polygons(ID = 'ID1') %>% list() %>%
      SpatialPolygons(proj4string = CRS(projSpat))


# Create spatial grid that will be used for intersects
A <- 5*1000000 # Surface of cells in m^2 (area in km^2 * 1000000)
cellsize <- sqrt(2*A)/3^(1/4) # value of the small diagonal
grid <- sp::spsample(bb,type="hexagonal",cellsize=cellsize, offset=c(0,0)) %>% # Points for a hexagonal grid
        sp::HexPoints2SpatialPolygons() # creating polygons

# We now have a grid of polygons to work with!
plot(grid)
lines(bb, col = 'blue', lwd = 2)
```

<img src="/post/2017/Rintersects/RIntersects_files/figure-html/grid-1.png" width="672" style="display: block; margin: auto;" />

```r

# We need this grid in `sp` and `sf` usable formats
gridSP <- grid
gridSF <- sf::st_as_sf(grid)
class(gridSP)
#R> [1] "SpatialPolygons"
#R> attr(,"package")
#R> [1] "sp"
class(gridSF)
#R> [1] "sf"         "data.frame"
```


<br/>

## Points and Polygons

Now we generate random points within the bounding box to test the intersects.
This is done for `1, 10, 50, 100, 250, 500, 1000, 10000` points. Then, to get
all data required to perform the tests, we also need to create polygons from
the point data.

<br/>


```r
# Number of samples
samp <- c(1, 10, 50, 100, 250, 500, 1000, 10000)
nSamp <- length(samp)

# Names of points samples
sampNames <- paste0('Pt',samp)
sampNames
#R> [1] "Pt1"     "Pt10"    "Pt50"    "Pt100"   "Pt250"   "Pt500"   "Pt1000"
#R> [8] "Pt10000"

# Random points for all samples
for(i in 1:nSamp) {
    assign(x = sampNames[i],
           value = data.frame(lon = runif(n = samp[i], min = lonmin, max = lonmax),
                              lat = runif(n = samp[i], min = latmin, max = latmax)))
}

# We now have nSamp new objects with randomly generated coordinates
ls()
#R>  [1] "A"         "bb"        "cellsize"  "eplot"     "grid"      "gridSF"   
#R>  [7] "gridSP"    "i"         "latmax"    "latmin"    "lonmax"    "lonmin"   
#R> [13] "nSamp"     "projSpat"  "Pt1"       "Pt10"      "Pt100"     "Pt1000"   
#R> [19] "Pt10000"   "Pt250"     "Pt50"      "Pt500"     "res1"      "res2"     
#R> [25] "samp"      "sampNames"

# Let's now create spatial objects with those coordinates for use with the `sp` package
sampNamesSP <- paste0(sampNames, 'SP')
for(i in 1:nSamp) {
    assign(
      x = sampNamesSP[i],
      value = SpatialPoints(coords = get(sampNames[i]), proj4string=CRS(projSpat))
    )
}

# Visualize them
par(mfrow = c(3,3))
for(i in 1:nSamp) {
    par(mar = c(0,0,0,0))
    plot(bb, lwd = 2)
    points(get(sampNamesSP[i]), cex = 0.75, col = 'transparent', bg = '#1e6b7955', pch = 21)
}
```

<img src="/post/2017/Rintersects/RIntersects_files/figure-html/randomData-1.png" width="672" style="display: block; margin: auto;" />



```r
# Now we generate polygons from the point data using the `rgeos::gBuffer`,
# see `sf::st_buffer` is the equivalent for the `sf` package
sampNamesPoly <- paste0('Poly',samp)
sampNamesSPPoly <- paste0(sampNamesPoly, 'SP')
for(i in 1:nSamp) {
    assign(x = sampNamesSPPoly[i],
           value = rgeos::gBuffer(get(sampNamesSP[i]), byid = T, width = 2000))
}

# Visualize them
par(mfrow = c(3,3))
for(i in 1:nSamp) {
    par(mar = c(0,0,0,0))
    plot(bb, lwd = 2)
    plot(get(sampNamesSPPoly[i]), border = 'transparent', col = '#1e6b7955', add = T)
}
```

<img src="/post/2017/Rintersects/RIntersects_files/figure-html/randomData2-1.png" width="672" style="display: block; margin: auto;" />



```r
# Transform points and polygons for use with the `sf` package
sampNamesSF <- paste0(sampNames, 'SF') # for points
sampNamesSFPoly <- paste0(sampNamesPoly, 'SF') # for polygons

for(i in 1:nSamp) {
    assign(x = sampNamesSF[i],
           sf::st_as_sf(get(sampNamesSP[i]))) # points
    assign(x = sampNamesSFPoly[i],
           sf::st_as_sf(get(sampNamesSPPoly[i]))) # polygons
}
```

<br/>

## Benchmarking

Now that the data is ready for use, we can perform the tests! But first, let's
take a quick look at the type of results that are returned by each function.

<br/>

### Points intersections

First, we will test the intersects only with the points.

<br/>


```r
res1 <- data.frame(n = samp,
                   raster_intersect = numeric(nSamp),
                   rgeos_gIntersects = numeric(nSamp),
                   rgeos_gIntersection = numeric(nSamp),
                   sf_st_intersects = numeric(nSamp),
                   sf_st_intersection = numeric(nSamp))

for(i in 1:nSamp) {
    res1$raster_intersect[i] <- system.time(raster::intersect(gridSP, get(sampNamesSP[i])))['elapsed']
    res1$rgeos_gIntersects[i] <- system.time(rgeos::gIntersects(gridSP, get(sampNamesSP[i]), byid = T))['elapsed']
    res1$rgeos_gIntersection[i] <- system.time(rgeos::gIntersection(gridSP, get(sampNamesSP[i]), byid = T))['elapsed']
    res1$sf_st_intersects[i] <- system.time(sf::st_intersects(gridSF, get(sampNamesSF[i])))['elapsed']
    res1$sf_st_intersection[i] <- system.time(sf::st_intersection(gridSF, get(sampNamesSF[i])))['elapsed']
}
```


```r
# Visualize results table
knitr::kable(res1, "html", digits = 2) %>% kable_styling(full_width = F)
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> n </th>
   <th style="text-align:right;"> raster_intersect </th>
   <th style="text-align:right;"> rgeos_gIntersects </th>
   <th style="text-align:right;"> rgeos_gIntersection </th>
   <th style="text-align:right;"> sf_st_intersects </th>
   <th style="text-align:right;"> sf_st_intersection </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.05 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.04 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.06 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.08 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.09 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 250 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.17 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 500 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.36 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1000 </td>
   <td style="text-align:right;"> 0.04 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.65 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10000 </td>
   <td style="text-align:right;"> 0.37 </td>
   <td style="text-align:right;"> 0.12 </td>
   <td style="text-align:right;"> 8.05 </td>
   <td style="text-align:right;"> 0.05 </td>
   <td style="text-align:right;"> 0.24 </td>
  </tr>
</tbody>
</table>

```r

# Visualize results
cols <- c("#3fb3b2", "#484f42", "#ffdd55", "#c7254e", "#1b95e0")
layout(matrix(c(1,2), ncol =2), widths = c(5,2), heights = 3)
par(mar = c(4,4,1,1), family = "serif", las=1)
#
plot(res1$raster_intersect ~ res1$n, type = 'l', lwd = 2, col = cols[1], ylim = c(0,max(res1[,2:6])), xlab = 'Number of points', ylab = 'Time (s)')
lines(res1$rgeos_gIntersects ~ res1$n, lwd = 2, col = cols[2])
lines(res1$rgeos_gIntersection ~ res1$n, lwd = 2, col = cols[3])
lines(res1$sf_st_intersects ~ res1$n, lwd = 2, col = cols[4])
lines(res1$sf_st_intersection ~ res1$n, lwd = 2, col = cols[5])
# Legend
par(mar = c(0,0,0,0), family = "serif", las = 1)
eplot()
legend(x = 'center', legend = as.character(colnames(res1)[-1]), bty = 'n', lty = 1, col = cols, seg.len = 2, cex = 0.8, title = expression(bold('Fonctions')))
```

<img src="/post/2017/Rintersects/RIntersects_files/figure-html/ptIntersect2-1.png" width="672" style="display: block; margin: auto;" />

```r

# Visualize results without gIntersection
layout(matrix(c(1,2), ncol =2), widths = c(5,2), heights = 3)
par(mar = c(4,4,1,1), family = "serif", las = 1)
#
plot(res1$raster_intersect ~ res1$n, type = 'l', lwd = 2, col = cols[1], ylim = c(0,max(res1[,c(2,3,5,6)])), xlab = 'Number of points', ylab = 'Time (s)')
lines(res1$rgeos_gIntersects ~ res1$n, lwd = 2, col = cols[2])
lines(res1$sf_st_intersects ~ res1$n, lwd = 2, col = cols[4])
lines(res1$sf_st_intersection ~ res1$n, lwd = 2, col = cols[5])
# Legend
par(mar = c(0,0,0,0), family = "serif")
eplot()
legend(x = 'center', legend = as.character(colnames(res1)[-c(1,4)]), bty = 'n', lty = 1, col = cols[-3], seg.len = 2, cex = 0.8, title = expression(bold('Fonctions')))
```

<img src="/post/2017/Rintersects/RIntersects_files/figure-html/ptIntersect2-2.png" width="672" style="display: block; margin: auto;" />

<br/>

In this analysis `rgeos::gIntersection` is clearly much less efficient than the
alternative options. Using `raster::intersect`, `rgeos::gIntersects`,
`sf::st_intersects` or `sf::st_intersection` significantly decreases calculation
time, with `sf::st_intersects` proving to be the most efficient option.

<br/>

### Polygons intersections

Now let's take a look at intersects using polygons only.

<br/>


```r
res2 <- data.frame(n = samp,
                   raster_intersect = numeric(nSamp),
                   rgeos_gIntersects = numeric(nSamp),
                   rgeos_gIntersection = numeric(nSamp),
                   sf_st_intersects = numeric(nSamp),
                   sf_st_intersection = numeric(nSamp))

for(i in 1:nSamp) {
    res2$raster_intersect[i] <- system.time(raster::intersect(gridSP, get(sampNamesSPPoly[i])))['elapsed']
    res2$rgeos_gIntersects[i] <- system.time(rgeos::gIntersects(gridSP, get(sampNamesSP[i]), byid = T))['elapsed']
    res2$rgeos_gIntersection[i] <- system.time(rgeos::gIntersection(gridSP, get(sampNamesSPPoly[i]), byid = T))['elapsed']
    res2$sf_st_intersects[i] <- system.time(sf::st_intersects(gridSF, get(sampNamesSFPoly[i])))['elapsed']
    res2$sf_st_intersection[i] <- system.time(sf::st_intersection(gridSF, get(sampNamesSFPoly[i])))['elapsed']
}
```


```r
# Visualize results table
knitr::kable(res2, "html", digits = 2) %>% kable_styling(full_width = F)
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> n </th>
   <th style="text-align:right;"> raster_intersect </th>
   <th style="text-align:right;"> rgeos_gIntersects </th>
   <th style="text-align:right;"> rgeos_gIntersection </th>
   <th style="text-align:right;"> sf_st_intersects </th>
   <th style="text-align:right;"> sf_st_intersection </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.04 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.04 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.04 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.05 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 0.09 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.09 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 100 </td>
   <td style="text-align:right;"> 0.17 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.18 </td>
   <td style="text-align:right;"> 0.04 </td>
   <td style="text-align:right;"> 0.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 250 </td>
   <td style="text-align:right;"> 0.39 </td>
   <td style="text-align:right;"> 0.02 </td>
   <td style="text-align:right;"> 0.30 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 500 </td>
   <td style="text-align:right;"> 0.67 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 0.68 </td>
   <td style="text-align:right;"> 0.04 </td>
   <td style="text-align:right;"> 0.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1000 </td>
   <td style="text-align:right;"> 1.43 </td>
   <td style="text-align:right;"> 0.03 </td>
   <td style="text-align:right;"> 1.20 </td>
   <td style="text-align:right;"> 0.08 </td>
   <td style="text-align:right;"> 0.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10000 </td>
   <td style="text-align:right;"> 14.58 </td>
   <td style="text-align:right;"> 0.18 </td>
   <td style="text-align:right;"> 14.43 </td>
   <td style="text-align:right;"> 0.23 </td>
   <td style="text-align:right;"> 3.69 </td>
  </tr>
</tbody>
</table>

```r

# Visualize results
layout(matrix(c(1,2), ncol =2), widths = c(5,2), heights = 3)
par(mar = c(4,4,1,1), las =1, family = "serif")
##
plot(res2$raster_intersect ~ res2$n, type = 'l', lwd = 2, col = cols[1], ylim = c(0,max(res2[,2:6])), xlab = 'Number of polygons', ylab = 'Time (s)')
lines(res2$rgeos_gIntersects ~ res1$n, lwd = 2, col = cols[2])
lines(res2$rgeos_gIntersection ~ res2$n, lwd = 2, col = cols[3])
lines(res2$sf_st_intersects ~ res2$n, lwd = 2, col = cols[4])
lines(res2$sf_st_intersection ~ res2$n, lwd = 2, col = cols[5])
# Legend
par(mar = c(0,0,0,0), family = "serif")
eplot()
legend(x = 'center', legend = as.character(colnames(res2)[-1]), bty = 'n', lty = 1, col = cols, seg.len = 2, cex = 0.8, title = expression(bold('Fonctions')))
```

<img src="/post/2017/Rintersects/RIntersects_files/figure-html/polyIntersect2-1.png" width="672" style="display: block; margin: auto;" />

```r

# Visualize results without gIntersection
layout(matrix(c(1,2), ncol =2), widths = c(5,2), heights = 3)
par(mar = c(4,4,1,1), family = "serif", las = 1)
#
plot(res2$rgeos_gIntersects ~ res2$n, type = 'l', lwd = 2, col = cols[2], ylim = c(0,max(res2[,c(3,5,6)])), xlab = 'Number of points', ylab = 'Time (s)')
lines(res2$sf_st_intersects ~ res2$n, lwd = 2, col = cols[4])
lines(res2$sf_st_intersection ~ res2$n, lwd = 2, col = cols[5])
# Legend
par(mar = c(0,0,0,0), family = "serif")
eplot()
legend(x = 'center', legend = as.character(colnames(res1)[-c(1,2,4)]), bty = 'n', lty = 1, col = cols[-c(1,3)], seg.len = 2, cex = 0.8, title = expression(bold('Fonctions')))
```

<img src="/post/2017/Rintersects/RIntersects_files/figure-html/polyIntersect2-2.png" width="672" style="display: block; margin: auto;" />

<br/>

We see here that `rgeos::gIntersects`, `sf::st_intersects`, `sf::st_intersection`
are far more efficient when dealing with polygons only intersects, with
`rgeos::gIntersects` the most efficient option. `raster::intersects` loses its
previous efficiency, while the efficiency of `rgeos::gIntersection` decreases
even further.

<br/>

## Concluding remarks

Et voilà! It is obvious from these simulations that the `sf` package overall
provides the most efficient options to perform spatial intersects in R.
`rgeos` is also very efficient when it comes to binary intersects, especially
with polygons on polygons intersects where it edges `st_intersects` by
decreasing calculation time in half.

Our recommendation: use `sf::st_intersects` for binary intersects and
use `sf::st_intersection` for zonal intersects. However, be aware that the `sf`
package evolves very rapidly and functions are likely to be modified,
although one would hope that efficiency decrease will not be the price of
further development.

If you wish to stick with the older packages, then binary intersects could be
done quite efficiently, but if you need zonal intersects, we recommend that you
start considering changing your ways!

<br/>

<details>
<summary> Session info <i class="fa fa-cogs" aria-hidden="true"></i> </summary>

```r
sessionInfo()
#R> R version 4.2.0 (2022-04-22)
#R> Platform: x86_64-pc-linux-gnu (64-bit)
#R> Running under: Debian GNU/Linux bookworm/sid
#R>
#R> Matrix products: default
#R> BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.10.1
#R> LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.10.1
#R>
#R> locale:
#R>  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
#R>  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
#R>  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
#R>  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
#R>  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
#R> [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
#R>
#R> attached base packages:
#R> [1] stats     graphics  grDevices utils     datasets  methods   base     
#R>
#R> other attached packages:
#R> [1] rgeos_0.5-9            raster_3.5-15          rgdal_1.5-32          
#R> [4] sp_1.4-7               sf_1.0-7               kableExtra_1.3.4      
#R> [7] knitr_1.39             magrittr_2.0.3         inSilecoRef_0.0.1.9000
#R>
#R> loaded via a namespace (and not attached):
#R>  [1] httr_1.4.3         sass_0.4.1         jsonlite_1.8.0     viridisLite_0.4.0
#R>  [5] bslib_0.3.1        shiny_1.7.1        assertthat_0.2.1   highr_0.9         
#R>  [9] base64url_1.4      yaml_2.3.5         lattice_0.20-45    pillar_1.7.0      
#R> [13] backports_1.4.1    glue_1.6.2         digest_0.6.29      promises_1.2.0.1  
#R> [17] rvest_1.0.2        RefManageR_1.3.0   colorspace_2.0-3   htmltools_0.5.2   
#R> [21] httpuv_1.6.5       plyr_1.8.7         pkgconfig_2.0.3    httpcode_0.3.0    
#R> [25] bookdown_0.26      purrr_0.3.4        xtable_1.8-4       scales_1.2.0      
#R> [29] webshot_0.5.3      processx_3.5.3     svglite_2.1.0      terra_1.5-21      
#R> [33] later_1.3.0        tibble_3.1.6       proxy_0.4-26       generics_0.1.2    
#R> [37] ellipsis_0.3.2     DT_0.23            withr_2.5.0        cli_3.3.0         
#R> [41] crayon_1.5.1       mime_0.12          evaluate_0.15      ps_1.7.0          
#R> [45] fansi_1.0.3        class_7.3-20       xml2_1.3.3         blogdown_1.10     
#R> [49] tools_4.2.0        data.table_1.14.2  lifecycle_1.0.1    stringr_1.4.0     
#R> [53] munsell_0.5.0      targets_0.12.0     callr_3.7.0        compiler_4.2.0    
#R> [57] jquerylib_0.1.4    e1071_1.7-9        systemfonts_1.0.4  rlang_1.0.2       
#R> [61] units_0.8-0        grid_4.2.0         classInt_0.4-3     rstudioapi_0.13   
#R> [65] htmlwidgets_1.5.4  igraph_1.2.11      miniUI_0.1.1.1     rmarkdown_2.14    
#R> [69] codetools_0.2-18   DBI_1.1.2          curl_4.3.2         R6_2.5.1          
#R> [73] lubridate_1.8.0    dplyr_1.0.9        fastmap_1.1.0      utf8_1.2.2        
#R> [77] rcrossref_1.1.0    KernSmooth_2.23-20 stringi_1.7.6      crul_1.2.0        
#R> [81] Rcpp_1.0.8.3       vctrs_0.4.1        tidyselect_1.1.2   xfun_0.30
```
</details>
