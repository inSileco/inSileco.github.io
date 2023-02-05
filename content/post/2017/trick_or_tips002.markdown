---
title: Trick or Tips 002 {R}
author: [kevin]
date: 2017-11-12
tags: [R, tips, trickortips]
rpkgs: [base, utils, graphics, magrittr, raster, knitr]
tweet: Second post of the 'Trick or Tips' series
estime: 6
edits:
  - date: 2022-04-23
    comment: "Fix typos."
  - date: 2022-05-24
    comment: "Add session info section."
  - date: 2023-02-04
    comment: "Edit headers."
output:
  blogdown::html_page:
    dev: svglite
---

{{< trickortips >}}

<br>

## The `drop` argument of the `[]` operator

This is something not obvious and poorly known but there is a logical argument
`drop` that can be passed to the `[]` operator and I’ll try to explain why it
could be useful\! Let’s first create a data frame with ten rows and three
columns:

``` r
df <- data.frame(
  var1 = runif(10),
  var2 = runif(10),
  var3 = runif(10)
)
head(df)
#R>          var1       var2       var3
#R>  1 0.61694304 0.74175689 0.02898609
#R>  2 0.09668309 0.01312552 0.34378123
#R>  3 0.15729658 0.12914987 0.86385779
#R>  4 0.37476169 0.23834580 0.98038883
#R>  5 0.76509838 0.80522554 0.11231265
#R>  6 0.20512979 0.59831527 0.61874514
```

To extract the first column, I use the `[]` operator and either type the number
of the column like so:

``` r
df[, 1]
#R>   [1] 0.61694304 0.09668309 0.15729658 0.37476169 0.76509838 0.20512979
#R>   [7] 0.01009526 0.14604056 0.21738345 0.77641253
```

or the name of the column to be extracted:

``` r
df[, 'var1']
#R>   [1] 0.61694304 0.09668309 0.15729658 0.37476169 0.76509838 0.20512979
#R>   [7] 0.01009526 0.14604056 0.21738345 0.77641253
```

Interestingly enough, this returns a **vector**, not a data.frame

``` r
class(df)
#R>  [1] "data.frame"
class(df[, 'var1'])
#R>  [1] "numeric"
```

while if I extract two columns, I have a data frame:

``` r
class(df[, c('var1', 'var2')])
#R>  [1] "data.frame"
```

This behavior is actually very useful in many cases as we often are happy to
deal with a vector when we extract only one column. However this might become
an issue when we do extractions without knowing the number of columns
to be extracted beforehand (typically when extracting according to a request
that can give any number of columns). In such case if the number is one then
we end up with a vector instead of a data.frame. The argument `drop` provides
a work around. By default it is set to `TRUE` and a 1-column data frame becomes
a vector, but using `drop = FALSE` prevents this from happening. Let’s try this:

``` r
df[, 1, drop = FALSE]
#R>           var1
#R>  1  0.61694304
#R>  2  0.09668309
#R>  3  0.15729658
#R>  4  0.37476169
#R>  5  0.76509838
#R>  6  0.20512979
#R>  7  0.01009526
#R>  8  0.14604056
#R>  9  0.21738345
#R>  10 0.77641253
```

Let’s check its class:

``` r
class(df[, 1, drop = FALSE])
#R>  [1] "data.frame"
```

You can actually obtain the same result using the name of the column or its
number without comma (a data frame is a list of vector which have the
same size, so you can basically subset the list\!).

``` r
df[1]
#R>           var1
#R>  1  0.61694304
#R>  2  0.09668309
#R>  3  0.15729658
#R>  4  0.37476169
#R>  5  0.76509838
#R>  6  0.20512979
#R>  7  0.01009526
#R>  8  0.14604056
#R>  9  0.21738345
#R>  10 0.77641253
```

But if you need a specific selection of rows, you better use `drop`\!

``` r
df[2:5, 1, drop = FALSE]
#R>          var1
#R>  2 0.09668309
#R>  3 0.15729658
#R>  4 0.37476169
#R>  5 0.76509838
```

Now you know ;-)

<br>

## Get the citation of a package

