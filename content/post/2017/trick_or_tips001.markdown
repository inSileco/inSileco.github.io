---
title: Trick or tips 001 {R}
author: [kevin]
date: 2017-06-30
tags: [R, tips, trickortips]
rpkgs: [base, utils, graphics]
tweet: First post of the Trick or tips series
estime: 6
draft: false
output:
  rmarkdown::html_page:
    fig_width: 3
    dev: svglite
edits:
  - date: 2022-04-23
    comment: "Beautify code source and add session info section."
---

{{< trickortips >}}

## *Trick or tips* 0001

For the first post of the series, let’s introduce 5 **R** tips:

1.  The %in% operator
2.  The `paste0()` function
3.  Using “\\r” in `cat()`
4.  The `sprintf()` function
5.  The `xaxs` and `yaxs` arguments of `par()`

## The ‘%in%’ operator

I have known this for a while, but I keep remembering how it eases my pain when I
learned how to use it. Let’s consider two vector `vecA` and `vecB`, the
`vecA %in% vecB` returns a vector of logical of the length `vecA` stating whether
the elements of `vecA` are in `vecB`:

``` r
vecA <- c("a", "d", "2", "4", "e", ";")
vecB <- letters # vector of lower case letters the Roman alphabet
vecA %in% vecB
#R>  [1]  TRUE  TRUE FALSE FALSE  TRUE FALSE
```

the i<sup>th</sup> element of the output vector is `TRUE` if the i<sup>th</sup> element of `vecA` is
among the elements of `vecB`. Note that you can have a similar result calling the `intersect()` functions which returns elements that `vecA` and `vecB` are sharing.

``` r
intersect(vecA, vecB)
#R>  [1] "a" "d" "e"
```

By the way, you should have a look to the documentation of `intersect()`.

## The `paste0()` function

I often concatenate strings. The natural way to do this is to use the `paste()` function. Let’s say I need to create a set of original file names such as: “myfile1”, “myfile2”, “myfile3”, etc. I can call `paste()` like so:

``` r
paste("myfile", 1:7)
#R>  [1] "myfile 1" "myfile 2" "myfile 3" "myfile 4" "myfile 5" "myfile 6" "myfile 7"
```

BUT, there is a annoying space between “myfile” and the number, to remove the
space, `sep` argument is needed:

``` r
paste("myfile", 1:3, sep = "")
#R>  [1] "myfile1" "myfile2" "myfile3"
```

UNLESS you use the `paste0()` that is the version of `paste()` with the desired
default parameters:

``` r
paste0("myfile", 1:3)
#R>  [1] "myfile1" "myfile2" "myfile3"
```

I know… this means you’ll save 5 previous characters each time you call `paste0()`\!

## Using argument ‘\\r’ in `cat()`

*Note that for this tip, you should execute the code-chunk in your own R console*

When programming we often need to monitor what we are doing, especially for
time-consuming calculation. Using `cat()` with all its default is very helpful
to report information on progress:

``` r
for (i in 1:10) {
  cat("iteration n°", i, "\n")
}
```

Here `"\n"` is what breaks the line\! Instead of breaking the line, we can erase
the line, i.e. using `"\r"`:

``` r
for (i in 1:10) {
  Sys.sleep(.25) # I added a pause so you can see what's happening
  cat("iteration n°", i, "\r")
}
```

