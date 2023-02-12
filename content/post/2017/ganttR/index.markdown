---
title: Gantt charts in R
author: [david]
reviewer: [kevin]
date: 2017-09-20
tags: [R, time management, gantt chart, data visualization]
rpkgs: [graphics, tidyverse, RColorBrewer, kableExtra]
draft: false
estime: 15
tweet: Gantt charts in R
output:
  blogdown::html_page:
    fig_width: 3
    dev: svglite
edits:
  - date: 2022-04-23
    comment: "Improve code formatting."
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />



## Gantt charts

[Gantt charts](https://en.wikipedia.org/wiki/Gantt_chart) are a very useful way
to organize projects into milestones and tasks visually. They are also dead
useful when comes the time to create a timeline for a project, whether it be for
a research project, field work or grant applications. I recently wanted to
create one, but was unsatisfied by what was available out there in terms of
visuals (although there are neat R examples, see [here](https://www.r-bloggers.com/gantt-charts-in-r-using-plotly/),
[here](https://stackoverflow.com/questions/3550341/gantt-charts-with-r) and
[here](https://davetang.org/muse/2017/02/03/gantt-chart-using-r/)). So I came up with my own!

For those who might be interested only in generating charts without all the code,
jump to the end, copy the `ganttR` function I created and Gantt away!



## Initiate R


```r
# Packages required
library(knitr)
library(tidyverse)
library(RColorBrewer)
library(kableExtra)
```



## The code!

I wanted to come up with something simple and visually appealing, so I created
a figure that simply required the following elements: milestone, tasks, start
date, due data and status.

### Data


```r
# Let's organize a fake manuscript project to generate the chart.
Manuscript <- c('Research & readings', 'Data preparation', 'Analyses', 'Plan', 'Introduction',
  'Methods', 'Results', 'Discussion', 'Conclusion', 'Preliminary version to co-authors')
startDate <- c('2017-09-01', '2017-09-14', '2017-09-28', '2017-09-21', '2017-09-28',
  '2017-09-14', '2017-10-28', '2017-11-14', '2017-11-28', '2017-12-11')
dueDate <- c('2017-11-28', '2017-09-28', '2017-10-28', '2017-09-28', '2017-10-28',
  '2017-10-28', '2017-11-14', '2017-11-28', '2017-12-04', '2017-12-11')
status <- c('I', 'C', 'I', 'C', 'I', 'I', 'I', 'I', 'I', 'I')
nTasks <- length(Manuscript)

# Create the data frame.
# In statuses, "I" and "C" would stand for "Incomplete" and "Complete", respectively
df <- data.frame(milestones = rep('Manuscript', nTasks),
                 tasks = Manuscript,
                 startDate = as.Date(startDate),
                 dueDate = as.Date(dueDate),
                 status = status,
                 stringsAsFactors = FALSE)

kable(df, "html") %>%
    kable_styling(full_width = FALSE)
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> milestones </th>
   <th style="text-align:left;"> tasks </th>
   <th style="text-align:left;"> startDate </th>
   <th style="text-align:left;"> dueDate </th>
   <th style="text-align:left;"> status </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Research &amp; readings </td>
   <td style="text-align:left;"> 2017-09-01 </td>
   <td style="text-align:left;"> 2017-11-28 </td>
   <td style="text-align:left;"> I </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Data preparation </td>
   <td style="text-align:left;"> 2017-09-14 </td>
   <td style="text-align:left;"> 2017-09-28 </td>
   <td style="text-align:left;"> C </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Analyses </td>
   <td style="text-align:left;"> 2017-09-28 </td>
   <td style="text-align:left;"> 2017-10-28 </td>
   <td style="text-align:left;"> I </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Plan </td>
   <td style="text-align:left;"> 2017-09-21 </td>
   <td style="text-align:left;"> 2017-09-28 </td>
   <td style="text-align:left;"> C </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Introduction </td>
   <td style="text-align:left;"> 2017-09-28 </td>
   <td style="text-align:left;"> 2017-10-28 </td>
   <td style="text-align:left;"> I </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Methods </td>
   <td style="text-align:left;"> 2017-09-14 </td>
   <td style="text-align:left;"> 2017-10-28 </td>
   <td style="text-align:left;"> I </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Results </td>
   <td style="text-align:left;"> 2017-10-28 </td>
   <td style="text-align:left;"> 2017-11-14 </td>
   <td style="text-align:left;"> I </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Discussion </td>
   <td style="text-align:left;"> 2017-11-14 </td>
   <td style="text-align:left;"> 2017-11-28 </td>
   <td style="text-align:left;"> I </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Conclusion </td>
   <td style="text-align:left;"> 2017-11-28 </td>
   <td style="text-align:left;"> 2017-12-04 </td>
   <td style="text-align:left;"> I </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Manuscript </td>
   <td style="text-align:left;"> Preliminary version to co-authors </td>
   <td style="text-align:left;"> 2017-12-11 </td>
   <td style="text-align:left;"> 2017-12-11 </td>
   <td style="text-align:left;"> I </td>
  </tr>
</tbody>
</table>


We can now create our Gantt chart!



### The chart



```r
# Let's first organize our graph in order of tasks startDate
df <- arrange(df, desc(startDate))

# We need a date range for which we wish to create the graph.
# Let's select the duration of the milestone
dateRange <- c(min(df$startDate), max(df$dueDate))

# We also need the number of elements to add to our graph.
# It will be the number of tasks plus the number of milestones
nameMilestones <- unique(df$milestones)
nMilestones <- length(nameMilestones)
nLines <- nTasks + nMilestones

# We also need a date sequence that will be used as one of our axes
# We select the date range divided into 7 days periods
dateSeq <- seq.Date(dateRange[1], dateRange[2], by = 7)

# Finally, we need a color palette for the project
# We take three colors, the first will be for the milestones
# The second will be for incomplete tasks
# The third color will be for completed tasks
cols <- c('#4f739d', '#4f739dBB', '#4f739d33')

# Gantt chart
par(family = "serif", mar = c(6,9,2,0))
plot(x = 1, y = 1, col = 'transparent', xlim = dateRange, ylim = c(1, nLines), bty = "n",
  ann = FALSE, xaxt = "n", yaxt = "n", type = "n", bg = 'grey')

# Add axes, tasks and milestones
mtext(dateSeq, side = 1, at = dateSeq, las = 3, line = 1.5, cex = 0.75)
axis(1, dateSeq, labels = FALSE, line = 0.5)
mtext(df$tasks, side = 2, at = 1:nrow(df), las = 1, line = 0, cex = 0.75)
mtext(nameMilestones, side = 2, at = nrow(df)+1, las = 1, line = 8, font = 2, adj = 0, cex = 0.8)

# Add tasks
for(i in 1:nTasks) {
    lines(c(i,i) ~ c(df$startDate[i], df$dueDate[i]), lwd = 6, col = if(df$status[i] == 'C') cols[3] else cols[2])
}

# Add milestone
lines(c(nLines,nLines) ~ c(min(df$startDate), max(df$dueDate)), lwd = 8, col = cols[1])

# Add today's date
abline(v = as.Date(format(Sys.time(), format = "%Y-%m-%d")), lwd = 2, lty = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/singleGantt-1.svg" width="960" style="display: block; margin: auto;" />

<br/>

### Multiple milestones

Now Gantt charts are also useful to visualize and organize multiple projects
together, so let's make this chart multi-milestony.



```r
# We will simply duplicate the manuscript and do as though we are working on three consecutive manuscripts
df2 <- df3 <- df
df2$milestones <- 'Manuscript2'
df3$milestones <- 'Manuscript3'
df2[,c('startDate', 'dueDate')] <- df2[,c('startDate', 'dueDate')] + as.numeric(diff(dateRange))
df3[,c('startDate', 'dueDate')] <- df3[,c('startDate', 'dueDate')] + as.numeric(diff(dateRange))*2
df2$status <- df3$status <- rep('I', nTasks)
dfM <- rbind(df, df2, df3)

# ... and go through the process of setting up the elements needed for the chart
# Let's start with the colors this time
# We take three colors, the first will be for the milestones
# The second will be for incomplete tasks
# The third color will be for completed tasks
nameMilestones <- unique(dfM$milestones)
nMilestones <- length(nameMilestones)
cols <- data.frame(milestones = nameMilestones,
                   col = brewer.pal(nMilestones, "Dark2"),
                   stringsAsFactors = FALSE)

# Let's organize our dataset to produce the graph
dfMulti <- dfM %>%
      group_by(milestones) %>% # group by milestones
      summarise(startDate = min(startDate),
                dueDate = max(dueDate)) %>% # Determine the beginning and end date of milestones
      mutate(tasks = milestones, status = 'M') %>% # Give a name and a status
      bind_rows(dfM) %>% # Bind milestones with tasks
      mutate(lwd = ifelse(milestones == tasks, 8, 6)) %>% # Add line width for graph
      left_join(cols, by = 'milestones') %>% # add colors
      mutate(col = ifelse(status == 'I', paste0(col, 'BB'), col)) %>% # change colors according to status
      mutate(col = ifelse(status == 'C', paste0(col, '33'), col)) %>% # change colors according to status
      mutate(cex = ifelse(status == 'M', 0.8, 0.75)) %>%
      mutate(adj = ifelse(status == 'M', 0, 1)) %>%
      mutate(line = ifelse(status == 'M', 8, 0.5)) %>%
      mutate(font = ifelse(status == 'M', 2, 1)) %>%
      arrange(milestones,desc(startDate),dueDate) # sort table

# We need a date range for which we wish to create the graph.
# Let's select the duration of the milestone
dateRange <- c(min(dfMulti$startDate), max(dfMulti$dueDate))

# We also need a date sequence that will be used as one of our axes
# We select the date range divided into 7 days periods
dateSeq <- seq.Date(dateRange[1], dateRange[2], by = 7)


# Gantt chart
nLines <- nrow(dfMulti)
par(family = "serif", mar = c(6, 9, 2, 0))
plot(x = 1, y = 1, col = 'transparent', xlim = dateRange, ylim = c(1, nLines),
  bty = "n",ann = FALSE, xaxt = "n", yaxt = "n", type = "n", bg = 'grey')
mtext(dateSeq, side = 1, at = dateSeq, las = 3, line = 1.5, cex = 0.75)
axis(1, dateSeq, labels = F, line = 0.5)

for(i in 1:nLines) {
    lines(c(i,i) ~ c(dfMulti$startDate[i],dfMulti$dueDate[i]),
          lwd = dfMulti$lwd[i],
          col = dfMulti$col[i])
    mtext(dfMulti$tasks[i],
          side = 2,
          at = i,
          las = 1,
          adj = dfMulti$adj[i],
          line = dfMulti$line[i],
          cex = dfMulti$cex[i],
          font = dfMulti$font[i])
}

abline(h = which(dfMulti$status == 'M') + 0.5, col = '#634d42')
abline(v = as.Date(format(Sys.time(), format = "%Y-%m-%d")), lwd = 2, lty = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/multiGantt-1.svg" width="960" style="display: block; margin: auto;" />


## ganttR()

Now that we have all the code, let's simply transform it into a reusable function. Let's also give it the choice to generate two types of graph: 1) all milestones and tasks or 2) only milestones.


```r
ganttR <- function(df, type = 'all') {
    nameMilestones <- unique(df$milestones)
    nMilestones <- length(nameMilestones)
    rbPal <- colorRampPalette(c("#3fb3b2", "#ffdd55", "#c7254e", "#1b95e0", "#8555b4")) # Color palette
    cols <- data.frame(milestones = nameMilestones,
                       col = rbPal(nMilestones),
                       stringsAsFactors = FALSE)
    cols <- cols[1:nMilestones, ]

    # Let's organize our dataset to produce the graph
    df <- df %>%
          group_by(milestones) %>% # group by milestones
          summarise(startDate = min(startDate),
                    dueDate = max(dueDate)) %>% # Determine the beginning and end date of milestones
          mutate(tasks = milestones, status = 'M') %>% # Give a name and a status
          bind_rows(df) %>% # Bind milestones with tasks
          mutate(lwd = ifelse(milestones == tasks, 8, 6)) %>% # Add line width for graph
          left_join(cols, by = 'milestones') %>% # add colors
          mutate(col = ifelse(status == 'I', paste0(col, 'BB'), col)) %>% # change colors according to status
          mutate(col = ifelse(status == 'C', paste0(col, '33'), col)) %>% # change colors according to status
          mutate(cex = ifelse(status == 'M', 0.8, 0.75)) %>%
          mutate(adj = ifelse(status == 'M', 0, 1)) %>%
          mutate(line = ifelse(status == 'M', 8, 0.5)) %>%
          mutate(font = ifelse(status == 'M', 2, 1)) %>%
          arrange(milestones,desc(startDate),dueDate) # sort table

    # We need a date range for which we wish to crete the graph.
    # Let's select the duration of the milestone
    dateRange <- c(min(df$startDate), max(df$dueDate))

    # We also need a date sequence that will be used as one of our axes
    # We select the date range divided into 7 days periods
    # dateSeq <- seq.Date(dateRange[1], dateRange[2], by = 7)
    forced_start <- as.Date(paste0(format(dateRange[1], "%Y-%m"), "-01"))
    yEnd <- format(dateRange[2], "%Y")
    mEnd <- as.numeric(format(dateRange[2], "%m")) + 1
    if (mEnd == 13) {
        yEnd <- as.numeric(yEnd) + 1
        mEnd <- 1
    }
    forced_end <- as.Date(paste0(yEnd, "-", mEnd,"-01"))
    dateSeq <- seq.Date(forced_start, forced_end, by = "month")
    lab <- format(dateSeq, "%B")

    # Gantt chart for 'all' type
    if(type == 'all') {
        nLines <- nrow(df)
        par(family = "serif", mar = c(6,9,2,0))
        plot(x = 1, y = 1, col = 'transparent',
          xlim = c(min(dateSeq), max(dateSeq)),
          ylim = c(1, nLines), bty = "n",
          ann = FALSE, xaxt = "n", yaxt = "n", type = "n", bg = 'grey')
        mtext(lab[-length(lab)], side = 1, at = dateSeq[-length(lab)], las = 0,
          line = 1.5, cex = 0.75, adj = 0)
        axis(1, dateSeq, labels = FALSE, line = 0.5)
        extra <- nLines * 0.03
        for(i in seq(1,length(dateSeq - 1), by = 2)) {
            polygon(x = c(dateSeq[i], dateSeq[i + 1], dateSeq[i + 1], dateSeq[i]),
                    y = c(1 - extra, 1 - extra, nLines + extra, nLines + extra),
                    border = 'transparent',
                    col = '#f1f1f155')
        }

        for(i in 1:nLines) {
            lines(c(i,i) ~ c(df$startDate[i], df$dueDate[i]),
                  lwd = df$lwd[i],
                  col = df$col[i])
            mtext(df$tasks[i],
                  side = 2,
                  at = i,
                  las = 1,
                  adj = df$adj[i],
                  line = df$line[i],
                  cex = df$cex[i],
                  font = df$font[i])
        }

        abline(h = which(df$status == 'M') + 0.5, col = '#634d42')
        abline(v = as.Date(format(Sys.time(), format = "%Y-%m-%d")), lwd = 2, lty = 2)
    }

    # Gantt chart for 'milestones' only
    if(type == 'milestones') {
        nLines <- nMilestones
        ms <- which(df$status == 'M')
        par(family = "serif", mar = c(6,9,2,0))
        plot(x = 1, y = 1, col = 'transparent', xlim = c(min(dateSeq), max(dateSeq)), ylim = c(1,nLines), bty = "n",ann = FALSE, xaxt = "n", yaxt = "n",type = "n",bg = 'grey')
        mtext(lab[-length(lab)], side = 1, at = dateSeq[-length(lab)], las = 0, line = 1.5, cex = 0.75, adj = 0)
        axis(1, dateSeq, labels = FALSE, line = 0.5)
        extra <- nLines * 0.03
        for(i in seq(1,length(dateSeq-1), by = 2)) {
            polygon(x = c(dateSeq[i], dateSeq[i + 1], dateSeq[i + 1], dateSeq[i]),
                    y = c(1 - extra, 1 - extra, nLines + extra, nLines + extra),
                    border = 'transparent',
                    col = '#f1f1f155')
        }

        for(i in 1:nLines) {
            lines(c(i,i) ~ c(df$startDate[ms[i]], df$dueDate[ms[i]]),
                  lwd = df$lwd[ms[i]],
                  col = df$col[ms[i]])
            mtext(df$tasks[ms[i]],
                  side = 2,
                  at = i,
                  las = 1,
                  adj = 1,
                  line = 0.5,
                  cex = df$cex[ms[i]],
                  font = df$font[ms[i]])
        }
        abline(v = as.Date(format(Sys.time(), format = "%Y-%m-%d")), lwd = 2, lty = 2)
    }
}

# Single milestone
ganttR(df)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/ganttR-1.svg" width="960" style="display: block; margin: auto;" />

```r

# Multiple milestones
ganttR(dfM)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/ganttR-2.svg" width="960" style="display: block; margin: auto;" />

```r

# Milestones only
ganttR(dfM, 'milestones')
```

<img src="{{< blogdown/postref >}}index_files/figure-html/ganttR-3.svg" width="960" style="display: block; margin: auto;" />







<div style="padding: 2rem 0rem 2rem 0rem;">
<details>
<summary>Session info <i class="fas fa-cogs" aria-hidden="true"></i></summary>

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
#R>   [1] kableExtra_1.3.4       RColorBrewer_1.1-3     forcats_1.0.0         
#R>   [4] stringr_1.5.0          dplyr_1.1.0            purrr_1.0.1           
#R>   [7] readr_2.1.3            tidyr_1.3.0            tibble_3.1.8          
#R>  [10] ggplot2_3.4.0          tidyverse_1.3.2        knitr_1.41            
#R>  [13] inSilecoRef_0.0.1.9000
#R>  
#R>  loaded via a namespace (and not attached):
#R>   [1] fs_1.6.0            lubridate_1.8.0     webshot_0.5.4      
#R>   [4] httr_1.4.4          targets_0.14.2      tools_4.2.2        
#R>   [7] backports_1.4.1     bslib_0.4.2         utf8_1.2.3         
#R>  [10] R6_2.5.1            DT_0.26             DBI_1.1.3          
#R>  [13] colorspace_2.1-0    withr_2.5.0         tidyselect_1.2.0   
#R>  [16] processx_3.8.0      curl_5.0.0          compiler_4.2.2     
#R>  [19] cli_3.5.0           rvest_1.0.3         xml2_1.3.3         
#R>  [22] bookdown_0.32       sass_0.4.5          scales_1.2.1       
#R>  [25] callr_3.7.3         systemfonts_1.0.4   digest_0.6.31      
#R>  [28] svglite_2.1.1       rmarkdown_2.19      pkgconfig_2.0.3    
#R>  [31] htmltools_0.5.4     highr_0.10          dbplyr_2.3.0       
#R>  [34] fastmap_1.1.0       htmlwidgets_1.6.1   rlang_1.0.6        
#R>  [37] readxl_1.4.1        rstudioapi_0.14     httpcode_0.3.0     
#R>  [40] shiny_1.7.4         jquerylib_0.1.4     generics_0.1.3     
#R>  [43] jsonlite_1.8.4      googlesheets4_1.0.1 magrittr_2.0.3     
#R>  [46] Rcpp_1.0.10         munsell_0.5.0       fansi_1.0.4        
#R>  [49] RefManageR_1.3.0    lifecycle_1.0.3     stringi_1.7.8      
#R>  [52] yaml_2.3.6          plyr_1.8.8          grid_4.2.2         
#R>  [55] promises_1.2.0.1    crayon_1.5.2        miniUI_0.1.1.1     
#R>  [58] haven_2.5.1         hms_1.1.2           ps_1.7.2           
#R>  [61] pillar_1.8.1        igraph_1.3.5        base64url_1.4      
#R>  [64] codetools_0.2-19    crul_1.3            reprex_2.0.2       
#R>  [67] glue_1.6.2          rcrossref_1.2.0     evaluate_0.19      
#R>  [70] blogdown_1.16       data.table_1.14.6   modelr_0.1.10      
#R>  [73] vctrs_0.5.2         tzdb_0.3.0          httpuv_1.6.8       
#R>  [76] cellranger_1.1.0    gtable_0.3.1        assertthat_0.2.1   
#R>  [79] cachem_1.0.6        xfun_0.36           mime_0.12          
#R>  [82] xtable_1.8-4        broom_1.0.3         later_1.3.0        
#R>  [85] viridisLite_0.4.1   googledrive_2.0.0   gargle_1.3.0       
#R>  [88] ellipsis_0.3.2
```
</details>
</div>
