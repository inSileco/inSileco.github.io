---
title: Trick or tips 004 {R}
author: [kevin]
reviewer: [marieh]
date: 2019-08-13
tags: [R, tips, trickortips]
rpkgs: [base, utils, graphics, microbenchmark]
tweet: "Subset an array with a matrix and 4 more R tips"
estime: 6
output:
  rmarkdown::html_page:
    fig_width: 3
    dev: svglite
---

{{< trickortips >}}

## *Trick or tips* 0004

Today’s menu:

1.  Subset an array with a matrix
2.  `nzchar()`
3.  Do you need to call `return()`?
4.  `invisible()`
5.  `bquote()` and `substitute()`

<br>

## Subset an array with a matrix

Let’s consider two arrays of letters: the first has two dimensions (i.e. a matrix) and the second one has 3.

``` r
(arr2 <- array(LETTERS[1:9], dim = c(3,3)))
#R>       [,1] [,2] [,3]
#R>  [1,] "A"  "D"  "G" 
#R>  [2,] "B"  "E"  "H" 
#R>  [3,] "C"  "F"  "I"
class(arr2)
#R>  [1] "matrix" "array"
(arr3 <- array(LETTERS[1:18], dim = c(3, 3, 2)))
#R>  , , 1
#R>  
#R>       [,1] [,2] [,3]
#R>  [1,] "A"  "D"  "G" 
#R>  [2,] "B"  "E"  "H" 
#R>  [3,] "C"  "F"  "I" 
#R>  
#R>  , , 2
#R>  
#R>       [,1] [,2] [,3]
#R>  [1,] "J"  "M"  "P" 
#R>  [2,] "K"  "N"  "Q" 
#R>  [3,] "L"  "O"  "R"
class(arr3)
#R>  [1] "array"
```

Let’s say, you need to subset a specific set of values based on the position of the elements. To subset a single element, say `"G"`, there are a couple of options, but I guess the most common approach is to use `[` with one value per dimension:

``` r
arr2[1,3]
#R>  [1] "G"
arr3[1,3,1]
#R>  [1] "G"
```

or with a single value giving the position of the element:

``` r
arr2[7]
#R>  [1] "G"
arr3[7]
#R>  [1] "G"
```

Now we consider the case where you have a vector of positions (one value per dimension of the array), in this case, beware the orientation of the vector\!

``` r
# with the line below, we get the 1rst and 3rd elements because we're using a column vector
arr2[c(1,3)]
#R>  [1] "A" "C"
# whereas with a row vector, we obtain the element of the 1rst row and the 3rd column
arr2[t(c(1,3))]
#R>  [1] "G"
```

And for more than one element, you need to use a matrix with one row per element to be subset:

``` r
(mat <- rbind(c(1,3), c(2,2)))
#R>       [,1] [,2]
#R>  [1,]    1    3
#R>  [2,]    2    2
arr2[mat]
#R>  [1] "G" "E"
```

Similarly, with an array of 3 dimensions, the matrix will have three columns and as many row as there are elements:

``` r
# Let us subset `E`,`C` and `O` and `C` (again)
(msub <- rbind(c(2,2,1), c(3, 1, 1), c(3, 2, 2), c(3, 1, 1)))
#R>       [,1] [,2] [,3]
#R>  [1,]    2    2    1
#R>  [2,]    3    1    1
#R>  [3,]    3    2    2
#R>  [4,]    3    1    1
arr3[msub]
#R>  [1] "E" "C" "O" "C"
```

Two additional comments. First, we should always keep in mind that data frames and arrays are different:

``` r
# this gives you the 1rst and 3rd **entire columns**
as.data.frame(arr2)[c(1,3)]
#R>    V1 V3
#R>  1  A  G
#R>  2  B  H
#R>  3  C  I
# this still gives you the element on the 1rst row and the 3rd column
as.data.frame(arr2)[t(c(1,3))]
#R>  [1] "G"
```