I hope this gives you some ideas :). If you are thinking “where the *\!&)@(* is
he going with this\!” let me give you two extra way to monitor a for loop:

1.  Use percentage:

<!-- end list -->

``` r
nmx <- 222
for (i in 1:nmx) {
  Sys.sleep(.01) # replace it by what you are doing
  cat("==>", format(100*i/nmx, digits = 4), "%", "\r")
}
```

2.  Create you own progress bar:

<!-- end list -->

``` r
nmx <- 222
sz <- 60
for (i in 1:nmx) {
  Sys.sleep(.01) # replace it by what you are doing
  nb <- floor(sz * i / nmx)
  pgr <- paste(rep(c("="," "), c(nb, sz - nb)), collapse = "")
  cat("|", pgr, "| ", "\r")
}
```

I hope you like this\! Otherwise, stick to use `getTxtProgressBar()` and `setProgressBar()` functions, but I swear you are missing something.

## The `sprintf()` function

The function is a wrapper for a well-known C function `sprintf()`. There are
so much to say about it and I won’t (so please have a careful look at the
documentation) but I think it is worth a tip to present the most used features
of this function.

The first argument of `sprintf()` is a string that includes tag to be replaced
by the extra arguments. A tag starts with a `%`, is followed by a
couple of optional characters tuning the display and ends with a letter
specifying the nature of the variable(s) to be displayed (number or string). The
most common letters are:

  - “d” for integer value;
  - “f” for double precision value;
  - “s” for strings.

The most common options are:

  - “n”, an integer values specifying the width of the field;
  - “0” indicates whether zero-padding should be used;
  - “.m” where n is an integer.

That being said, to be as clear as possible, let me exemplify\!

1.  Different kind of variables:

<!-- end list -->

``` r
sprintf("%d", 1)
sprintf("%f", pi)
sprintf("%s", "A")
#R>  [1] "1"
#R>  [1] "3.141593"
#R>  [1] "A"
```

2.  Combine different variables:

<!-- end list -->

``` r
sprintf("An integer: %d, a double: %f, a string: %s", 1, pi, "A")
#R>  [1] "An integer: 1, a double: 3.141593, a string: A"
```

3.  Tune the field width:

<!-- end list -->

``` r
sprintf("%10f", pi)
#R>  [1] "  3.141593"
```

4.  Zero-padding:

<!-- end list -->

``` r
sprintf("%010f", pi)
#R>  [1] "003.141593"
```

5.  Tune the precision:

<!-- end list -->

``` r
sprintf("%.50f", pi)
#R>  [1] "3.14159265358979311599796346854418516159057617187500"
```

Pretty cool, isn’t it? To conclude two questions. Question 1: do you remember the file naming example using to showcase `paste0()`? I assume your answer if yes. Let’s say you now have more than 100 files to name and you want to use zero-padding and a constant field width of 3 (e.g. “myfile001”, “myfile010”, “myfile100”). This leads
me to question 2: what do you do? =\> Go `sprintf()`\!

``` r
paste0("myfile", sprintf("%03d", c(1, 10, 100)))
#R>  [1] "myfile001" "myfile010" "myfile100"
```

## The `xaxs` and `yaxs` arguments of `par()`

This is also something I learned years ago and keep using for almost all my
plots ever since. Default values of graphical parameters generate plot that
add and extra 4% to the axes limits. This is actually useful to ensure that
all graphical symbols are entirely displayed. However, I prefer using round
values as axes limits and handling myself their values so that all symbols stay visible. In order to get rid of the extra 4% added on the x-axis (y-axis), you
have to pass `xaxs = "i"` (`yaxs = "i"`) to the `par()` function. I compare below
a plot using the default parameters’ values and the same plot using the tip:

``` r
par(mfrow = c(1,2), bty = "l")
plot(0:10, 0:10, pch = 20)
par(xaxs = "i", yaxs = "i")
plot(0:10, 0:10, pch = 20)
```

<img src="/post/2017/trick_or_tips001_files/figure-html/xaxsYaxs-1.png" width="912" style="display: block; margin: auto;" />

Can you tell the difference? I now add two extra lines to stress the differences out.

``` r
par(mfrow = c(1,2), bty = "l")
plot(0:10, 0:10, pch = 20)
abline(v = c(0,10), h = c(0,10), col = 2)
par(xaxs = "i", yaxs = "i")
plot(0:10, 0:10, pch = 20)
abline(v = c(0,10), h = c(0,10), col = 2)
```

<img src="/post/2017/trick_or_tips001_files/figure-html/xaxsYaxsV2-1.png" width="912" style="display: block; margin: auto;" />

**That’s all folks… until next time\!**

<div style="padding: 2rem 0rem 2rem 0rem;">

<details>

<summary>Session info <i class="fas fa-cogs" aria-hidden="true"></i></summary>

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
#R>  [1] inSilecoRef_0.0.1.9000
#R>  
#R>  loaded via a namespace (and not attached):
#R>   [1] bslib_0.4.2       tidyselect_1.2.0  xfun_0.36         vctrs_0.5.2      
#R>   [5] generics_0.1.3    miniUI_0.1.1.1    htmltools_0.5.4   yaml_2.3.6       
#R>   [9] utf8_1.2.3        rlang_1.0.6       jquerylib_0.1.4   pillar_1.8.1     
#R>  [13] later_1.3.0       glue_1.6.2        httpcode_0.3.0    withr_2.5.0      
#R>  [17] lifecycle_1.0.3   plyr_1.8.8        stringr_1.5.0     targets_0.14.2   
#R>  [21] blogdown_1.16     htmlwidgets_1.6.1 evaluate_0.19     codetools_0.2-19 
#R>  [25] knitr_1.41        callr_3.7.3       fastmap_1.1.0     httpuv_1.6.8     
#R>  [29] ps_1.7.2          curl_5.0.0        fansi_1.0.4       highr_0.10       
#R>  [33] Rcpp_1.0.10       xtable_1.8-4      backports_1.4.1   promises_1.2.0.1 
#R>  [37] DT_0.26           cachem_1.0.6      jsonlite_1.8.4    rcrossref_1.2.0  
#R>  [41] mime_0.12         digest_0.6.31     stringi_1.7.8     bookdown_0.32    
#R>  [45] processx_3.8.0    dplyr_1.1.0       shiny_1.7.4       cli_3.5.0        
#R>  [49] tools_4.2.2       sass_0.4.5        magrittr_2.0.3    base64url_1.4    
#R>  [53] tibble_3.1.8      RefManageR_1.3.0  crul_1.3          pkgconfig_2.0.3  
#R>  [57] ellipsis_0.3.2    data.table_1.14.6 xml2_1.3.3        lubridate_1.8.0  
#R>  [61] rmarkdown_2.19    httr_1.4.4        R6_2.5.1          igraph_1.3.5     
#R>  [65] compiler_4.2.2
```

</details>

</div>