Many researchers (it is especially TRUE in ecology) uses R and write paper and
carry out analyses using R for their research. One cones the time of citing the
package I guess they wonder how to cite the package. However authors of
package actually provides this information in their package\! Let’s have a look
of the reference for the package `knitr` as of version 1.17 using function
`citation`

``` r
citation("knitr")
#R>  
#R>  To cite the 'knitr' package in publications use:
#R>  
#R>    Yihui Xie (2022). knitr: A General-Purpose Package for Dynamic Report
#R>    Generation in R. R package version 1.41.
#R>  
#R>    Yihui Xie (2015) Dynamic Documents with R and knitr. 2nd edition.
#R>    Chapman and Hall/CRC. ISBN 978-1498716963
#R>  
#R>    Yihui Xie (2014) knitr: A Comprehensive Tool for Reproducible
#R>    Research in R. In Victoria Stodden, Friedrich Leisch and Roger D.
#R>    Peng, editors, Implementing Reproducible Computational Research.
#R>    Chapman and Hall/CRC. ISBN 978-1466561595
#R>  
#R>  To see these entries in BibTeX format, use 'print(<citation>,
#R>  bibtex=TRUE)', 'toBibtex(.)', or set
#R>  'options(citation.bibtex.max=999)'.
```

As suggested in the message, we can even retrieve a reference list in bibtex
format with the `toBibtex` function, let’s do this:

``` r
toBibtex(citation("knitr"))
#R>  @Manual{,
#R>    title = {knitr: A General-Purpose Package for Dynamic Report Generation in R},
#R>    author = {Yihui Xie},
#R>    year = {2022},
#R>    note = {R package version 1.41},
#R>    url = {https://yihui.org/knitr/},
#R>  }
#R>  
#R>  @Book{,
#R>    title = {Dynamic Documents with {R} and knitr},
#R>    author = {Yihui Xie},
#R>    publisher = {Chapman and Hall/CRC},
#R>    address = {Boca Raton, Florida},
#R>    year = {2015},
#R>    edition = {2nd},
#R>    note = {ISBN 978-1498716963},
#R>    url = {https://yihui.org/knitr/},
#R>  }
#R>  
#R>  @InCollection{,
#R>    booktitle = {Implementing Reproducible Computational Research},
#R>    editor = {Victoria Stodden and Friedrich Leisch and Roger D. Peng},
#R>    title = {knitr: A Comprehensive Tool for Reproducible Research in {R}},
#R>    author = {Yihui Xie},
#R>    publisher = {Chapman and Hall/CRC},
#R>    year = {2014},
#R>    note = {ISBN 978-1466561595},
#R>    url = {http://www.crcpress.com/product/isbn/9781466561595},
#R>  }
```

