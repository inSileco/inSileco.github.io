---
title: My R setup on Debian
author: [kevin]
reviewer: [david]
date: 2018-06-18
tags: [R, Linux, Debian, Setup]
rpkgs: [base]
draft: false
estime: 6
tweet: My R setup on Debian
output:
  blogdown::html_page:
    fig_width: 3
    dev: svg
---


R 3.5.0 "Joy in playing" was released April 23rd this year. It took a couple
of weeks before it was made available on Debian testing due to the work
required to rebuild the packages and as a Debian user that spend a lot of time
on R, I am extremely grateful to [the work of Dirk, Michael and Johannes on this](http://dirk.eddelbuettel.com/blog/2018/06/11/)!


I thought it was a good opportunity to write few notes about my R setup. Nothing
really special or tricky and I guess more advanced users proceed otherwise, yet
it is nonetheless simple and functional :smile:! In this post I'll go over two
different aspects:

1. the way I install R and the packages I use,

2. how I customized my R's startup.



## How do I install and the package I use?

As mentioned in [a previous post]({{< relref "/post/setUps/goDebianTesting" >}}), I am
currently working on Debian testing and use `apt-get` to install my software
which includes R:

```bash
# this lines and the following may need to be run in super user mode
$ apt-get install r-base r-recommended r-base-dev
```

I use the default location to store the core packages, *i.e.* `/usr/lib/R/library/`.
After the installation of the core packages, I configure Java for R (see *Java support* on [the manual](https://cran.r-project.org/doc/manuals/r-release/R-admin.html) for
more details):

```bash
$ R CMD javareconf JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
```

Then I install all CRAN packages available via `apt-get`:

```bash
$ apt-get install "^r-cran-.*"
```


This actually is very helpful to ensure that dependencies are properly installed!
The path to those packages is `/usr/lib/R/site-library/` (again default behavior)
It is true though that I do not use all these packages, but:

1. I use a fair portion of them (directly or as dependencies of other packages I use)

2. It is really quick to install (quicker than installing them from inside R)

3. I have space on my computer and it only takes one single line on my script whereas
a selection would probably have taken tens :smile:!


For the remaining packages (not packaged specifically for Debian), I use the
classical `ìnstall.packages()` for packages on CRAN and `devtools::install_github()`
for GitHub packages. I do not use package from other repositories.
For those packages, I have created a small [gist](https://gist.github.com/KevCaz/aaa83151e9d12cc07fbe379e2c32a385)
to gather them and I edit it each time I've found a package relevant for my research.
In order to install this package I get the gist (an R script) and execute it:

```bash
$ git clone https://gist.github.com/aaa83151e9d12cc07fbe379e2c32a385.git /tmp/pkgsR
$ sudo Rscript /tmp/pkgsR/myPackages.R
```

The path to these packages is `/home/kevcaz/R/x86_64-pc-linux-gnu-library/3.5`
this is not the default behavior but a path commonly used. So, yes, in total
I use 3 different paths to my R packages :smiley::

```R
R>> .libPaths()
[1] "/home/kevcaz/R/x86_64-pc-linux-gnu-library/3.5" "/usr/lib/R/site-library"                        "/usr/lib/R/library"
```

This is actually quite handful, especially to remember how a given package
was installed:

```R
R>> find.package("stats")
[1] "/usr/lib/R/library/stats"

R>> find.package("Rcpp")
[1] "/usr/lib/R/site-library/Rcpp"

R>> find.package("drat")
[1] "/home/kevcaz/R/x86_64-pc-linux-gnu-library/3.5/drat"
```

Well, I very much like it that way :smile_cat:! Two notes to conclude this section.
First, in the near future I may consider
the neat [`drat` package](http://dirk.eddelbuettel.com/code/drat.html) to add
packages available on GitHub. Second, if you are interested in
reproducing this installation, have a look at [my installDebian.sh gist](https://gist.github.com/KevCaz/29536740b9150383a9d543ec1be96103).

Now that R is installed let's see how to customize the launch process.


## My R's Startup

When you type `R` and `enter` in your favorite terminal or when you open
RStudio, many things happen before you can enter your first line of code for
the session (even more for RStudio I guess). This is the startup process. It
is thoroughly explained [here](http://stat.ethz.ch/R-manual/R-devel/library/base/html/Startup.html)
(also available in R using `help(Startup)`) and in this post on [R Views](https://rviews.rstudio.com/2017/04/19/r-for-enterprise-understanding-r-s-startup/).
Below I'd like to explain how I take advantage of the possibility of
personalizing it to make my use of R more comfortable. Basically, during the
launch process I:

1. set up a couple of options (including default packages loaded),
2. tweak some paths,
3. get nice *hello* and *good bye* messages (the most important part!).

For what I do, you simply must retain how to locate `Renviron`. First,
call `R.home`:

```R
R>> R.home()
[1] "/usr/lib/R"
```

`Renviron` is in [`/etc`](https://unix.stackexchange.com/questions/5665/what-does-etc-stand-for),
so for me `/usr/lib/R/etc`:

```R
$ ls /usr/lib/R/etc
javaconf  ldpaths  Makeconf  Renviron  Renviron.orig  Renviron.site  Renviron.ucf  repositories  Rprofile.site
```

Once you have opened it (it may require the super user mode though),
you'll find many options you can change. I suggest you do not change
anything and rather add a new variable `R_ENVIRON` to point to a site file
where you will do the changes without touching the original file (well
this is actually the purpose of this variable). In my case I added:

```
R_ENVIRON = "/usr/lib/R/etc/Renviron.site"
```

It is not mandatory but it is pretty common to locate where you add your chnages
next to the default one. On Debian we actually get an empty `Renviron.site` file:

```
##                                              Emacs please make this -*- R -*-
## empty Renviron.site for R on Debian
##
## Copyright (C) 2008 - 2017  Dirk Eddelbuettel and GPL'ed
##
## see help(Startup) for documentation on ~/.Renviron and Renviron.site

# ## Example ~/.Renviron on Unix
# R_LIBS=~/R/library
# PAGER=/usr/local/bin/less

# ## Example .Renviron on Windows
# R_LIBS=C:/R/library
# MY_TCLTK="c:/Program Files/Tcl/bin"

# ## Example of setting R_DEFAULT_PACKAGES (from R CMD check)
# R_DEFAULT_PACKAGES='utils,grDevices,graphics,stats'
# # this loads the packages in the order given, so they appear on
# # the search path in reverse order.

## # We comment out this line in the default Renviron, you can re-enable it here
## # @R_PLATFORM@ can be eg x86_64-pc-linux-gnu, see /etc/R/Renviron for R_PLATFORM
## # @MAJ_MIN_VERSION@ is likely something like '3.4', see /etc/R/Renviron too
#R_LIBS_USER=${R_LIBS_USER-'~/R/@R_PLATFORM@-library/@MAJ_MIN_VERSION@'}
```

Thanks Dirk for this! As you can read, several changes are possible and all
the parameter found in `Renviron` may be used. In my case I added two lines

```
R_PROFILE_USER = "~/.Rprofile"
R_LIBS_USER=${R_LIBS_USER-'~/R/x86_64-pc-linux-gnu-library/3.5'}
```

The latter indicates the path to packages installed with `ìnstall.packages()`,
while the former points to another file where I do most of the tweaks!
Here it is (also available on
[<i class="fa fa-github" aria-hidden="true"></i>](https://github.com/KevCaz/dotfiles/blob/master/dotfiles/.Rprofile)):


```R
#### KevCaz's .Rprofile
## To refresh => remove the .RData file otherwise .First is found in there
## or use R --no-restore

##-- Set the RNG
set.seed(1987)

##-- options (exlicit enough)
options(
  prompt = "R>> ",
  continue = "+... ",
  width = 160,
  max.print = 2000,
  repos = "https://cran.wu.ac.at/",
  stringsAsFactors = FALSE
)
# Default packages list including my own packages with functions I often use!
options(defaultPackages=c(
    getOption("defaultPackages"),
    "inSilecoMisc",
    "devtools",
    "knitr",
    "magrittr",
    "graphicsutils",
    "rmarkdown"
    ))
##-- X11 options
grDevices::X11.options(width=10, height=10)


##-- few useful functions
reset <- function() system('reset')
nautilus <- function(x='.') system(paste0('nautilus ', x))
deco <- function(char = "-", n = 10) paste(rep(char, n), collapse="")

##-- function triggered when starting a new session / a Hello function
.First <- function(){
    cat("\n", paste0(deco("=", n = 28), ">>"), " KevCaz 92 Hijo ",
    paste0("<<", deco("=", n = 28)), "\n >>", date(), " \n\n") ;
}

##-- function triggered when exiting a new session / a Good Bye function
.Last <- function(){
    graphics.off()
    cat("\n", paste0(deco("~", n = 28), "<") , " Até mais KevCaz! ",
    paste0(">", deco("~", n = 28)),"\n") ;
}
```

<br>

#### That's it! Hope this helps! See you next post! &nbsp; :rocket:
