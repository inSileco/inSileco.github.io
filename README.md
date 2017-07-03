# letiR_website

## How this website has been built

- Website built with [Rmarkdown](http://rmarkdown.rstudio.com/rmarkdown_websites.html");
- [Academicons](http://jpswalsh.github.io/academicons/) for academic icons
- flags come from the [flag-icon](http://flag-icon-css.lip.is) library;
- silhouette images are found on the [PhyloPic](http://phylopic.org) website;
- some R tricks (see the `Rmd` files).

We used a custom [Makefile](https://www.gnu.org/software/make/) to build the website. Use:

```
  make newpost
```

to create a new post, then use

```
  make
```

to build the website. If any of `footer.html`, `header.html`, `*.css` or
`site.yml` have been changed, use:

```
  make rebuildall
```


## Dependencies

In order to build this website, the following are needed:
- R(>=3.3.0);
- Rmarkdown(>=1.5);
- We use a customized Makefile do build this website, so you need to use [GNU Makefile](https://www.gnu.org/software/make/) already install on most  (all?) UNIX systems. Windows users should consider using http://www.cygwin.com;
- We used a couple of different packages throughout our different blog posts. The simplest way to get them all is to use [this gist](https://gist.github.com/KevCaz/aaa83151e9d12cc07fbe379e2c32a385].


# Contributing

- Any additional header contain does `header.html`
- To tune the current visual style, modify the `css/perso.css` file.
- Add *jQueries* in `footer.html`
- create a new blog post:

```
  make newpost
```




# Licence

- Content on the website is licensed under https://creativecommons.org/licenses/by-nc-sa/4.0/ unless otherwise specified.


# To do

- [ ] add a more exhaustive description of contributors/contributions :raising_hand:
- [ ] add contributing for how to make posts
- [ ] the makefile should be reviewed to associate `.Rmd` files and their dependencies more accurately
