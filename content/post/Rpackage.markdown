---
layout: post
title:  "Creating an R package, it's worth it"
author: Kevin Cazelles
date:   2015-08-04
categories: R
---


As I have recently submitted first package to CRAN after quite a while I'd like 
to share my expereince forst is the revisit of a post I worte bac in Agust 2015
 2015-08-04 At that time I add created my forst package now I use R packge
 as one on my toots

I have recently created my first R package to gather R functions I often use to create graphics.
It is straightforward, I have learned a lot, many tools make your live easier, it's definitively worth it!


### Documentation and tools to build R packages ###

As I did not know how it works, my first move was to search on the CRAN website where I readily found an [exhaustive documentation](https://cran.r-project.org/doc/manuals/r-release/R-exts.html).
It was so well-detailed that I quickly figured out that it would require hours to go through and understand all of this.
Therefore I decided to search online for a more applied perspective. That's how I came across [this post from Hilary Parker](http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/).
A small click for my web browser a giant leap for me!
Everything is actually already well-thought-out:

1- An R package has a clear and simple architecture, all files required are easy to edit.  
2- There is a valuable book, available as a [website](http://r-pkgs.had.co.nz), written by Hadley Wickham.  
3- Many steps such as the documentation are automated due to functions of the [*devtools*](https://cran.r-project.org/web/packages/devtools/index.html) package.
4- In addition, using [Github](https://github.com), [Travis](https://travis-ci.org) together with a powerful code editor such as [Atom](https://atom.io) makes the workflow even more efficient.


### The *devtools* packages ###

This is the R package you need to develop your own R package efficiently.
Hadley Wickham and colleagues have cleverly automated many steps for creating R packages in different packages that are used by *devtools*.
Let's say you have a bunch of R functions. What you need to do is to make a folder called **yourRpackage** where you edit a file **DESCRIPTION** that [describes your package](http://r-pkgs.had.co.nz/description.html).
Then, you must create a subfolder named **R** where you put your R functions (usually with a filename extension "*.R*" ) and then put all your R functions within.
Before going any further, you must document your functions.
To do so at the head of all you function, you must use a couple of lines starting by **#'** that will be used by *devtools* (via *roxygen2*) to produce the documentation. The basic syntax is:

{% highlight R %}
#' @nameofsection  (e.g. @return, @examples, ...)
#' what you need to write
{% endhighlight %}


To have more details, the minimal example from [Hilary Parker](http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/) is well-chosen. To go deeper, look at [what Hadley Wickham wrote](http://r-pkgs.had.co.nz/man.html). Once your function os documented, you simply need to use 2 functions, like so:

{% highlight R %}
load_all("path2yourRpackage")   
document("path2yourRpackage")
{% endhighlight %}

The first function will load all the functions in the **R** folder, the second will create the folder **man** that contains one document file for each function based on what you wrote.
Those functions check wether your package is in accordance with the architecture of an R package. However neither your code nor your examples are tested.
Therefore, you must strongly benefit from [testing your package](http://r-pkgs.had.co.nz/check.html).
One first thing to do is to use the function *check* of 'devtools' package.
Also, thanks to the [*testthat*](https://cran.r-project.org/web/packages/testthat/index.html) you have a simple unit testing system.
I do not take advantage from this package, I rather use Travis as explained below.


### Github + Travis ###

[Github](https://github.com) is becoming an inescapable tool for developers. Even without collaboration Github is an useful way to work efficiently.
It offers a place to save your work, see clearly your progress and share to everyone your achievements.
If your are not familiar with Github, you can have a look at the [wikipedia page](https://en.wikipedia.org/wiki/GitHub). Then, if you are eager to use it, I suggest you go through the [users documentation](https://en.wikipedia.org/wiki/GitHub).

For an R package, there is one important extra asset: people can download and install your package using functions *install_github* or *install_git* of *devtools*. Even for your-self this is useful: once you have pushed your package to Github, you can install the released version through this process while keeping the version under development apart. Then, anytime you improve your package, you can test and document the new functions, make a new commit and so on.

Even better, for each commit you push, a series of automated testing code can be made on a dedicated server. This is the magic of the continuous integration service [Travis](https://travis-ci.org). A couple of minute after pushing the new commit, you receive an email stating whether or not your package have been built with success.

To start with Travis, after signing up (with your github account), you only need to read 1) [the thin documentation for complete beginners](http://docs.travis-ci.com/user/for-beginners) and 2) the details regarding the [R language](http://docs.travis-ci.com/user/languages/r/). Then you must decide whether or not using Travis for your projects.
You will likely notice that Travis for R language is community supported. Therefore, we are indebted to Craig Citro, Dirk Eddelbuettel, Hadley Wickham and people that contribute to the [r-travis project](https://github.com/craigcitro/r-travis), so thank you guys, it helps a lot!


### License and Version of your package ###

Two last points to conclude this post.

First, you may wonder what kind of license you must pick up for your package.
In this case, I recommend you to go and visit this website:
["ChooseALicense"](http://choosealicense.com).

Also, to chose the version number of you R package, I recommend you to follow the recommendation of [Semantic Versioning](http://semver.org). This will make the three numbers you add to your package name meaningful while others make the [version number converging to pi](https://en.wikipedia.org/wiki/TeX).

<br/>


**That's all folks!**

<br/>
