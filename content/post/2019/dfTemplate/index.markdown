---
title: "Creating empty data frames with dfTemplate() and dfTemplateMatch()"
author: [kevin]
reviewer: [azenor, marieh]
date: 2019-02-03
tags: [R, data frame, data frames generation, row binding]
rpkgs: [inSilecoMisc]
rbloggers: true
estime: 8
tweet: "Creating empty data frames with columns of different classes"
output:
  rmarkdown::html_page:
    toc: true
    fig_width: 3
    dev: svglite
---



Creating a data frame is fairly simple but when you need to [create a large empty data frame with columns that have different classes](https://stackoverflow.com/questions/10689055/create-an-empty-data-frame) it takes several command lines. A few days ago, I decided to write a function to simplify this operation and I came to realize that such a function would actually be very useful to ease the row binding of data frames whose column names partially match. How so? This post is meant to answer this question!


## inSilecoMisc

First of all, the functions I am using in this post are available in  [inSilecoMisc](http://insileco.github.io/inSilecoMisc/) which is an R package where we gathered the miscellaneous functions we wrote and deem worth sharing on GitHub. So the first step to reproduce the examples below is to install `inSilecoMisc` which is straightforward with the [devtools](https://cran.r-project.org/web/packages/devtools/index.html package) :

```r
library(devtools)
install_github("inSileco/inSilecoMisc")
```

Then, load it:


```r
library(inSilecoMisc)
```

In this post, I'll exemplify how to use `dfTemplate()` and `dfTemplateMatch()` but if you are interested in other functions in the packages, [check out the tour vignette](http://insileco.github.io/inSilecoMisc/articles/overview.html).



## Generating empty data frames efficiently

Let's start with `dfTemplate()` that creates a data frame with a specific number of columns.


```r
df1 <- dfTemplate(cols = 2)
df1
#R>    Var1 Var2
#R>  1   NA   NA
class(df1)
#R>  [1] "data.frame"
```

By default, the data frame created has only 1 row and the columns are filled out with `NA`. This can readily be changed using arguments `nrows` and `fill`.



```r
df2 <- dfTemplate(2, nrows = 4, fill = 0)
df2
#R>    Var1 Var2
#R>  1    0    0
#R>  2    0    0
#R>  3    0    0
#R>  4    0    0
df3 <- dfTemplate(cols = 2, nrows = 3, fill = "")
df3
#R>    Var1 Var2
#R>  1          
#R>  2          
#R>  3
```

Columns classes are determined by `fill`:


```r
class(df1[, 1])
class(df2[, 1])
class(df3[, 1])
#R>  [1] "logical"
#R>  [1] "numeric"
#R>  [1] "character"
```

And `col_classes` is used to changed these classes:


```r
df4 <- dfTemplate(cols = 2, col_classes = "character")
class(df4[, 1])
class(df4[, 2])
#R>  [1] "character"
#R>  [1] "character"
```

Arguments `fill` and `col_classes` can be vectors that specify content and class
for every columns:


```r
df5 <- dfTemplate(2, 5, col_classes = c("character", "numeric"), fill = c("", 5))
df5
class(df5[, 1])
class(df5[, 2])
#R>    Var1 Var2
#R>  1         5
#R>  2         5
#R>  3         5
#R>  4         5
#R>  5         5
#R>  [1] "character"
#R>  [1] "numeric"
```

Another useful feature of `dfTemplate()` is that column names of the data frame to be created can be passed as first argument (`cols`) :


```r
df5 <- dfTemplate(c("category", "value"))
```

So, now you are able to create custom data frames with a set of column names!


```r
nms <- LETTERS[1:10]
df6 <- dfTemplate(nms, 10, fill = tolower(nms))
df6
#R>     A B C D E F G H I J
#R>  1  a b c d e f g h i j
#R>  2  a b c d e f g h i j
#R>  3  a b c d e f g h i j
#R>  4  a b c d e f g h i j
#R>  5  a b c d e f g h i j
#R>  6  a b c d e f g h i j
#R>  7  a b c d e f g h i j
#R>  8  a b c d e f g h i j
#R>  9  a b c d e f g h i j
#R>  10 a b c d e f g h i j
```



## How to *flexibly* `rbind` a list of data frames

Sometimes we need to `rbind` data frames that do not have all the columns the final data frame must contain. In such case, we first need to append the missing columns because otherwise the default `rbind` function won't work. Another solution is to use a package that has a function that do so. For instance, [`rbind.fill()` from the `plyr` package](https://www.rdocumentation.org/packages/plyr/versions/1.8.4/topics/rbind.fill) allows to perform such *flexible* `rbind`. Also, the package [data.table](https://cran.r-project.org/web/packages/data.table/index.html) includes a `rbind()` method for `data.table` objects that handles such situation (see [this answer on <i class="fa fa-stack-overflow" aria-hidden="true"></i>](https://stackoverflow.com/questions/18003717/efficient-way-to-rbind-data-frames-with-different-columns)). In this last section, I would like to show how to `rbind` data frames flexibly with `dfTemplateMatch()` that is written in base R.

Let me first introduces `dfTemplateMatch()`. This function takes a data frame as the first argument (`x`) and the second argument (`y`) could be another data frame or a vector of character strings. Based on `x` and `y`, `dfTemplateMatch()` creates a data frame that has the same number of rows as `x` and add columns for all names found in `y` that are not found in `x`. Before calling `dfTemplateMatch()` I create two data frames :



```r
df7 <- df6[1:5, 1:4]
df7
#R>    A B C D
#R>  1 a b c d
#R>  2 a b c d
#R>  3 a b c d
#R>  4 a b c d
#R>  5 a b c d
df8 <- df6[4:6]
df8
#R>     D E F
#R>  1  d e f
#R>  2  d e f
#R>  3  d e f
#R>  4  d e f
#R>  5  d e f
#R>  6  d e f
#R>  7  d e f
#R>  8  d e f
#R>  9  d e f
#R>  10 d e f
```

Now I use `dfTemplateMatch()` to create a third data frame based on two other:


```r
dfTemplateMatch(df7, df8)
#R>    A B C D  E  F
#R>  1 a b c d NA NA
#R>  2 a b c d NA NA
#R>  3 a b c d NA NA
#R>  4 a b c d NA NA
#R>  5 a b c d NA NA
```

As expected, the output has 5 rows as `df6` and columns that are not in `df6` but in `df7` has been appended to `df6`. It is possible to use arguments `fill` and `col_classes` to custom the columns added.



```r
dfTemplateMatch(df7, df8, fill = 1, col_classes = "numeric")
#R>    A B C D E F
#R>  1 a b c d 1 1
#R>  2 a b c d 1 1
#R>  3 a b c d 1 1
#R>  4 a b c d 1 1
#R>  5 a b c d 1 1
```

And there is an argument `yonly` that allows the user to keep only names of `y` (when `yonly = TRUE`).


```r
dfTemplateMatch(df7, df8, yonly = TRUE, fill = 1, col_classes = "numeric")
#R>    D E F
#R>  1 d 1 1
#R>  2 d 1 1
#R>  3 d 1 1
#R>  4 d 1 1
#R>  5 d 1 1
```

Now let me show you how to `rbind()` a specific subset of columns of a list of data frame that may or may not have these columns. Let me start by creating a list of data frames.



```r
lsdf <- apply(
  replicate(5, sample(nms, 5)),
  2,
  function(x) dfTemplate(x, nrows = 5, fill = tolower(x))
)
lsdf
#R>  [[1]]
#R>    D G A E B
#R>  1 d g a e b
#R>  2 d g a e b
#R>  3 d g a e b
#R>  4 d g a e b
#R>  5 d g a e b
#R>  
#R>  [[2]]
#R>    E I A F C
#R>  1 e i a f c
#R>  2 e i a f c
#R>  3 e i a f c
#R>  4 e i a f c
#R>  5 e i a f c
#R>  
#R>  [[3]]
#R>    I C E G H
#R>  1 i c e g h
#R>  2 i c e g h
#R>  3 i c e g h
#R>  4 i c e g h
#R>  5 i c e g h
#R>  
#R>  [[4]]
#R>    H F D J A
#R>  1 h f d j a
#R>  2 h f d j a
#R>  3 h f d j a
#R>  4 h f d j a
#R>  5 h f d j a
#R>  
#R>  [[5]]
#R>    F B J D H
#R>  1 f b j d h
#R>  2 f b j d h
#R>  3 f b j d h
#R>  4 f b j d h
#R>  5 f b j d h
```

So the goal here is to create a data frame that contains only the five first
columns, i.e. A, B, C, D, E, the remaining columns must be discarded and
when one selected column is missing, it must be added (filled out with `NA`).
To do so, I simply need to call `dfTemplateMatch()`:



```r
lsdf2 <- lapply(lsdf, dfTemplateMatch, LETTERS[1:5], yonly = TRUE)
lsdf2
#R>  [[1]]
#R>    D A E B  C
#R>  1 d a e b NA
#R>  2 d a e b NA
#R>  3 d a e b NA
#R>  4 d a e b NA
#R>  5 d a e b NA
#R>  
#R>  [[2]]
#R>    E A C  B  D
#R>  1 e a c NA NA
#R>  2 e a c NA NA
#R>  3 e a c NA NA
#R>  4 e a c NA NA
#R>  5 e a c NA NA
#R>  
#R>  [[3]]
#R>    C E  A  B  D
#R>  1 c e NA NA NA
#R>  2 c e NA NA NA
#R>  3 c e NA NA NA
#R>  4 c e NA NA NA
#R>  5 c e NA NA NA
#R>  
#R>  [[4]]
#R>    D A  B  C  E
#R>  1 d a NA NA NA
#R>  2 d a NA NA NA
#R>  3 d a NA NA NA
#R>  4 d a NA NA NA
#R>  5 d a NA NA NA
#R>  
#R>  [[5]]
#R>    B D  A  C  E
#R>  1 b d NA NA NA
#R>  2 b d NA NA NA
#R>  3 b d NA NA NA
#R>  4 b d NA NA NA
#R>  5 b d NA NA NA
```

And now I can seamlessly `rbind()` the list `lsdf2`!


```r
do.call(rbind, lsdf2)
#R>        D    A    E    B    C
#R>  1     d    a    e    b <NA>
#R>  2     d    a    e    b <NA>
#R>  3     d    a    e    b <NA>
#R>  4     d    a    e    b <NA>
#R>  5     d    a    e    b <NA>
#R>  6  <NA>    a    e <NA>    c
#R>  7  <NA>    a    e <NA>    c
#R>  8  <NA>    a    e <NA>    c
#R>  9  <NA>    a    e <NA>    c
#R>  10 <NA>    a    e <NA>    c
#R>  11 <NA> <NA>    e <NA>    c
#R>  12 <NA> <NA>    e <NA>    c
#R>  13 <NA> <NA>    e <NA>    c
#R>  14 <NA> <NA>    e <NA>    c
#R>  15 <NA> <NA>    e <NA>    c
#R>  16    d    a <NA> <NA> <NA>
#R>  17    d    a <NA> <NA> <NA>
#R>  18    d    a <NA> <NA> <NA>
#R>  19    d    a <NA> <NA> <NA>
#R>  20    d    a <NA> <NA> <NA>
#R>  21    d <NA> <NA>    b <NA>
#R>  22    d <NA> <NA>    b <NA>
#R>  23    d <NA> <NA>    b <NA>
#R>  24    d <NA> <NA>    b <NA>
#R>  25    d <NA> <NA>    b <NA>
```


#### Voilà! This is what I call a *flexible* `rbind`! I hope you'll find this helpful! :boom:







<div style="padding: 2rem 0rem 2rem 0rem;">
<details>
<summary>Session info <i class="fa fa-cogs" aria-hidden="true"></i></summary>

```r
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
#R>  [1] inSilecoMisc_0.7.0.9000 inSilecoRef_0.0.1.9000 
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
#R>  [53] RefManageR_1.3.0  crul_1.3          crayon_1.5.2      pkgconfig_2.0.3  
#R>  [57] ellipsis_0.3.2    data.table_1.14.6 xml2_1.3.3        lubridate_1.8.0  
#R>  [61] rmarkdown_2.19    httr_1.4.4        R6_2.5.1          igraph_1.3.5     
#R>  [65] compiler_4.2.2
```
</details>
</div>
