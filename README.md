# inSileco blog
[![build-and-check](https://github.com/inSileco/inSileco.github.io/actions/workflows/R-BUILD-CHECK.yml/badge.svg)](https://github.com/inSileco/inSileco.github.io/actions/workflows/R-BUILD-CHECK.yml)
[![build-and-deploy](https://github.com/inSileco/inSileco.github.io/actions/workflows/R-BUILD-DEPLOY.yml/badge.svg)](https://github.com/inSileco/inSileco.github.io/actions/workflows/R-BUILD-DEPLOY.yml)
[![pages-build-deployment](https://github.com/inSileco/inSileco.github.io/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/inSileco/inSileco.github.io/actions/workflows/pages/pages-build-deployment)

The overarching goal of this blog is quite straightforward: tackle challenges
and opportunities provided by this new era of open-access and computationally
intensive research in the field of ecology.


## Getting started

Our blog created with [blogdown :package:](https://bookdown.org/yihui/blogdown/). See [our wiki :book:](https://github.com/inSileco/inSileco.github.io/wiki/GetStarted) to learn how to contribute to the blog!


## Installation -- tl;dr 

Clone the repository with submodules: 

```sh 
$ git clone --recurse-submodules git@github.com:inSileco/inSileco.github.io.git
```

In an [R](https://www.r-project.org/) console:

```R
install.packages("remotes")
remotes::install_deps()
blogdown::install_hugo()
icons::download_fontawesome()
blogdown::check_config()
blogdown::check_content()
blogdown::build_site()
```

## Workflow 

Once installed, you can simply stick to the following line of code to launch the blog:

```R
blogdown::serve_site()
```

and to stop serving the blog locally,  use 

```R
blogdown::stop_server()
```

