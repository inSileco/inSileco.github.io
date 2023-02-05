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

You can use it to ubuid properlu

or you can simply use the join `file.path()` too.

## `.Machine`

## `.leap.seconds`

## `.Options`

## `.Random.seed`

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
