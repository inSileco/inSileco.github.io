---
title: Add icons on your R plot
author: [kevin, david]
date: 2017-05-23
tags: [R, plot, fonts, icons]
rpkgs: [showtext, utils, graphics]
tweet: "How to add icons on your R plot"
draft: false
estime: 10
edits:
  - date: 2017-11-11
    comment: "Fix paths to icon files"
  - date: 2018-04-15
    comment: "Change URLs to download Font-Awesome"
output:
  rmarkdown::html_page:
    toc: true
    fig_width: 3
    dev: svg
---






## Introduction

Icons are very popular on websites to improve the visual grepping (*i.e.* visual
optimization of *eyeball* search). We all know how to go at the top or the
bottom of a website clicking on chevrons (<i class="fa fa-chevron-down"
aria-hidden="true"></i> <i class="fa fa-chevron-up" aria-hidden="true"></i>).
We are also familiar with simple symbols that allow us to click and edit the
text we are typing (<i class="fa fa-align-left" aria-hidden="true"></i>
<i class="fa fa-align-center" aria-hidden="true"></i>
<i class="fa fa-align-right" aria-hidden="true"></i>). Moreover, some web
applications are so widespread than their logo appears in thousands of websites
(i.e Twitter <i class="fa fa-twitter" aria-hidden="true"></i> or
Github <i class="fa fa-github" aria-hidden="true"></i>). Here, we explain how
to use these icons in your R plots. Why use icons on an R plot? It simply
increases the possibilities for the number of markers you could use and thus
efficiently and usefully refine your plots.

There are two strategies to include icons on a R plot:

  1. using icons as a font when possible;    
  2. using icons as images.

