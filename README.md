# inSileco blog
[![Build and deploy our blog](https://github.com/inSileco/inSileco.github.io/actions/workflows/R-BUILD-BLOG.yml/badge.svg)](https://github.com/inSileco/inSileco.github.io/actions/workflows/R-BUILD-BLOG.yml)

The overarching goal of this blog is quite straightforward: tackle challenges
and opportunities provided by this new era of open-access and computationally
intensive research in the field of ecology.


## Getting started

Our blog created with [blogdown :package:](https://bookdown.org/yihui/blogdown/). See [our wiki :book:](https://github.com/inSileco/inSileco.github.io/wiki/GetStarted) to learn how to contribute to the blog!


## Installation -- tl;dr 

Inside a [R](https://www.r-project.org/) console:

```R
install.packages("remotes")
remotes::install_deps()
blogdown::install_hugo()
icons::download_fontawesome()
blogdown::check_config()
blogdown::check_content()
blogdown::build_site()
```
