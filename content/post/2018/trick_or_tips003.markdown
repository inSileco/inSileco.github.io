---
title: Trick or Tips 003 {R}
author: [kevin, david]
date: 2018-02-11
tags: [R, tips, trickortips]
rpkgs: [base, utils, graphics]
tweet: Third post of the 'Trick or Tips' series
draft: false
estime: 8
output:
  blogdown::html_page:
    dev: svglite
edits:
  - date: 2022-04-26
    comment: "Beautify code source and add session info section."
---

{{< trickortips >}}

<br>

## The `apropos()` function

A powerful way to look for a function you can barely remember the name of
directly in R, *i.e* without googling\!

``` r
apropos('Sys')
#R>   [1] ".First.sys"       ".sys.timezone"    "R_system_version" "sys.call"        
#R>   [5] "sys.calls"        "Sys.chmod"        "Sys.Date"         "sys.frame"       
#R>   [9] "sys.frames"       "sys.function"     "Sys.getenv"       "Sys.getlocale"   
#R>  [13] "Sys.getpid"       "Sys.glob"         "Sys.info"         "sys.load.image"  
#R>  [17] "Sys.localeconv"   "sys.nframe"       "sys.on.exit"      "sys.parent"      
#R>  [21] "sys.parents"      "Sys.readlink"     "sys.save.image"   "Sys.setenv"      
#R>  [25] "Sys.setFileTime"  "Sys.setLanguage"  "Sys.setlocale"    "Sys.sleep"       
#R>  [29] "sys.source"       "sys.status"       "Sys.time"         "Sys.timezone"    
#R>  [33] "Sys.umask"        "Sys.unsetenv"     "Sys.which"        "system"          
#R>  [37] "system.file"      "system.time"      "system2"
```

You can also take advantage of regular expressions to narrow down you research:

``` r
apropos('^Sys')
#R>   [1] "sys.call"        "sys.calls"       "Sys.chmod"       "Sys.Date"       
#R>   [5] "sys.frame"       "sys.frames"      "sys.function"    "Sys.getenv"     
#R>   [9] "Sys.getlocale"   "Sys.getpid"      "Sys.glob"        "Sys.info"       
#R>  [13] "sys.load.image"  "Sys.localeconv"  "sys.nframe"      "sys.on.exit"    
#R>  [17] "sys.parent"      "sys.parents"     "Sys.readlink"    "sys.save.image" 
#R>  [21] "Sys.setenv"      "Sys.setFileTime" "Sys.setLanguage" "Sys.setlocale"  
#R>  [25] "Sys.sleep"       "sys.source"      "sys.status"      "Sys.time"       
#R>  [29] "Sys.timezone"    "Sys.umask"       "Sys.unsetenv"    "Sys.which"      
#R>  [33] "system"          "system.file"     "system.time"     "system2"
```

Or even better:

``` r
apropos('^Sys.*time$', ignore.case = FALSE)
#R>  [1] "Sys.time"
```

<br>

## The `table()` function

Oftentimes we wish to extract the frequency of certain elements in a dataset.
There is a very useful function that allows us to achieve this quite efficiently:
`table()`. Let’s see how this works:

``` r
df <- data.frame(data = sample(1:5, 20, replace = TRUE))
table(df$data)
#R>  
#R>  1 2 3 4 5 
#R>  4 4 3 5 4
```

You can also get the frequency for a data.frame with multiple columns. For example,
if you observed species at a site throughout multiple years and wanted to know
the frequency of observations per species per year:

``` r
df <- data.frame(
  observations = paste0('species', sample(1:5, 50, replace = TRUE)),
  year = sort(sample(2015:2018, 50, replace = TRUE))
)
table(df)
#R>              year
#R>  observations 2015 2016 2017 2018
#R>      species1    1    3    1    2
#R>      species2    1    1    5    1
#R>      species3    7    5    3    2
#R>      species4    0    4    5    2
#R>      species5    3    2    1    1
```

You can actually do so for more than two columns.

``` r
df$atr1 <- rep(c("val1", "val2"), each = 25)
tb <- table(df)
tb
#R>  , , atr1 = val1
#R>  
#R>              year
#R>  observations 2015 2016 2017 2018
#R>      species1    1    3    0    0
#R>      species2    1    0    0    0
#R>      species3    7    5    0    0
#R>      species4    0    3    0    0
#R>      species5    3    2    0    0
#R>  
#R>  , , atr1 = val2
#R>  
#R>              year
#R>  observations 2015 2016 2017 2018
#R>      species1    0    0    1    2
#R>      species2    0    1    5    1
#R>      species3    0    0    3    2
#R>      species4    0    1    5    2
#R>      species5    0    0    1    1
```

As you can see, in such case, you will have to deal with arrays:

``` r
tb[, , 1]
#R>              year
#R>  observations 2015 2016 2017 2018
#R>      species1    1    3    0    0
#R>      species2    1    0    0    0
#R>      species3    7    5    0    0
#R>      species4    0    3    0    0
#R>      species5    3    2    0    0
```

