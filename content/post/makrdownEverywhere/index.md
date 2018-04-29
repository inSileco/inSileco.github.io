---
title: Markdown everywhere!
author: [kevin]
reviewer: [david]
date: 2018-04-21
tags: [Markdown, markup language]
draft: true
tweet: "Markdown everywhere!"
estime: 14
---


## Origin and philosophy


- [wikipedia page](https://en.wikipedia.org/wiki/Markdown) 2004 always [original](daringfireball.net/projects/markdown) perl parser

- play on words: a minimal [markup langage](https://en.wikipedia.org/wiki/Markup_language), so ... markdown

- philosophy: something very common actually: a higher level language, faster to
write, quicker to read... something very common in computer science and that
explain that we do not write in machine language! In that case Markdown to HTML
(by the way, HTML = HyperText Markup Language)

- parser perl and well nothing more.

- bad parenting: https://blog.codinghorror.com/responsible-open-source-code-parenting/

> “I despise what you’ve done with Text::Markdown, which is to more or less
make it an alias for MultiMarkdown, almost every part of which I disagree with
in terms of syntax additions.” (John Gruber, on 15 Mar 2008)


## Many flavors

Well, the *father* of Markdown did not do more with this.
Minimal and people have extended in many direction with new features.


- [MultiMarkdown](https://kramdown.gettalong.org/) [<i class="fa fa-github" aria-hidden="true"></i>](https://github.com/fletcher/MultiMarkdown) Fletcher Penney
- [Kramdown](https://kramdown.gettalong.org/) [<i class="fa fa-github" aria-hidden="true"></i>](https://github.com/gettalong/kramdown)
- [pandoc's Mardown](https://pandoc.org/MANUAL.html#pandocs-markdown)
-

https://github.com/michelf/php-markdown


Supported per markdown:

- commonmark (CommonMark Markdown)
- gfm (GitHub-Flavored Markdown), or markdown_github, which provides deprecated and less accurate support for Github-Flavored Markdown; please use gfm instead, unless you need to use extensions other than smart.
- markdown (Pandoc’s Markdown)
- markdown_mmd (MultiMarkdown)
- markdown_phpextra (PHP Markdown Extra)
- markdown_strict (original unextended Markdown)


## Unification

- Specification is something major for any langage. (C is not well specified)
- Markdown not well specified, parser Perl not clear.  


- [CommonMark](http://commonmark.org/)
- Specification: http://spec.commonmark.org/ 0.28
- implementations https://github.com/commonmark/CommonMark/wiki/List-of-CommonMark-Implementations
- also a tutorial "learn markdown in 60 seconds"

- another ref: https://www.kobo.com/ca/en/ebook/markdown-for-writers-1






## Everywhere

Below we provide discuss ressources list non-exhaustive

### Static web generators

Always have a Mardown to HTML
Example:

- Jekyll -> multi version
- Hugo <i class="fa fa-long-arrow-right" aria-hidden="true"></i>

### For academic writing

- Tim Poisot software carpentery
Discussion about needed more unless a template doem which IMHO should be the case.  

### Mails

[Markdown Here](https://markdown-here.com/)
A few example
- Most of static generator website integrates

<video width="100%" controls>
 <source src="assets/ex_markdownhere.webm" type="video/webm">
 Your browser does not support the video tag.
</video>



### presentation

Example HTML presentation
Rmarddown

#### Github

- Github Readme
- Wiki

### Slack / Gitter

### Jupyter note book

Text can be added to IPython Notebooks using Markdown cells. Markdown is a popular markup language that is a superset of HTML. Its specification can be found here:

http://daringfireball.net/projects/markdown/

I wonder why they do not use common mark

### R

- Rmarkdown
- bookdown
- Blogdown they are two ways to use markdown!
