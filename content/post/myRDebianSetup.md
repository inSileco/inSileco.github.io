---
title: My R setup on Debian
author: [kevin]
reviewer:
date: 2018-06-17
tags: [R, Debian, setup]
rpkgs: [base]
draft: true
estime: 6
tweet: My R setup on Debian
output:
  blogdown::html_page:
    fig_width: 3
    dev: svg
---


![](https://img.shields.io/badge/inSileco-UnderReview-ffdd55.svg)

R 3.5.0 "Joy in playing" was released April 23th of this year. It took a couple
of weeks to be available on Debian testing but now it is! As a Debian user that
spend a lot of time on R, I am extremely grateful to [Dirk, Michael and Johannes
for their work on this](http://dirk.eddelbuettel.com/blog/2018/06/11/)!


I thought it was a good opportunity to write few notes about my setup. Nothing
really special or tricky and I am sure more advanced users do this otherwise
it is however simple and functional :smile:! I'll go over two
aspects of my setup: how to rebuild it and then a few notes about my startup


## How to reproduce my setup!

As mentioned in [a previous post]({{< relref "post/goDebianTesting" >}}) I am
currently working on Debian testing and I use `apt-get` to install my packages.
I do so for R:

```bash
# needs to be run in super user mode
$ apt-get install r-base r-recommended r-base-dev
```

In my case (default behavior) the path to core packages is `/usr/lib/R/library/`.
I then configure the Java for R (see *Java support* on [the manual](https://cran.r-project.org/doc/manuals/r-release/R-admin.html):

```bash
sudo R CMD javareconf JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
```

and then I install all CRAN packages available via apt-get:

```bash
$ apt-get install "^r-cran-.*"
```


This actually is very helpful to ensure that dependencies are properly installed!
The packages for those package is `/usr/lib/R/site-library/` (again default behavior)
It is true though that I do not use all these packages but:

1. I use a fair portion of them (directly or they are dependencies of package I use)

2. It is really quick to install (quicker than installing from inside R)

3. I have space on my computer and it only takes one single line on my script whereas
a selection would probably have taken tens!

For the rest of the packages I use the classical `ìnstall.packages()` for packages
on CRAN and `devtools::install_github()` for GitHub packages. I have created a
small [gist](https://gist.github.com/KevCaz/aaa83151e9d12cc07fbe379e2c32a385)
to gather all packages I use and I simply keep editing each time I use a new package.
In my installtion script I simply downlod the script and executte it like so:

```
git clone https://gist.github.com/aaa83151e9d12cc07fbe379e2c32a385.git /tmp/pkgsR
sudo Rscript /tmp/pkgsR/myPackages.R
```

The path to these packages is `/home/kevcaz/R/x86_64-pc-linux-gnu-library/3.5`
this is not the default behaviour but a path commonly used (commented out in
one of the startup file) and I'll explain this below. So, I do have 3 different
paths to my R packages:

```R
R>> .libPaths()
[1] "/home/kevcaz/R/x86_64-pc-linux-gnu-library/3.5" "/usr/lib/R/site-library"                        "/usr/lib/R/library"
```

It sounds weird but it is actually quite handful to remember how a given package
was installed thanks to the useful `find.package()` function

```R
R>> find.package("stats")
[1] "/usr/lib/R/library/stats"

R>> find.package("Rcpp")
[1] "/usr/lib/R/site-library/Rcpp"

R>> find.package("drat")
[1] "/home/kevcaz/R/x86_64-pc-linux-gnu-library/3.5/drat"
```

Note that all steps above are in [my installation gist](https://gist.github.com/KevCaz/29536740b9150383a9d543ec1be96103).



## Startup


http://stat.ethz.ch/R-manual/R-devel/library/base/html/Startup.html

https://rviews.rstudio.com/2017/04/19/r-for-enterprise-understanding-r-s-startup/