Even if you are no a Latex user, this could be very helpful as this file
can be read by a references management software such as [Zotero](https://www.zotero.org/).
So now let’s say I use the following command line:

``` r
cat(toBibtex(citation("knitr")), file='biblio.bib', sep='\n')
```

Then the `biblio.bib` file just created can be imported in your favorite
references manager software.

<br>

## Using namespace

In R, functions are stored in packages and adding a package is like adding
a collection of functions. As you get more experienced with R you likely
know and use more and more packages. You might even come to the point
where you have functions that have the same name but originate from different package.
If not, let me show you something:

``` r
library(magrittr)
df <- data.frame(
  var1 = runif(10),
  var2 = runif(10)
  )
extract(df, 'var1')
#R>            var1
#R>  1  0.005430849
#R>  2  0.865673797
#R>  3  0.848216866
#R>  4  0.307827896
#R>  5  0.144029316
#R>  6  0.015273538
#R>  7  0.634376732
#R>  8  0.480184179
#R>  9  0.205316175
#R>  10 0.144835843
```

Here I use the function `extract()` from the `magrittr` package that act as `[]`
and I extract the column `var1` from `df`. This function is actually designed
to be use with pipes (if this sounds weird, have a look at the
[magrittr](http://magrittr.tidyverse.org/) package), for instance when piping
you can write `df %$% extract(var1)` or even `df %>% '['('var1')` and this will
do the same. So far, so good. Now I load the
[raster](https://cran.r-project.org/web/packages/raster/index.html) package:

``` r
library(raster)
#R>  Loading required package: sp
```

and try the same extraction.

``` r
extract(df, 'var1')
#R>  Error in (function (classes, fdef, mtable) : unable to find an inherited method for function 'extract' for signature '"data.frame", "character"'
```

It does not work…Why?? Briefly, `extract()` from `raster` is now called (this
was the warning message on load said) and it does not get well with data.frame
(this is the meaning of the error message). To overcome this you can use a
explicit namespace. To do so you put the names of the package followed by `::`,
this is basically the unique identifier of the function. Indeed, within a
specific package, functions have different names and on CRAN packages must have
different names, so the combination of the two is unique (this holds true if you
only package from the CRAN). Let’s use it:

``` r
magrittr::extract(df, 'var1')
#R>            var1
#R>  1  0.005430849
#R>  2  0.865673797
#R>  3  0.848216866
#R>  4  0.307827896
#R>  5  0.144029316
#R>  6  0.015273538
#R>  7  0.634376732
#R>  8  0.480184179
#R>  9  0.205316175
#R>  10 0.144835843
```

Using this is also very helpful when you develop a package and functions from
different packages. Even if you script and use a large number
of function from various packages, it could be better to remember
from which package functions come from. Finally, note that this is not R specific
at all, actually this something very common in programming languages.

<br>

## How to use non-exported functions?

Packages often contain functions that are not exported. There are often functions
called by the functions exported that helps structuring the code of the package.
However, it happens that when you try to understand how a package work you may
want to spend some time understanding how they do work (especially given that
they are nit documented). There is actually a way to call them\! Instead of using
tow colons (`:`), use three\! Let’s have a look to the code of one of this function
from the `knitr` package (again version 1.17):

    knitr:::.color.block

Interesting, isn’t it\! To give you an idea about how frequent this can be, in
this packages there are 103 exported functions and 425 not-exported. Below
are presented few examples of exported functions followed by not-exported ones.

``` r
##------------------------ Exported functions
## knitr::pat_rnw             knitr::fig_path            knitr::all_patterns
## knitr::fig_chunk           knitr::clean_cache         knitr::kable
## knitr::knit_params_yaml    knitr::raw_output          knitr::render_sweave
## knitr::stitch_rhtml        knitr::include_graphics    knitr::Sweave2knitr
## knitr::hook_plot_asciidoc  knitr::hook_optipng        knitr::hook_plot_tex
## knitr::knit_print          knitr::knit_watch          knitr::knit2html
## knitr::render_html         knitr::knit2wp             knitr::rocco
## knitr::opts_template       knitr::normal_print        knitr::include_url
## knitr::combine_words       knitr::render_listings     knitr::current_input
##------------------------ (27/103 displayed)
##------------------------
##------------------------ Not-exported functions
## knitr:::.__NAMESPACE__.            knitr:::knit_expand
## knitr:::.__S3MethodsTable__.       knitr:::knit_filter
## knitr:::.base.pkgs                 knitr:::knit_global
## knitr:::.chunk.hook.html           knitr:::knit_handlers
## knitr:::.chunk.hook.tex            knitr:::knit_hooks
## knitr:::.color.block               knitr:::knit_log
## knitr:::.default.hooks             knitr:::knit_meta
## knitr:::.fmt.pat                   knitr:::knit_meta_add
## knitr:::.header.framed             knitr:::knit_params
## knitr:::.header.hi.html            knitr:::knit_params_handlers
## knitr:::.header.hi.tex             knitr:::knit_params_yaml
## knitr:::.header.maxwidth           knitr:::knit_patterns
## knitr:::.header.sweave.cmd         knitr:::knit_print
## knitr:::.img.attr                  knitr:::knit_print.default
##------------------------ (28/425 displayed)
```

I think that this could be very helpful when you want to understand exactly
how a package works\!

<br>

## The `las` argument of `par()`

I really enjoy using `graphics` to create plots in R. That being said the default
values always puzzles me\! One I specially dislike is that values on the y-axis
are perpendicular…

``` r
vec <- runif(10)
plot(vec)
```

<img src="/post/2017/trick_or_tips002_files/figure-html/las0-1.svg" width="384" style="display: block; margin: auto;" />

Fortunately this can readily be changed using the the `las` argument of the
`par()` function which can take 3 values: 0 (default), 1 or 2. Let’s plot
and see the differences:

``` r
par(mfrow = c(1,3), las = 0)
plot(vec, main = 'las = 0 (default)')
par(las = 1)
plot(vec, main = 'las=1')
par(las = 2)
plot(vec, main = 'las=2')
```

<img src="/post/2017/trick_or_tips002_files/figure-html/las-1.svg" width="960" style="display: block; margin: auto;" />

So, I personally prefer and use `las=1`\!

<br>

**That’s all for number 2 of this series, see you for the next tips\!**

<div style="padding: 2rem 0rem 2rem 0rem;">

<details>

<summary>Session info <i class="fa fa-cogs" aria-hidden="true"></i></summary>

``` r
sessionInfo()
#R>  R version 4.2.2 Patched (2022-11-10 r83330)
#R>  Platform: x86_64-pc-linux-gnu (64-bit)
#R>  Running under: Ubuntu 22.04.1 LTS
#R>  
#R>  Matrix products: default
#R>  BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3
#R>  LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.20.so
#R>  
#R>  locale:
#R>   [1] LC_CTYPE=en_CA.UTF-8       LC_NUMERIC=C              
#R>   [3] LC_TIME=en_CA.UTF-8        LC_COLLATE=en_CA.UTF-8    
#R>   [5] LC_MONETARY=en_CA.UTF-8    LC_MESSAGES=en_CA.UTF-8   
#R>   [7] LC_PAPER=en_CA.UTF-8       LC_NAME=C                 
#R>   [9] LC_ADDRESS=C               LC_TELEPHONE=C            
#R>  [11] LC_MEASUREMENT=en_CA.UTF-8 LC_IDENTIFICATION=C       
#R>  
#R>  attached base packages:
#R>  [1] stats     graphics  grDevices utils     datasets  methods   base     
#R>  
#R>  other attached packages:
#R>  [1] raster_3.6-14          sp_1.6-0               magrittr_2.0.3        
#R>  [4] inSilecoRef_0.0.1.9000
#R>  
#R>  loaded via a namespace (and not attached):
#R>   [1] Rcpp_1.0.10       svglite_2.1.1     lubridate_1.8.0   lattice_0.20-45  
#R>   [5] ps_1.7.2          digest_0.6.31     utf8_1.2.3        mime_0.12        
#R>   [9] R6_2.5.1          plyr_1.8.8        backports_1.4.1   evaluate_0.19    
#R>  [13] highr_0.10        httr_1.4.4        blogdown_1.16     pillar_1.8.1     
#R>  [17] rlang_1.0.6       curl_5.0.0        data.table_1.14.6 miniUI_0.1.1.1   
#R>  [21] callr_3.7.3       jquerylib_0.1.4   DT_0.26           rmarkdown_2.19   
#R>  [25] RefManageR_1.3.0  rcrossref_1.2.0   stringr_1.5.0     htmlwidgets_1.6.1
#R>  [29] igraph_1.3.5      shiny_1.7.4       compiler_4.2.2    httpuv_1.6.8     
#R>  [33] xfun_0.36         systemfonts_1.0.4 pkgconfig_2.0.3   htmltools_0.5.4  
#R>  [37] tidyselect_1.2.0  tibble_3.1.8      httpcode_0.3.0    bookdown_0.32    
#R>  [41] codetools_0.2-19  fansi_1.0.4       dplyr_1.1.0       withr_2.5.0      
#R>  [45] later_1.3.0       crul_1.3          grid_4.2.2        jsonlite_1.8.4   
#R>  [49] xtable_1.8-4      lifecycle_1.0.3   cli_3.5.0         stringi_1.7.8    
#R>  [53] cachem_1.0.6      promises_1.2.0.1  xml2_1.3.3        bslib_0.4.2      
#R>  [57] ellipsis_0.3.2    targets_0.14.2    generics_0.1.3    vctrs_0.5.2      
#R>  [61] tools_4.2.2       glue_1.6.2        processx_3.8.0    fastmap_1.1.0    
#R>  [65] yaml_2.3.6        terra_1.7-3       base64url_1.4     knitr_1.41       
#R>  [69] sass_0.4.5
```

</details>

</div>
