---
title: Add icons on your R plot
author: [kevin, david]
date: 2017-05-23
tags: [R, plot, fonts, icons]
rpkgs: [showtext, utils, graphics]
tweet: "How to add icons on your R plot"
draft: false
estime: 10
archived: 2020-03-18
edits:
  - date: 2017-11-11
    comment: "Fix paths to icon files"
  - date: 2018-04-15
    comment: "Change URLs to download Font-Awesome"
  - date: 2020-03-18
    comment: "Fix image links"
  - date: 2022-04-23
    comment: "Add 'archived' badge."
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
GitHub <i class="fa fa-github" aria-hidden="true"></i>). Here, we explain how
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
make a direct **link** with a [previous blog post](/2017/04/14/make-your-r-plot-hylian/).




## Setting up R

#### R version used to build the last update of this post


```r
sessionInfo()[[1L]]$version.string
#R> [1] "R version 3.5.2 (2018-12-20)"
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
#R> [1] '0.6'
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
and you will be able to use them in other pieces of software *e.g.* LibreOffice) or
store them in a dedicated folder whose path will be denoted `dr` hereafter.



```r
dir.create("assets", showWarnings = FALSE)
##-- URLs
urls <- c(
  'https://github.com/jpswalsh/academicons/raw/master/fonts/academicons.ttf',
  'https://github.com/xdanaux/fontawesome-latex/raw/master/FontAwesome.otf',
  'https://github.com/ionic-team/ionicons/raw/master/docs/fonts/ionicons.ttf'
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
font_add(family = 'FontAwesome', regular = 'FontAwesome.otf')
font_add(family = 'ionicons', regular = 'ionicons.ttf')
##-- check the font families available
font_families()
#R> [1] "sans"         "serif"        "mono"         "wqy-microhei"
#R> [5] "academicons"  "FontAwesome"  "ionicons"
```

Here, things are going to be a little bit trickier than they were in the
[Hylian blog post](/post/archived/hylianStyle/), as we should first locate the
unicode characters to be used. Fortunately, this is fairly doable:

  1. FontAwesome provides a very [helpful cheatsheet](http://fontawesome.io/cheatsheet/);
  2. `.ttf` files are easy to explore, for instance using LibreOffice and
  inserting a special character (see the figure below).

<br>

<center><img src = "assets/academicons.png" width = "80%"></img></center>

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

<center><img src = "assets/academiconR.png" width = "80%"></img></center>


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

<img src="assets/figfontawe-1.png" width="912" style="display: block; margin: auto;" />

### Adding Ionicons

The unicode decimal value of Ionicons's icons range from 61696 to 62711.
There are 765 icons available (version 2.0.1), therefore some hexidecimal are
not assigned. Here we'll use the `intToUtf8()` function to convert the decimal
value into an unicode character.


```r
val <- 61970:62046
ias <- sapply(val, FUN = intToUtf8)
coord <- expand.grid(rev(1:11), 1:7)
##
par(mar=c(2,2,2,2), family = "ionicons")
plot(coord[,1], coord[,2], ann = FALSE, axes = FALSE, pch = ias, cex = 5, col = cols)
```

<img src="assets/figionic-1.png" width="912" style="display: block; margin: auto;" />



### Combining them

To combine, we have to switch from one font to another. Here is a simple
example that combines the three icon frameworks.


```r
par(las=1, mar=c(4,5,4,4))
image(datasets::volcano, col=colorRampPalette(c("grey10", "grey90"))(100), axes=FALSE)
contour(datasets::volcano, add=T, col="#ffdd55")
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

<img src="assets/volcano-1.png" width="912" style="display: block; margin: auto;" />


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

<br>

<details>
<summary>Session info <i class="fa fa-cogs" aria-hidden="true"></i></summary>

```r
sessionInfo()
#R> R version 3.5.2 (2018-12-20)
#R> Platform: x86_64-pc-linux-gnu (64-bit)
#R> Running under: Debian GNU/Linux 10 (buster)
#R>
#R> Matrix products: default
#R> BLAS: /usr/lib/x86_64-linux-gnu/openblas/libblas.so.3
#R> LAPACK: /usr/lib/x86_64-linux-gnu/libopenblasp-r0.3.5.so
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
#R> [1] showtext_0.6   showtextdb_2.0 sysfonts_0.8   magrittr_1.5  
#R>
#R> loaded via a namespace (and not attached):
#R>  [1] Rcpp_1.0.0      bookdown_0.9.2  digest_0.6.18   evaluate_0.13  
#R>  [5] blogdown_0.12   stringi_1.4.3   rmarkdown_1.12  tools_3.5.2    
#R>  [9] stringr_1.4.0   xfun_0.7        yaml_2.2.0      compiler_3.5.2
#R> [13] htmltools_0.3.6 knitr_1.23
```
</details>
