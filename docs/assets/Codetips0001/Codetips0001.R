## ----addStatus, echo=FALSE, results="asis", message=FALSE----------------
  source("Rscripts/addStatus.R")
  addStatus("Codetips0001.Rmd")

## ----inOperator----------------------------------------------------------
vecA <- c("a", "d", "2", "4", "e", ";")
vecB <- letters # vector of lower case letters the Roman alphabet
vecA%in%vecB

## ----intersect-----------------------------------------------------------
intersect(vecA, vecB)

## ----paste1--------------------------------------------------------------
paste("myfile", 1:7)

## ----paste2--------------------------------------------------------------
paste("myfile", 1:3, sep="")

## ----paste0--------------------------------------------------------------
paste0("myfile", 1:3)

## ----cat, eval=F---------------------------------------------------------
## for (i in 1:10) {
##   cat("iteration n°", i, "\n")
## }

## ----catErase, eval=F----------------------------------------------------
## for (i in 1:10) {
##   Sys.sleep(.25) # I added a pause so you can see what's happening
##   cat("iteration n°", i, "\r")
## }

## ----catMonitorPerc, eval=F----------------------------------------------
## nmx <- 222
## for (i in 1:nmx) {
##   Sys.sleep(.01) # replace it by what you are doing
##   cat("==>", format(100*i/nmx, digits=4), "%", "\r")
## }

## ----catMonitorPB, eval=F------------------------------------------------
## nmx <- 222
## sz <- 60
## for (i in 1:nmx) {
##   Sys.sleep(.01) # replace it by what you are doing
##   nb <- floor(sz*i/nmx)
##   pgr <- paste(rep(c("="," "), c(nb, sz-nb)), collapse="")
##   cat("|", pgr, "| ", "\r")
## }

## ----sprintf1, results='hold'--------------------------------------------
sprintf("%d", 1)
sprintf("%f", pi)
sprintf("%s", "A")

## ----sprintf2------------------------------------------------------------
sprintf("An integer: %d, a double: %f, a string: %s", 1, pi, "A")

## ----sprintf3------------------------------------------------------------
sprintf("%10f", pi)

## ----sprintf4------------------------------------------------------------
sprintf("%010f", pi)

## ----sprintf5------------------------------------------------------------
sprintf("%.50f", pi)

## ----sprintf6------------------------------------------------------------
paste0("myfile", sprintf("%03d", c(1,10,100)))

## ----xaxsYaxs, fig.width=9.5---------------------------------------------
par(mfrow=c(1,2), bty="l")
plot(0:10, 0:10, pch=20)     
par(xaxs="i", yaxs="i")   
plot(0:10, 0:10, pch=20)   

## ----xaxsYaxsV2, fig.width=9.5-------------------------------------------
par(mfrow=c(1,2), bty="l")
plot(0:10, 0:10, pch=20)  
abline(v=c(0,10), h=c(0,10), col=2)   
par(xaxs="i", yaxs="i")   
plot(0:10, 0:10, pch=20)   
abline(v=c(0,10), h=c(0,10), col=2)

