---
title: "Your new post"
author:
  - Who you are
date: "today"
status: inDevelopment
keywords:
  - kw1
  - kw2
output:
  html_document:
    include:
        after_body: [footer.html, disqus.html]
---


```{r addStatus, echo=FALSE, results="asis", message=FALSE}
  source("Rscripts/addStatus.R")
  addStatus("emptyPost.Rmd")
```

# First section
