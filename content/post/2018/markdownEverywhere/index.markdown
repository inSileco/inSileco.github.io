---
title: Markdown everywhere!
author: [kevin]
reviewer: [marieh, willian]
date: 2018-05-13
tags: [Markdown, markup language]
draft: false
tweet: "Markdown everywhere!"
estime: 15
---



According to [Wikipedia](https://en.wikipedia.org/wiki/Markdown):

> Markdown is a lightweight markup language with plain text formatting syntax.
> It is designed so that it can be converted to HTML and many other formats using
> a tool by the same name Markdown is often used to format readme files, for
> writing messages in online discussion forums, and to create rich text using a
> plain text editor. As the initial description of Markdown contained ambiguities
> and unanswered questions, many implementations and extensions of Markdown
> appeared over the years to answer these issues.

In this post I'd like to expand on this and write down some thoughts I have
about Markdown. My goal is to shed some light on the exact nature of
Markdown which would hopefully explain why Markdown is everywhere through
different flavors. I would conclude this post by asking whether Markdown is
a suitable option for academic writing.



## Origin and philosophy

Scrolling down the Wikipedia page, you'll learn that Markdown was first
released in 2004 (the year of Facebook's birth) by John Gruber on the original
webpage: *i.e.* https://daringfireball.net/projects/markdown/ where you''ll find:

1. details about the Markdown's philosophy,
2. a description of the original syntax,
3. how the conversion is made, *i.e.* a call to a markdown-to-html converter written in [Perl](https://www.Perl.org/): `Markdown.pl`,
4. a small [web application](https://daringfireball.net/projects/markdown/dingus) to try Markdown.


As [John Gruber wrote](https://daringfireball.net/projects/markdown/syntax):

> Markdown is intended to be as easy-to-read and easy-to-write as is feasible.

and it really is! Let me select, copy and slightly modify an example from the
[daringfireball](https://daringfireball.net/projects/markdown/basics) to compare
the Markdown text and the equivalent written in HTML, *i.e.* what the Perl converter
renders:



#### **Markdown version**

```markdown
A First Level Header
====================

A Second Level Header
---------------------

Now is the time for all good men to come to
the aid of their country. This is just a
regular paragraph.

The quick brown fox jumped over the lazy
dog's back.

### Header 3

> This is a blockquote.
>
> This is the **second paragraph** in the blockquote.
>
> ## This is an H2 in a blockquote

```


#### **HTML version**

```html
<h1>A First Level Header</h1>

<h2>A Second Level Header</h2>

<p>Now is the time for all good men to come to
the aid of their country. This is just a
regular paragraph.</p>

<p>The quick brown fox jumped over the lazy
dog's back.</p>

<h3>Header 3</h3>

<blockquote>
    <p>This is a blockquote.</p>

    <p>This is the <strong>second paragraph</strong> in the blockquote.</p>

    <h2>This is an H2 in a blockquote</h2>
</blockquote>
```

Easy-to-read and easy-to-write indeed! If not before, now you should understand
the play on words: HTML (HyperText Markup Language) is a
[markup language](https://en.wikipedia.org/wiki/Markup_language) and Markdown
is a [Lightweight Markup Language (LML)](https://en.wikipedia.org/wiki/Category:Lightweight_markup_languages)
that reduces the length of the most commonly used tags for content editing
in HTML, so Mark~~up~~down <img src = "assets/mdLogo.svg" height = 18px><img>.

Broadly speaking, the idea of creating a language on the top of
another for efficiency purposes is very common in computer science. It is
actually the principle that explains why we use language such as C, Python or
Rust, called [high level programming languages](https://en.wikipedia.org/wiki/High-level_programming_language) instead
of programming directly using machine language (would be a pain in the #!@?#),
even though ultimately the machine language is used. A good illustration is
[CoffeeScript](http://coffeescript.org/) that is built on the
top of JavaScript:

> The golden rule of CoffeeScript is: “It’s just JavaScript.” The code compiles
> one-to-one into the equivalent JS, and there is no interpretation at runtime.
> You can use any existing JavaScript library seamlessly from CoffeeScript
> (and vice-versa). The compiled output is readable, pretty-printed, and tends to
> run as fast or faster than the equivalent handwritten JavaScript.

[Less](http://lesscss.org/) and [Sass](https://sass-lang.com/) are two other
good examples. They both are dynamic preprocessors style sheet language:
the user codes in Less and Sass and those files are compiled into CSS
(Cascading Style Sheets). In the case of CSS an obvious benefit from using Less
or Sass is the possibility of using variables (does not exist in CSS).

Markdown is a markup language to format plain text not, a programming language but the approach is
essentially the same. A better example would be [LateX](https://www.latex-project.org/) that
was build on the top of [TeX](http://tug.org/) to ease the usage of its macros,
but again this is a bit more complex than the case of Markdown which
only converts a very restricted subset of HTLM tags. Note that if you want to
use other HTML tags, the converter will keep them as is and you HTML page
should be rendered just as you expect. You probably wonder why not expanding the number of tags
covered by Markdown, right? Well, this is one of the main reason explaining why there are
several flavors of Markdown available!



## Many flavors

Despite the substantial information about Markdown that John Gruber provided,
he unfortunately did not provide a complete specification, *i.e.* an unequivocal
set of instructions that would allow anyone to write a Markdown converter in any programming
languages that would have the same behavior (note that reading the code of the
Perl converter does not seem to remove all ambiguities, according to the authors of [CommonMark](http://spec.commonmark.org/) that I'll introduce below). That led
some authors to affirm that Markdown suffered from [bad parenting](https://blog.codinghorror.com/responsible-open-source-code-parenting/).
To me, there is no reason to blame John Gruber for not having written a complete
specification. It is however reasonable to consider that this is another partial
explanation of the current variability among Markdown flavors. Let me introduce
some of them:

- [MultiMarkdown](fletcherpenney.net/multimarkdown/) [<i class="fab fa-github" aria-hidden="true"></i>](https://github.com/fletcher/MultiMarkdown) by Fletcher Penney:

> MultiMarkdown, or MMD, is a tool to help turn minimally marked-up plain text into well formatted documents, including HTML, PDF (by way of LaTeX), OPML, or OpenDocument (specifically, Flat OpenDocument or ‘.fodt’, which can in turn be converted into RTF, Microsoft Word, or virtually any other word-processing format).

> MMD is a superset of the Markdown syntax, originally created by John Gruber. It adds multiple syntax features (tables, footnotes, and citations, to name a few), in addition to the various output formats listed above (Markdown only creates HTML). Additionally, it builds in “smart” typography for various languages (proper left- and right-sided quotes, for example).

> MultiMarkdown started as a Perl script, which was modified from the original Markdown.pl.


- [PHP Markdown Extra](https://michelf.ca/projects/php-markdown/extra/) by Michel Fortin:

> Markdown Extra is an extension to PHP Markdown implementing some features
currently not available with the plain Markdown syntax.


- [kramdown](https://kramdown.gettalong.org/) [<i class="fab fa-github" aria-hidden="true"></i>](https://github.com/gettalong/kramdown) by Thomas Leitner:

> kramdown (sic, not Kramdown or KramDown, just kramdown) is a free MIT-licensed
Ruby library for parsing and converting a superset of Markdown. It is completely
written in Ruby, supports standard Markdown (with some minor modifications) and
various extensions that have been made popular by the PHP Markdown Extra
package and Maruku.


Even though all flavors are very alike, they are superset of the
original Markdown with flavor-specific variations. Therefore when asking
"*how can I change the size of an image using Markdown?*", a feature that is
not in the original syntax, there may be a flavor-specific way to do it and
potentially one answer per flavor. This explains the confusion when somebody
asks such a question on [StackOverflow](https://stackoverflow.com/questions/14675913/changing-image-size-in-markdown.).
So... when asking a question about Markdown, beware of the flavor!



## A specification

Markdown would doubtlessly benefit from being clearly defined, *i.e.* having
a minimal set of tags (say the one of the original Markdown) and an accurate
description of what a Markdown-to-HTML converter must do (harder that it sounds,
think about how to deal with line breaks, nested tags, interference with html
tags...). This could be a core Markdown on the top of which extensions (flavors)
are built, that would be just great (again it is not the current Markdown landscape)!
Fortunately, a bunch of highly capable people have decided to tackle this
challenge and have created [CommonMark](http://commonmark.org/) that provides:

1. a specification for Markdown, version 0.28 currently: http://spec.commonmark.org/

2. useful links to implementations in various programming languages: https://github.com/commonmark/CommonMark/wiki/List-of-CommonMark-Implementations

3. a great tutorial: ["LEARN MARKDOWN IN 60 SECONDS"](http://commonmark.org/help/).

I really hope this will soon represent a standard. This would be very useful to
switch from one converter to another without worrying about its behavior. You
might think this is only for advanced users, well it is not! If you
use Markdown in different websites, different applications, you are very likely
switching from one converter to another on a regular basis! And you probably do
so because... Markdown is everywhere :fire:!




## Everywhere!

It would be a tedious work to provide an exhaustive list of the usages of
Markdown on the Internet. I have therefore decided to discuss below a curated
set of examples I am familiar with.

In any situation involving the edition of online content, the usage of Markdown
brings many advantages (as it was designed for such purpose :sweat_smile:).
It is therefore not surprising that Markdown is supported by tons websites and
web applications where people edit content. For instance, you can use Markdown
to edit a question or an answer on
[StackOverflow](https://stackoverflow.com/editing-help) or to exchange
with you colleagues on [Gitter](https://gitter.im/).

If you create you own website, you could easily find a way to edit content
with Markdown. Indeed, most famous Content Management Systems (CMS) such as
[Wordpress support Markdown](https://en.support.wordpress.com/markdown/) as well
as static site generators such as [Hugo](https://gohugo.io/) or
[Jekyll](https://jekyllrb.com/). Furthermore, when markdown support is not a
primary feature, you should easily find a plugin that brings such support.
For instance, if you blog with [Medium](https://medium.com/) you can use
[markdown to Medium](http://markdowntomedium.com/).

Speaking about plugins [Markdown Here](https://markdown-here.com/) (by Adam
Pritchard) allows you to write email in Markdown! I really enjoy it, so I've
decided to make a short screencast of me using it, which is what I do pretty
much everyday! Note that I use the plugin for Thunderbird (Thunderbird 52.7.0).


<video width="100%" controls>
 <source src="assets/ex_markdownhere.webm" type="video/webm">
 Your browser does not support the video tag.
</video>


Markdown can also be used to edit the content in HTML presentation frameworks
such as [reveal.js](https://revealjs.com/#/) or [remark](https://remarkjs.com/#1).
For developers, Markdown has become a natural syntax to write README and Wiki files,
again easy-to-read and easy-to-write! But also, as a markup language, it is also
easy-to-format! That's how a README file turns into a very helpful and good-looking
webpage on Github projects (see the [README of this website](https://github.com/inSileco/inSileco.github.io))!

Last but not least, Markdown is now extensively used to produce dynamic documents
including dynamic webpages where text and code are integrated together. For instance,
you can format your text with Markdown in [Jupyter Notebooks](http://jupyter.org/).
Similarly, R users now extensively use [Rmarkdown](https://rmarkdown.rstudio.com/) to
edit reports, create package documentations, presentations and websites. In
particular, we have created this blog with
[Blogdown](https://bookdown.org/yihui/blogdown/) and use Markdown and R Mardown
for our posts. By the way, do you remember what I said previously about switching
from one converter to another? Well we do so, as [Blogdown allows us to use two
different converter](https://github.com/rstudio/blogdown/issues/171).




## Markdown for other markup languages?

Once again Markdown is a lightweight markup language that emphasize plain-text
readability and was originally designed to be converted to HTML. HTML is one
among a long [list of markup languages](https://en.wikipedia.org/wiki/List_of_markup_languages),
though one of the most widely used. So now let's consider a second
markup language also designed to format content, say [LateX](https://www.latex-project.org/)
(itself built on the top of TeX :smile_cat:!), then why not using Markdown
for this second markdown language, it *only* requires a new converter and this
would allow us to use markdown for two different markup languages :trophy::


HTML <i class="fa fa-long-arrow-left" aria-hidden="true"></i> Markdown <i class="fa fa-long-arrow-right" aria-hidden="true"></i> LateX

We can easily imagine Markdown been used with as many markup languages as desired.
Given that Markdown is rather minimal, Markdown represents a useful subset for
all those languages (assuming we are talking about markup language that are
concerned at least partially by plain-text readability). What if we could do
even more! What if we create an abstract representation of a markup language
that would act as an universal language and allow to do a conversion
between many markup languages, *i.e.*:

 Markup 1 <i class="fa fa-arrows-h" aria-hidden="true"></i> Universal  <i class="fa fa-arrows-h" aria-hidden="true"></i> Markup 2.

Well, that is pretty much what [Pandoc](https://pandoc.org/) has to offers! From
https://hackage.haskell.org/package/pandoc :

> In contrast to most existing tools for converting Markdown to HTML, pandoc has
> a modular design: it consists of a set of readers, which parse text in a given
> format and produce a native representation of the document, and a set of writers,
> which convert this native representation into a target format. Thus, adding an
> input or output format requires only adding a reader or writer.

So now we have this fantastic tools thanks to John MacFarlane (I won't give much
details about Pandoc, which deserves a post it-self, if not more) we can perform
the conversion between many markup languages, then Markdown becomes very useful
minimal syntax we can use keeping in mind that it will be converted into
a richer/heavier markup language. Typically, you can use Markdown to produce
pdf files as follows: Markdown <i class="fa fa-long-arrow-right" aria-hidden="true"></i> LateX and then Latex is converted into a pdf file! Remember that, irrespective of the flavor, Markdown only accounts for a restricted set of tags. So if you want to further format your document you can actually use other tags of the
specific markup language you will convert your file into.
In this case you can use Pandoc afterwards to convert your file into another
markup language if desired.



## Is Markdown suitable for academic writing?

Very good question! Truncated answer "No" :disappointed:. Less truncated
answer "No, UNLESS you use an adequate flavor of Markdown and an awesome
tool such as Pandoc!" :sweat_smile:. Indeed the original version
of Markdown, many essential formatting aspects are not included, among them,
the most important for academic writing are:

1. tables
2. support for math editing
3. references (crucial)

Given when I wrote above, a solution would be to use Markdown in combination
with another markup language such as Latex and most of the document would actually
be written in Latex, so would it still be academic writing with Markdown? No!

Fortunately, the needs of academics writing are covered by [Pandoc's Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown)! So,

1. several ways to create [tables](https://pandoc.org/MANUAL.html#tables)

2. [Latex's syntax for math editing](https://pandoc.org/MANUAL.html#math)

3. there is a specific Pandoc filter [pandoc-citeproc](https://github.com/jgm/pandoc-citeproc) that deal very well with citations.

So, thanks to Pandoc, Markdown it is suitable for academic writing.
There are even more advantages such ad using [templates](https://pandoc.org/MANUAL.html#templates)
and benefit from [storing metadata of your manuscript directly in your file](https://pandoc.org/MANUAL.html#metadata-blocks) fir instance through YAML header (another
potential post topic thanks to Clark Evans). Using Markdown also means for
the authors to switch from a classical WYSIWYG tool to a Markdown editor. I
personally use [Atom](https://atom.io/) with the following packages: [markdown preview enhanced](https://atom.io/packages/markdown-preview),
[autocomplete-bibtex](https://atom.io/packages/autocomplete-bibtex) (to handle reference) and [document-outline](https://atom.io/packages/document-outline) (thanks [@tpoi](https://twitter.com/tpoi) for the suggestion about the latter).

If you looking for more details about this, I highly recommend the tutorial of [Software Carpentry on the topic](http://swcarpentry.github.io/modern-scientific-authoring/) and also the
reading of different points of view such as
["Why scholars should write in Markdown"](http://blogs.harvard.edu/pamphlet/files/2014/08/markdownpost-amsart.pdf) by Stuart M. Shieber
(more articles listed in the resource section).


A final note about reviews. I personally write my review in Markdown and convert
them in `pdf`. I then copy/paste the Markdown file and attache the `pdf` which
is Ok, but it would be even better if the zone where I paste the markdown-formatted
review could be converted into a nicely formatted HTML page. So far, I never came
across a journal that offers such feature but I am convinced that some journals
actually support markdown for reviews. I am glad that [Peer Community In](https://peercommunityin.org/)
offers such feature though I have not seen it in action so far!







## Resources

While I was writing this post I realize that just as Markdown is, resources
are everywhere! I though it would be useful to end this posts by providing a
personal selection of online material.
Before proceeding, I shall mention the existence of several [Awesome lists](https://github.com/sindresorhus/awesome) where you will find even more
resources. Even better, a [list that lists such lists](https://github.com/tajmone/markdown-guide#awesomeness).
I recommend you have a look at the list created by [mundimark](https://github.com/mundimark/awesome-markdown) and the one by [BubuAnabelas](https://github.com/BubuAnabelas/awesome-markdown).



### Syntax descriptions / Specification

- [Original markdown](https://daringfireball.net/projects/markdown/syntax)
- [MultiMarkdown](fletcherpenney.net/multimarkdown/)
- [PHP Markdown Extra](https://michelf.ca/projects/php-markdown/extra/)
- [kramdown](https://kramdown.gettalong.org/)
- [Pandoc's Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown)
- [Rmarkdown](https://rmarkdown.rstudio.com/)
- [Wordpress](https://en.support.wordpress.com/markdown/)
- [Comon Mark](http://commonmark.org)



### Publications

- ["A Call for Scholarly Markdown"](http://blogs.plos.org/mfenner/2012/12/13/a-call-for-scholarly-markdown/) by Martin Flenner on Plos Blog

- ["What is Markdown?"](http://kirkstrobeck.github.io/whatismarkdown.com/) by Kirk Strobeck

- ["Why scholars should write in Markdown"](http://blogs.harvard.edu/pamphlet/files/2014/08/markdownpost-amsart.pdf) by Stuart M. Shieber on Harvard blog

- ["Writing Technical Papers with Markdown"](http://blog.kdheepak.com/writing-papers-with-markdown.html) by Dheepak Krishnamurthy

- ["Modern Scientific Authoring"](http://swcarpentry.github.io/modern-scientific-authoring/) on Software Carpentry website

- ["Markdown for Writers"](https://www.kobo.com/ca/en/ebook/markdown-for-writers-1) by Gene Wilburn

- ["reStructuredText vs Markdown for documentation"](http://www.zverovich.net/2016/06/16/rst-vs-markdown.html) by Victor Zverovich


### Editors

There are Markdown-specific editors such as [Abricotine](http://abricotine.brrd.fr/),
[Mou](http://25.io/mou/) or [Stackedit](https://stackedit.io/). Note that most
of modern code editors include specific libraries for highlight syntaxing and
preview of documents written in Markdown. For instance, [Atom](https://atom.io/) includes a [markdown preview](https://atom.io/packages/markdown-preview) as a core
package and a quick search reveals that there are 30 packages available (query on
May 12th 2018, Atom 1.26.1 on my Debian device):


```bash
❯ apm search markdown                                                           [16:01:59]
Search Results For 'markdown' (30)
├── pp-markdown MarkDown Preview (5044 downloads, 5 stars)
├── markdown-fold Fold sections of markdown (255 downloads, 2 stars)
├── tidy-markdown Fix ugly markdown. (26173 downloads, 76 stars)
├── markdown-folding Folds and unfolds markdown headings (2737 downloads, 14 stars)
├── markdown-helper A collection of utilities for working with Markdown files (489 downloads, 2 stars)
├── markdown-it-preview Markdown Preview that supports MarkdownIt plugins on a per-project basis. (274 downloads, 0 stars)
├── linter-markdown Lint markdown on the fly, using remark-lint (73781 downloads, 185 stars)
├── markdown-writer Make Atom a better Markdown editor and an easier static blogging tool. (352666 downloads, 530 stars)
├── tool-bar-markdown-writer A tool-bar plugin that adds Markdown editing actions (23599 downloads, 73 stars)
├── markdown-scroll-sync Auto-scroll markdown-preview tab to match markdown source (86563 downloads, 309 stars)
├── markdown-table-calc Markdown table calculations (21 downloads, 0 stars)
├── markdown-image-paste Just use 'ctrl+v' paste image into markdown (4510 downloads, 7 stars)
├── markdown-up-img You only need to paste the image to the server automatically, and generate the image link. (36 downloads, 0 stars)
├── markdown-img-paste Just use 'ctrl+shfit+v' paste image into markdown (4873 downloads, 7 stars)
├── toggle-markdown-task Toggle completion of tasks in GitHub-flavored Markdown files (3838 downloads, 25 stars)
├── markdown-pdf Convert markdown to pdf, png or jpeg on the fly. (157001 downloads, 739 stars)
├── markdown-toc Generate TOC (table of contents) of headlines from parsed markdown file (40706 downloads, 162 stars)
├── mr-markdown-pdf Convert markdown to pdf, png or jpeg on the hit of a shortcut. (2440 downloads, 3 stars)
├── atom-csv-markdown A short description of your package (3434 downloads, 26 stars)
├── markdown-document Adds tools to make working with long form markdown documents in Atom easier. (2925 downloads, 19 stars)
├── markdown-footnote Inserts a Pandoc compatible Markdown footnote. Uses a 'random' md5 hash to name footnotes (404 downloads, 1 star)
├── language-markdown Adds grammar support for Markdown (including Github flavored, AtomDoc, Markdown Extra, CriticMark, YAML/TOML front-matter, and R Markdown), and smart context-aware behavior to lists, and keyboard shortcuts for inline emphasis. (171358 downloads, 231 stars)
├── markdown-commander Commands for authoring Markdown, inspired by iA Writer (335 downloads, 2 stars)
├── markdown-table-editor Markdown table editor/formatter (19863 downloads, 52 stars)
├── markdown-assistant assistant for markdown writer which can upload image from clipboard (5436 downloads, 7 stars)
├── markdown-image-insertion Simple helper for inserting images into markdown documents. (1045 downloads, 3 stars)
├── markdown-tool A markdown helper tool. Such as Insert Time and Insert Pic. (206 downloads, 1 star)
├── MDBP-markdown-book-preview Atom Package markdown preview with VivlioStyle (135 downloads, 0 stars)
├── markdown-to-asciidoc An Atom plugin for converting a markdown file to asciidoc. Wraps the markdown-to-asciidoc plugin for the IntelliJ Java IDE. Uses node-java as the node.js bridge to the Java converter class. (597 downloads, 1 star)
└── markdown-badges-snippets awesome markdown snippets for markdown to insert badges elegantly (135 downloads, 1 star)
```

### Cheat sheets

- https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
- https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf

<br>

<div class="endpost">See ya next post! :fireworks:</div>