Second, if you are a [tidyverse](https://www.tidyverse.org/) user, there is a new article dealing with [subassigment with tibble](https://tibble.tidyverse.org/dev/articles/subassign.html#section) :sunglasses:.

## `nzchar()`

You may already be aware of `nchar()`, a function that returns the number of characters of a given character vector:

``` r
nchar(c("insil", "eco", ""))
#R>  [1] 5 3 0
```

`nzchar()` returns `TRUE` for every character string in the vector that has at least 1 character:

``` r
vec <- c("insil", "eco", "")
nzchar(vec)
#R>  [1]  TRUE  TRUE FALSE
# is there any empty character string in `vec`?
any(nzchar(vec))
#R>  [1] TRUE
```

Interesting, but let’s dig deeper: I can think about no less than 3 ways of writing a equivalent function with one more character:

``` r
nchar(vec) > 0
#R>  [1]  TRUE  TRUE FALSE
!! nchar(vec)
#R>  [1]  TRUE  TRUE FALSE
nchar(vec) & 1
#R>  [1]  TRUE  TRUE FALSE
```

One more character… so why bother? :bulb: It should be a matter of performance\! Let’s check that out with the cool :package: [microbenchmark](https://cran.r-project.org/web/packages/microbenchmark/index.html):

``` r
library(microbenchmark)
microbenchmark(nchar(vec) > 0, !! nchar(vec), nchar(vec) & 1, nzchar(vec),
  times = 1000L)
#R>  Unit: nanoseconds
#R>             expr min  lq    mean median    uq   max neval cld
#R>   nchar(vec) > 0 704 729 835.328  752.0 808.0 27101  1000   b
#R>     !!nchar(vec) 774 802 864.753  818.5 877.0  3949  1000   b
#R>   nchar(vec) & 1 781 807 868.179  831.0 885.5  2179  1000   b
#R>      nzchar(vec)  72  87 104.045   90.0  95.0  1391  1000  a
```

Yep yep\!`nzchar()` is indeed way faster :rocket:\!

## Do you need to use `return()`?

If you have already written your own function, you must have used `return()`
to specify what your function should return. There are programming languages where this instruction is mandatory, not in R\! Check out the documentation `?return`:

> If the end of a function is reached without calling ‘return’, the
> value of the last evaluated expression is returned.

Let me write 2 functions:

``` r
add_v <- function(x, y) {
   x + y
}
add_v2 <- function(x, y) {
   return(x + y)
}
```

`add_v()` and `add_v2()` are equivalent\! So… do we care? Well, you must bear in mind that whenever `return()` is encountered, the evaluation of the set of expressions within the function is stopped and therefore some time can be saved:

``` r
foo <- function(x) {
    out <- 0
    if (x > 3) out <- 3
    if (x > 2) out <- 2
    if (x > 1) out <- 1
    return(out)
}
foo2 <- function(x) {
  out <- 0
  if (x > 3) return(3)
  if (x > 2) return(2)
  if (x > 1) return(1)
  return(out)
}
microbenchmark(foo(4), foo2(4), times = 1e5)
#R>  Unit: nanoseconds
#R>      expr min  lq     mean median  uq      max neval cld
#R>    foo(4) 392 447 718.2958    460 484 14372972 1e+05   b
#R>   foo2(4) 267 302 380.0456    309 325  2345751 1e+05  a
```

## `invisible()`

Let’s keep talking about what functions return. The function `invisible()` allows you to return an invisible copy of an object, meaning that nothing is (apparently) return if not assigned:

``` r
add_v <- function(x, y) {
  x + y
}
##
add_i <- function(x, y) {
  invisible(x + y)
}
add_v(2, 3)
#R>  [1] 5
add_i(2, 3)
res <- add_i(2, 3)
res
#R>  [1] 5
```

But… why? As explained in the documentation (`?invisible`):

> This function can be useful when it is desired to have functions
> return values which can be assigned, but which do not print when
> they are not assigned.

This is indeed helpful when you have a function that creates a plot (and you don’t normally to assign the result) for which you sometimes need to use an object that was created during the evaluation of the function:

``` r
plot_logy <- function(x, y) {
  # create ty
  ty <- log10(y + 1)
  plot(x, ty)
  invisible(ty)
}
plot_logy(0:10, 0:10)
```

<img src="/post/2019/trick_or_tips004_files/figure-html/unnamed-chunk-11-1.png" width="672" style="display: block; margin: auto;" />

``` r
# get ty
ty <- plot_logy(0:10, 0:10)
```

<img src="/post/2019/trick_or_tips004_files/figure-html/unnamed-chunk-12-1.png" width="672" style="display: block; margin: auto;" />

``` r
ty
#R>   [1] 0.0000000 0.3010300 0.4771213 0.6020600 0.6989700 0.7781513 0.8450980
#R>   [8] 0.9030900 0.9542425 1.0000000 1.0413927
```

## `bquote()` and `substitute()`

When using mathematical annotations, we sometimes need to include the value
of a variable. In such case, `bquote()` or `substitute()` are the functions you
would need (rather than `expression()` you may already be familiar with).

If you opt for `bquote()`, then variables to be evaluated must be put in
brackets and preceded by a dot, e.g. `.(var)`. If you choose `substitute()`,
then variables evaluated will be the ones included in the list passed as
argument `env` (which can also be the name of a environment).

Let’s use both functions in to add mathematical expressions in an empty plot:

``` r
delta <- 1.5
plot(c(0,1), c(0,1), type = "n", axes = FALSE, ann = FALSE)
text(0.5, .75, labels = bquote(beta^j == .(delta) + bold("h")), cex = 3)
text(0.5, .25, labels = substitute(alpha[i] == a + delta, env = list(a = 2)), cex = 3)
box()
```

<img src="/post/2019/trick_or_tips004_files/figure-html/bquote-1.png" width="768" style="display: block; margin: auto;" />

``` r
print(path_root)
#R>  [1] "/home/kc/git/inSilecoBlog/inSileco.github.io"
```

#### **That’s all folks\!**

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
#R>  [1] microbenchmark_1.4.9   inSilecoRef_0.0.1.9000
#R>  
#R>  loaded via a namespace (and not attached):
#R>   [1] Rcpp_1.0.10       mvtnorm_1.1-3     lubridate_1.8.0   lattice_0.20-45  
#R>   [5] ps_1.7.2          zoo_1.8-11        digest_0.6.31     utf8_1.2.3       
#R>   [9] mime_0.12         R6_2.5.1          plyr_1.8.8        backports_1.4.1  
#R>  [13] evaluate_0.19     highr_0.10        httr_1.4.4        blogdown_1.16    
#R>  [17] pillar_1.8.1      rlang_1.0.6       curl_5.0.0        multcomp_1.4-20  
#R>  [21] data.table_1.14.6 miniUI_0.1.1.1    callr_3.7.3       jquerylib_0.1.4  
#R>  [25] Matrix_1.5-3      DT_0.26           rmarkdown_2.19    splines_4.2.2    
#R>  [29] RefManageR_1.3.0  rcrossref_1.2.0   stringr_1.5.0     htmlwidgets_1.6.1
#R>  [33] igraph_1.3.5      shiny_1.7.4       compiler_4.2.2    httpuv_1.6.8     
#R>  [37] xfun_0.36         pkgconfig_2.0.3   htmltools_0.5.4   tidyselect_1.2.0 
#R>  [41] tibble_3.1.8      httpcode_0.3.0    bookdown_0.32     codetools_0.2-19 
#R>  [45] fansi_1.0.4       dplyr_1.1.0       withr_2.5.0       later_1.3.0      
#R>  [49] MASS_7.3-58.2     grid_4.2.2        crul_1.3          jsonlite_1.8.4   
#R>  [53] xtable_1.8-4      lifecycle_1.0.3   magrittr_2.0.3    cli_3.5.0        
#R>  [57] stringi_1.7.8     cachem_1.0.6      promises_1.2.0.1  xml2_1.3.3       
#R>  [61] bslib_0.4.2       ellipsis_0.3.2    targets_0.14.2    generics_0.1.3   
#R>  [65] vctrs_0.5.2       sandwich_3.0-2    TH.data_1.1-1     tools_4.2.2      
#R>  [69] glue_1.6.2        survival_3.5-0    processx_3.8.0    fastmap_1.1.0    
#R>  [73] yaml_2.3.6        base64url_1.4     knitr_1.41        sass_0.4.5
```

</details>

</div>