Here, we exemplify the first strategy and leave the second one for another post
(hopefully). We will use icons from three different iconic frameworks:

  1. [Academicon](jpswalsh.github.io/academicons/);   
  2. [Font Awesome](http://fontawesome.io);        
  3. [Ionicons](http://ionicons.com).   

All of these frameworks propose either a `.ttf` (TrueType Font) or a `.otf`
file (OpenType Font) or both. These files make our life very easy and we can
make a direct **link** with a [previous blog post](/post/HylianStyle.html).





## Setting up R

#### R version used to build the last update of this post


```r
sessionInfo()[[1L]]$version.string
#R> [1] "R version 3.4.4 (2018-03-15)"
```

#### List of packages to be used

- the `showtext` package and its dependency `sysfont` (see details on line [<i class="fa fa-link" aria-hidden="true"></i>](https://cran.r-project.org/web/packages/showtext/index.html));      
- the `magrittr` package for the pipes (see the [associated websites](http://magrittr.tidyverse.org)).    

Here is line of code you need to install these packages:


```r
install.packages(c('magrittr', 'showtext'))
```

Then, we load them:


```r
library(magrittr)
library(showtext)
packageVersion("showtext")
#R> [1] '0.5.1'
```


#### Material to be downloaded

We first need to download the 3 fonts we will be using. Links to retrieve them
are available below and the next code chunk describes how
use the R to get these fonts.

1. [the *Academicons* font](https://github.com/jpswalsh/academicons/raw/master/fonts/academicons.ttf)   
2. [the *FontAwesome* font](https://github.com/FortAwesome/Font-Awesome/blob/master/web-fonts-with-css/webfonts/fa-regular-400.ttf)   
3. [the *Ionicons* font](https://github.com/driftyco/ionicons/raw/master/fonts/ionicons.ttf)

If you have decided to downloaded theses fonts, you can then either install them
on your computer (there is most likely an application on your computer to do so
and you will be able to use them in other softwares *e.g.* LibreOffice) or
store them in a dedicated folder whose path will be denoted `dr` hereafter.



```r
dir.create("assets", showWarnings = FALSE)
##-- URLs
urls <- c(
  'https://github.com/jpswalsh/academicons/raw/master/fonts/academicons.ttf',
  'https://github.com/inSileco/inSileco.github.io/raw/dev/static/fonts/fontawesome-webfont.ttf',
  'https://github.com/driftyco/ionicons/raw/master/fonts/ionicons.ttf'
  )   
##-- download the fonts
for (i in 1:3){
  download.file(urls[i], destfile=paste0("assets/", basename(urls[i])))
}
```



## Loading the fonts

To activate the facilities `showtext` provides, use `showtext_auto()`
(by the way, the author of the package deserves a medal!):


```r
showtext_auto()
```
<!-- help rebuilding the website without downloading font as they are
included in this folder -->

We add the path to our fonts:


```r
font_paths("assets")
```

Then, we add `academicons.ttf`, `FontAwesome.otf` and `ionicons.ttf` to our
session with the `font_add()` function:


```r
font_add(family = 'academicons', regular = 'assets/academicons.ttf')
font_add(family = 'FontAwesome', regular = 'fontawesome-webfont.ttf')
font_add(family = 'ionicons', regular = 'ionicons.ttf')
##-- check the font families available
font_families()
#R> [1] "sans"         "serif"        "mono"         "wqy-microhei"
#R> [5] "academicons"  "FontAwesome"  "ionicons"
```

Here, things are going to be a little bit trickier than they were in the
[Hylian blog post]({{ ref "HylianStyle.html" }}), as we should first locate the
unicode characters to be used. Fortunately, this is fairly doable:

  1. FontAwesome provides a very [helpful cheatsheet](http://fontawesome.io/cheatsheet/);     
  2. `.ttf` files are easy to explore, for instance using LibreOffice and
  inserting a special character (see the figure below).     

<br>

<center> ![Academicons on LibreOffice](assets/academicons.png) </center>

<br>
<br>

To use unicode characters in R, there are several possibilities, this
[blog post](https://www.r-bloggers.com/unicode-symbols-in-r/) explains it well.
Below, we use different way to deal with the unicode characters.




## Let's add icons our plot


### Academicons

There are 36 unicode characters available. They are numbered like so: "E9" +
numbers ranging from 00 to 35 (version 1.8.0). To use them, we create a
sequence using `sprintf()` and `paste0()` function:


```r
nb <- 54
acs <- sprintf("%02d", 5+1:nb) %>% paste0("E8",.)
coord <- expand.grid(1:9, 1:6)
cols <- c("#3fb3b2", "#8555b4", "#ffdd55", "#1b95e0")
```

We now plot them as if they were on a regular grid and we add the decimal value
below:


```r
par(mar=c(0,0,0,0))
plot(c(0,10), c(0,7), type="n", ann=FALSE, axes=FALSE)
text(coord[,1], coord[,2], labels= acs, offset = 2.2, cex=1.6, pos=1)
##
par(family = "academicons")
points(coord[,1], coord[,2], pch=-as.hexmode(acs), cex=4.8, col=cols)
```

<center><img src = "assets/academiconR.png" width = "90%"></img></center>


### Adding FontAwesome's icons

The unicode hexadecimal for the FontAwesome's icons range from `f000`
(<i class="fa fa-glass" aria-hidden="true"></i>) to `f2e0`
(<i class="fa fa-meetup" aria-hidden="true"></i>) in version 4.7. Version


```r
nsq <- 12
fas <- 1:(nsq*nsq) %>% as.hexmode %>% paste0("f0", .)
coord <- expand.grid(1:nsq, 1:nsq)
par(mar=c(2,2,2,2), family = 'FontAwesome')
plot(coord[,1], coord[,2], pch=-as.hexmode(fas), cex=5, col=cols, ann=FALSE, axes=FALSE)
```

<img src="/rmarkdown-libs/figure-html4/figfontawe-1.png" width="912" style="display: block; margin: auto;" />

### Adding Ionicons

The unicode decimal value of Ionicons's icons range from 61696 to 62711.
There are 765 icons available (version 2.0.1), therefore some hexidecimal are
not assigned. Here we'll use the `intToUtf8()` function to convert the decimal
value into an unicode character.


```r
val <- 61970:62046
ias <- sapply(val, FUN=intToUtf8)
coord <- expand.grid(rev(1:11), 1:7)
##
par(mar=c(2,2,2,2), family = "ionicons")
plot(coord[,1], coord[,2], ann=FALSE, axes=FALSE, pch=ias, cex=5, col=cols)
```

<img src="/rmarkdown-libs/figure-html4/figionic-1.png" width="912" style="display: block; margin: auto;" />



### Combining them

To combine, we have to switch from one font to another. Here is a simple
example that combines the three icon frameworks.


```r
data(volcano)
par(las=1, mar=c(4,5,4,4))
image(volcano, col=colorRampPalette(c("grey10", "grey90"))(100), axes=FALSE)
contour(volcano, add=T, col="#ffdd55")
title(main = toupper("My volcano"), cex.main=2)
##
par(family="FontAwesome")
title(ylab=intToUtf8(61552), cex.lab=2)
points(0.336, 0.58, pch=-as.hexmode("F041"), col="#3fb3b2", cex=5)
##
par(family = "ionicons")
points(0.946, 0.943, pch=-as.hexmode("F203"), col="grey95", cex=5)
points(0.451, 0.091, pch=-as.hexmode("F448"), col="#3fb3b2", cex=4)
##
par(family = "academicons")
mtext(text=intToUtf8(59476), side=4, adj=1, line=3, col = "#8555b4", cex=6)
```

<img src="/rmarkdown-libs/figure-html4/volcano-1.png" width="912" style="display: block; margin: auto;" />



## Additional remarks

1. Note that the steps described here are useful to include any kind of police
you have on your computer or you may find online. Therefore this post should
help you deal with font if you intend to publish a figure in a journal that
requests a specific font. By the way, `showtext` allows you to search directly
on [Google Fonts](https://fonts.google.com/) (see the `font_add_google()` function).

2. As you may have realized reading this post there are different ways to write
a character in unicode. Fortunately, many online converters help you get from
one standard to another (*e.g.*
[unicodeconverter](http://www.endmemo.com/unicode/unicodeconverter.php) does the job).

3. You may also want to use emoji to cheer your plot up! See the emojifont
package available on [CRAN](https://cran.r-project.org/web/packages/emojifont/)
and [Github](https://guangchuangyu.github.io/emojifont/). It now support
fontawsome [as explained here](https://guangchuangyu.github.io/2016/03/font-awesome-supported-in-emojifont/).

4. [fontstruct](https://fontstruct.com) is a great web application that helps
you creating your own font (you can save your font as a `.tff` on your computer
and now you know how to deal with it!)