With further development and by combining `table()` with `paste0()` (see
[fish and tips 001](https://insileco.github.io/2017/06/30/trick-or-tips-001-r/)
for an explanation of this useful function\!), you can create your desired data.frame:

``` r
as.data.frame(table(paste0(df$year, '_', df$observations)))
#R>              Var1 Freq
#R>  1  2015_species1    1
#R>  2  2015_species2    1
#R>  3  2015_species3    7
#R>  4  2015_species5    3
#R>  5  2016_species1    3
#R>  6  2016_species2    1
#R>  7  2016_species3    5
#R>  8  2016_species4    4
#R>  9  2016_species5    2
#R>  10 2017_species1    1
#R>  11 2017_species2    5
#R>  12 2017_species3    3
#R>  13 2017_species4    5
#R>  14 2017_species5    1
#R>  15 2018_species1    2
#R>  16 2018_species2    1
#R>  17 2018_species3    2
#R>  18 2018_species4    2
#R>  19 2018_species5    1
```

<br>

## Everything but 0

This is a well-known trick for developers that may be useful for many beginners.
In R when performing a logical test, every numeric is considered as `TRUE` but
`0` (which is `FALSE`):

``` r
0 == FALSE
!0
!1
!7.45
#R>  [1] TRUE
#R>  [1] TRUE
#R>  [1] FALSE
#R>  [1] FALSE
```

This can actually be very helpful, for instance when we are testing whether
or not a vector is empty\!

``` r
vec0 <- 1:7
vec1 <- vec0[vec0 > 5]
vec2 <- vec0[vec0 > 7]
!(length(vec1))
!(length(vec2))
#R>  [1] FALSE
#R>  [1] TRUE
```

<br>

## `expand.grid()` vs.`combn()`

If you often create empty data.frame, you are very likely already familiar
with the `expand.grid()` function:

``` r
expand.grid(LETTERS[1:4], LETTERS[5:6])
#R>    Var1 Var2
#R>  1    A    E
#R>  2    B    E
#R>  3    C    E
#R>  4    D    E
#R>  5    A    F
#R>  6    B    F
#R>  7    C    F
#R>  8    D    F
```

But if you are looking for unique combinations (think about all combinations of
games in a tournament of four team), you may feel that `expand.grid()` is not
what you need:

``` r
expand.grid(LETTERS[1:4], LETTERS[1:4])
#R>     Var1 Var2
#R>  1     A    A
#R>  2     B    A
#R>  3     C    A
#R>  4     D    A
#R>  5     A    B
#R>  6     B    B
#R>  7     C    B
#R>  8     D    B
#R>  9     A    C
#R>  10    B    C
#R>  11    C    C
#R>  12    D    C
#R>  13    A    D
#R>  14    B    D
#R>  15    C    D
#R>  16    D    D
```

In comes `combn`:

``` r
combn(LETTERS[1:5], 2)
#R>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#R>  [1,] "A"  "A"  "A"  "A"  "B"  "B"  "B"  "C"  "C"  "D"  
#R>  [2,] "B"  "C"  "D"  "E"  "C"  "D"  "E"  "D"  "E"  "E"
```

As you can see you need to specify the number of elements in the combination as
`combn` can compute all combination

``` r
combn(LETTERS[1:5], 4)
#R>       [,1] [,2] [,3] [,4] [,5]
#R>  [1,] "A"  "A"  "A"  "A"  "B" 
#R>  [2,] "B"  "B"  "B"  "C"  "C" 
#R>  [3,] "C"  "C"  "D"  "D"  "D" 
#R>  [4,] "D"  "E"  "E"  "E"  "E"
```

Also if you want a data frame, a small extra step is required:

``` r
as.data.frame(t(combn(LETTERS[1:5], 2)))
#R>     V1 V2
#R>  1   A  B
#R>  2   A  C
#R>  3   A  D
#R>  4   A  E
#R>  5   B  C
#R>  6   B  D
#R>  7   B  E
#R>  8   C  D
#R>  9   C  E
#R>  10  D  E
```

<br>

## Writing outside the margins

If you are always thinking outside the box you may want to learn how to plot
something outside the margins\! This is possible using the `xpd` parameter of
the `par()` function.

``` r
par(mfrow = c(1, 2))
plot(c(0, 2), c(0, 2))
lines(c(-1, 3), c(1, 1), lwd = 4)
##
par(xpd = TRUE)
plot(c(0, 2), c(0, 2))
lines(c(-1, 3), c(1, 1), lwd = 4)
```

<img src="/post/2018/trick_or_tips003_files/figure-html/xpd2-1.svg" width="672" style="display: block; margin: auto;" />

<br>

### See you next post post\!

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
#R>  [41] systemfonts_1.0.4 mime_0.12         digest_0.6.31     stringi_1.7.8    
#R>  [45] bookdown_0.32     processx_3.8.0    dplyr_1.1.0       shiny_1.7.4      
#R>  [49] cli_3.5.0         tools_4.2.2       sass_0.4.5        magrittr_2.0.3   
#R>  [53] base64url_1.4     tibble_3.1.8      RefManageR_1.3.0  crul_1.3         
#R>  [57] pkgconfig_2.0.3   ellipsis_0.3.2    data.table_1.14.6 xml2_1.3.3       
#R>  [61] lubridate_1.8.0   svglite_2.1.1     rmarkdown_2.19    httr_1.4.4       
#R>  [65] R6_2.5.1          igraph_1.3.5      compiler_4.2.2
```

</details>

</div>
