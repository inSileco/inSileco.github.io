---
title: Trick or Tips 005 {R}
author: [kevin]
date: 2023-02-04
tags: [R, tips, trickortips]
rpkgs: [base, utils, graphics]
tweet: "Post #5 of the 'Trick or Tips' series"
draft: true
estime: 5
output:
  blogdown::html_page:
    dev: svglite
---

{{< trickortips >}}

<br>

This time I will comment a few object that could be very helpful.

## `.Platform`

No mystery once you know is there `?.Platform`

> ‘.Platform’ is a list with some details of the platform under
> which R was built. This provides means to write OS-portable R
> code.

``` r
.Platform
#R>  $OS.type
#R>  [1] "unix"
#R>  
#R>  $file.sep
#R>  [1] "/"
#R>  
#R>  $dynlib.ext
#R>  [1] ".so"
#R>  
#R>  $GUI
#R>  [1] "X11"
#R>  
#R>  $endian
#R>  [1] "little"
#R>  
#R>  $pkgType
#R>  [1] "source"
#R>  
#R>  $path.sep
#R>  [1] ":"
#R>  
#R>  $r_arch
#R>  [1] ""
```

All the terms are explained in the help. I just, may be the $file.sep, super useful. I have seen people doing

``` r
paste("here", "myfile.txt", sep = "/")
#R>  [1] "here/myfile.txt"
```

Of course it will work on many case, , and even better `file.path()` that was built for it. With `.Platform` there is a simple way to make this portable:

``` r
paste("here", "myfile.txt", sep = .Platform$file.sep)
#R>  [1] "here/myfile.txt"
```

Of course, I would advise to use a function that was build for this or you can simply use the join `file.path()` too. And it actually use `.Platform$sfile.sep`

``` r
file.path
#R>  function (..., fsep = .Platform$file.sep) 
#R>  .Internal(file.path(list(...), fsep))
#R>  <bytecode: 0x55ba082066b8>
#R>  <environment: namespace:base>
```

## `.Machine`

> ‘.Machine’ is a variable holding information on the numerical
> characteristics of the machine R is running on, such as the
> largest double or integer and the machine’s precision.

``` r
.Machine
#R>  $double.eps
#R>  [1] 2.220446e-16
#R>  
#R>  $double.neg.eps
#R>  [1] 1.110223e-16
#R>  
#R>  $double.xmin
#R>  [1] 2.225074e-308
#R>  
#R>  $double.xmax
#R>  [1] 1.797693e+308
#R>  
#R>  $double.base
#R>  [1] 2
#R>  
#R>  $double.digits
#R>  [1] 53
#R>  
#R>  $double.rounding
#R>  [1] 5
#R>  
#R>  $double.guard
#R>  [1] 0
#R>  
#R>  $double.ulp.digits
#R>  [1] -52
#R>  
#R>  $double.neg.ulp.digits
#R>  [1] -53
#R>  
#R>  $double.exponent
#R>  [1] 11
#R>  
#R>  $double.min.exp
#R>  [1] -1022
#R>  
#R>  $double.max.exp
#R>  [1] 1024
#R>  
#R>  $integer.max
#R>  [1] 2147483647
#R>  
#R>  $sizeof.long
#R>  [1] 8
#R>  
#R>  $sizeof.longlong
#R>  [1] 8
#R>  
#R>  $sizeof.longdouble
#R>  [1] 16
#R>  
#R>  $sizeof.pointer
#R>  [1] 8
#R>  
#R>  $sizeof.time_t
#R>  [1] 8
#R>  
#R>  $longdouble.eps
#R>  [1] 1.084202e-19
#R>  
#R>  $longdouble.neg.eps
#R>  [1] 5.421011e-20
#R>  
#R>  $longdouble.digits
#R>  [1] 64
#R>  
#R>  $longdouble.rounding
#R>  [1] 5
#R>  
#R>  $longdouble.guard
#R>  [1] 0
#R>  
#R>  $longdouble.ulp.digits
#R>  [1] -63
#R>  
#R>  $longdouble.neg.ulp.digits
#R>  [1] -64
#R>  
#R>  $longdouble.exponent
#R>  [1] 15
#R>  
#R>  $longdouble.min.exp
#R>  [1] -16382
#R>  
#R>  $longdouble.max.exp
#R>  [1] 16384
```

## `.leap.seconds`

https://en.wikipedia.org/wiki/Leap\_second

``` r
.leap.seconds
#R>   [1] "1972-07-01 GMT" "1973-01-01 GMT" "1974-01-01 GMT" "1975-01-01 GMT"
#R>   [5] "1976-01-01 GMT" "1977-01-01 GMT" "1978-01-01 GMT" "1979-01-01 GMT"
#R>   [9] "1980-01-01 GMT" "1981-07-01 GMT" "1982-07-01 GMT" "1983-07-01 GMT"
#R>  [13] "1985-07-01 GMT" "1988-01-01 GMT" "1990-01-01 GMT" "1991-01-01 GMT"
#R>  [17] "1992-07-01 GMT" "1993-07-01 GMT" "1994-07-01 GMT" "1996-01-01 GMT"
#R>  [21] "1997-07-01 GMT" "1999-01-01 GMT" "2006-01-01 GMT" "2009-01-01 GMT"
#R>  [25] "2012-07-01 GMT" "2015-07-01 GMT" "2017-01-01 GMT"
```

## `.Library.site`

``` r
.Library.site
#R>  [1] "/usr/local/lib/R/site-library/" "/usr/local/lib/R/site-library/"
#R>  [3] "/usr/lib/R/site-library"        "/usr/lib/R/library"            
#R>  [5] "/usr/lib/R/library"
```

## `Last.value`

``` r
cool <- 12
cool
#R>  [1] 12
```

I do have to redo the calcul

> The value of the internal evaluation of a top-level R expression
> is always assigned to ‘.Last.value’ (in ‘package:base’) before
> further processing (e.g., printing).

``` r
.Last.value
#R>  [1] "/home/kc/git/inSilecoBlog/inSileco.github.io/static/Rscript/sessionInfo.Rmd"
```

`ans` in other programming languages (e.g. [Julia](https://julialang.org/))

### See you next post post\!

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
#R>  [29] ps_1.7.2          curl_5.0.0        fansi_1.0.4       Rcpp_1.0.10      
#R>  [33] xtable_1.8-4      backports_1.4.1   promises_1.2.0.1  DT_0.26          
#R>  [37] cachem_1.0.6      jsonlite_1.8.4    rcrossref_1.2.0   mime_0.12        
#R>  [41] digest_0.6.31     stringi_1.7.8     bookdown_0.32     processx_3.8.0   
#R>  [45] dplyr_1.1.0       shiny_1.7.4       cli_3.5.0         tools_4.2.2      
#R>  [49] sass_0.4.5        magrittr_2.0.3    base64url_1.4     tibble_3.1.8     
#R>  [53] RefManageR_1.3.0  crul_1.3          pkgconfig_2.0.3   ellipsis_0.3.2   
#R>  [57] data.table_1.14.6 xml2_1.3.3        lubridate_1.8.0   rmarkdown_2.19   
#R>  [61] httr_1.4.4        R6_2.5.1          igraph_1.3.5      compiler_4.2.2
```

</details>

</div>
