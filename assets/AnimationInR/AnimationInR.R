## ----addStatus, echo=FALSE, results="asis", message=FALSE----------------
  source("Rscripts/addStatus.R")
  addStatus("AnimationInR.Rmd")

## ---- include = FALSE----------------------------------------------------
rm(list=ls())
library(raster)
library(magrittr)
library(plyr)
library(animation)
library(rgdal)

## ----infosession---------------------------------------------------------
sessionInfo()[[1]]$version.string

## ---- loadData, message=F------------------------------------------------
# UV data
    UV <- readRDS('./data/MonthOMI.rds')

# Projection
    spatProj <- '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'

# Ocean shapefile
    ocean <- readOGR(dsn = "./data/shpfile/", layer = "ne_10m_ocean") %>%
             spTransform(CRSobj = CRS(spatProj))

    class(ocean)

## ---- setParam-----------------------------------------------------------
# Graphical parameters
    min_ <- min(UV[[1]], na.rm = T) %>% plyr::round_any(., 100, floor) # Minimum values in UV dataset
    max_ <- max(UV[[1]], na.rm = T) %>% plyr::round_any(., 100, ceiling) # Minimum values in UV dataset
    ext <- c(-72, -54, 44, 53) # c(xmin, xmax, ymin, ymax)
    rbPal <- colorRampPalette(c('#2f6eb9','#2aadba','#c4c726','#b45f5f')) # color palette
    labels <- matrix(seq(4,(151-4)), ncol = 12, nrow = 12, dimnames = list(2005:2016, month.abb), byrow = T)  # Select only full years (start: 2004/10; end: 2017/04)

# Monthly trends
    monthMean <- apply(X = UV[[1]], MARGIN = 3, FUN = mean, na.rm = T) # monthly mean
    monthSd <- apply(X = UV[[1]], MARGIN = 3, FUN = sd, na.rm = T) # monthly sd
    years <- 2005:2016
    lowCI <- monthMean - (1.96*monthSd) # Lower confidence interval
    upCI <- monthMean + (1.96*monthSd) # Upper confidence interval

# Empty plot function
    eplot <- function(x = 1, y = 1, xmin = 0, xmax = 1, ymin = 0, ymax = 1) {
      plot(x = x,y = y,bty = "n",ann = FALSE,xaxt = "n",yaxt = "n",type = "n",bg = 'grey',ylim = c(ymin,ymax),xlim = c(xmin,xmax))
    }

# Legend function
    colorBar <- function(colRamp, min, max, nticks=11, ticks=seq(min, max, len=nticks)) {
        scale = (length(colRamp)-1)/(max-min)
        par(mar = c(5,0.5,5,4))
        plot(c(0,10), c(min_,max_), type='n', bty='n', xaxt='n', xlab='', yaxt='n', ylab='')
        axis(4, ticks, las=1, cex = 1.5)
        for (i in 1:(length(colRamp)-1)) {
            y = (i-1)/scale + min
            rect(0,y,10,y+1/scale, col=colRamp[i], border=NA)
        }
    }

## ---- animate1, eval = FALSE---------------------------------------------
## saveGIF({
##         for(i in 1:ncol(labels)){
##             par(mar = c(0,0,0,0), pch = 21,  xaxs = "i", yaxs = "i", family = "serif")
##             r <- raster::raster(UV[[1]][,,labels[1,i]], xmn = ext[1], xmx = ext[2], ymn = ext[3], ymx = ext[4], crs = spatProj) %>%
##                 mask(ocean)
##             eplot(xmin = ext[1], xmax = ext[2], ymin = ext[3], ymax = ext[4])
##             plot(r, col= rbPal(100), breaks = seq(min_,max_,length.out=100), legend = F, add = T)
##             plot(ocean, add = T, lwd = 2)
##             text(x = -54.5, y = 45, labels = paste(colnames(labels)[1], rownames(labels)[i]), adj = 1, cex = 1.5)
##         }
## }, movie.name = "UV2005animate.gif")

## ---- animate2, eval = FALSE---------------------------------------------
## ani.options(ani.height = 720, ani.width = 720)
## saveGIF({
##     for(i in 1:nrow(labels)) {
##         #layout
##             mat <- matrix(c(13:15,1:3,16:18,4:6,19:21,7:9,22:24,10:12), ncol = 3, nrow = 8, byrow = T) %>%
##                     cbind(c(0,0,25,25,25,25,0,0)) %>%
##                     rbind(26, .)
##             layout(mat, widths = c(3,3,3,1.25), heights = c(1,rep(c(2,3),4)))
## 
##         # Rasters
##             for(j in 1:ncol(labels)) {
##                 par(pch = 21,  xaxs = "i", yaxs = "i", family = "serif", mar = c(0,0,0,0))
##                 r <- raster::raster(UV[[1]][,,labels[i,j]], xmn = ext[1], xmx = ext[2], ymn = ext[3], ymx = ext[4], crs = spatProj) %>%
##                      mask(ocean)
##                 eplot(xmin = ext[1], xmax = ext[2], ymin = ext[3], ymax = ext[4])
##                 image(r, col= rbPal(100), breaks = seq(0,max_,length.out=101), legend = F, add = T)
##                 plot(ocean, add = T)
##                 text(x = -54.5, y = 45, labels = paste(colnames(labels)[j], rownames(labels)[i]), adj = 1, cex = 1.5)
##             }
## 
##         # Plot trends
##             for(j in 1:ncol(labels)) {
##                 temporal <- data.frame(years = years[1:i], monthMean = monthMean[labels[1:i,j]], lowCI = lowCI[labels[1:i,j]], upCI = upCI[labels[1:i,j]]) %>%
##                             na.omit()
##                 polyY <- c(temporal$upCI, rev(temporal$lowCI)) # Y coordinates for confidence interval polygon
##                 polyX <- c(temporal$years, rev(temporal$years)) # X coordinates for confidence interval polygon
## 
##                 par(mar = c(0,3,1,1), family = "serif")
##                 eplot(xmin = 2005, xmax = 2016, ymin = 0, ymax = max(upCI))
##                 polygon(polyX, polyY, border = 'transparent', col = "#d9e5f4")
##                 lines(temporal$monthMean ~ temporal$years, lwd = 0.5, col = '#0057bb')
##                 axis(side = 2, at = seq(0, plyr::round_any(max(upCI), 1000, ceiling), by = 2500), las = 1, pos = 2004.75, cex =  1.5)
##             }
## 
##         # Plot legend
##             colorBar(rbPal(101), min = 0, max = max_)
## 
##         # Graph title
##             par(mar = c(0,0,0,0))
##             eplot(xmin = 0, xmax = 10, ymin = 0, ymax = 10)
##             text(x = 5, y = 5, labels = bquote("Erythemal UV Irradiance (mW/m" ^2 *")"), cex = 2)
## 
##     }
## }, movie.name = "UVanimate.gif")

