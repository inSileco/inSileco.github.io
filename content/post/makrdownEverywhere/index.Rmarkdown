---
title: Markdown everywhere!
author: [kevin]
reviewer:
date: 2018-05-10
tags: [Markdown, markup language]
draft: true
tweet: "Markdown everywhere!"
estime: 15
---


According to [Wikipedia](https://en.wikipedia.org/wiki/Markdown):

> Markdown is a lightweight markup language with plain text formatting syntax.
It is designed so that it can be converted to HTML and many other formats using
a tool by the same name Markdown is often used to format readme files, for
writing messages in online discussion forums, and to create rich text using a
plain text editor. As the initial description of Markdown contained ambiguities
and unanswered questions, many implementations and extensions of Markdown
appeared over the years to answer these issues.

Here I'd like to expand on this and develop why Markdown is so common,
why I think it is for the best and why I think it could be useful for academics.
T


## Origin and philosophy

If you scroll down the Wikipedia page, you should learn that Markdown was first
released in 2004 by John Gruber and you will find the URL of the *orignal
webpage* on daringfireball.net, *i.e.* https://daringfireball.net/projects/markdown/.
There you will find:

1. details about the Markdown's philosophy,
1. a description of the original syntax,
2. how the conversion is made, *i.e.* a call to a markdown-to-html converter written in [Perl](https://www.Perl.org/): `Markdown.pl`,
4. a small [web application](https://daringfireball.net/projects/markdown/dingus) to try Markdown.


As [John Gruber wrote](https://daringfireball.net/projects/markdown/syntax):

> Markdown is intended to be as easy-to-read and easy-to-write as is feasible.

and it really is! Let me select, copy and slightly modify an example from the
[daringfireball](https://daringfireball.net/projects/markdown/basics) to compare
the Markdown text and the equivalent written in HTML, that is what the Perl converter
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
is a [Lightweight Markup Language (LML)](https://en.wikipedia.org/wiki/Lightweight_markup_language)
that reduces the length of the most commonly used tags for content editing
in HTML, so Mark~~up~~down.

Broadly speaking, the idea of creating an language on the top of
another for efficiency purposes is very common in computer science. It is
actually the principle that explains why we use language such as C, Python or
Rust, called [high level programming languages](https://en.wikipedia.org/wiki/High-level_programming_language) instead
of programming directly using machine language (would be a pain in the #!@?#),
even though ultimately the machine language is used. A good illustration is
[CoffeeScript](http://coffeescript.org/) that is built on the
top of JavaScript:

> The golden rule of CoffeeScript is: “It’s just JavaScript.” The code compiles
one-to-one into the equivalent JS, and there is no interpretation at runtime.
You can use any existing JavaScript library seamlessly from CoffeeScript
(and vice-versa). The compiled output is readable, pretty-printed, and tends to
run as fast or faster than the equivalent handwritten JavaScript.

Markdown is a markup language not a programming language but the approach is
essentially the same. However we should keep in mind that only a very restricted
subset of HTLM tags are covered by Markdown, the rest of HTML tags, if required,
may be used as is. You probably wonder why not expanding the number of tags
covered by Markdown, right? Well, this is one of the main reason why there are
several flavors of Markdown available!



## Many flavors

John Gruber released Markdown on his website on 2004. Despite the substantial
information given about Markdown, he did not provide a complete specification,
*i.e.* an unequivocal set of instructions that would allow anyone to write a
Markdown converter in any programming languages that would have the same behavior.
(note that reading the code of the Perl converter does not seem to remove all ambiguities,
according to the authors of [CommonMark](http://spec.commonmark.org/) I'll
introduce below). That led some authors to consider that Markdown suffered from [bad parenting]( https://blog.codinghorror.com/responsible-open-source-code-parenting/).
I think there is no reason to blame John Gruber for not having written a complete
specification. It is however reasonable to consider that this is another partial
explanation of the current variability among Markdown flavors. Let me introduce
some of them:

- [MultiMarkdown](fletcherpenney.net/multimarkdown/) [<i class="fa fa-github" aria-hidden="true"></i>](https://github.com/fletcher/MultiMarkdown) by Fletcher Penney:

> MultiMarkdown, or MMD, is a tool to help turn minimally marked-up plain text into well formatted documents, including HTML, PDF (by way of LaTeX), OPML, or OpenDocument (specifically, Flat OpenDocument or ‘.fodt’, which can in turn be converted into RTF, Microsoft Word, or virtually any other word-processing format).

> MMD is a superset of the Markdown syntax, originally created by John Gruber. It adds multiple syntax features (tables, footnotes, and citations, to name a few), in addition to the various output formats listed above (Markdown only creates HTML). Additionally, it builds in “smart” typography for various languages (proper left- and right-sided quotes, for example).

> MultiMarkdown started as a Perl script, which was modified from the original Markdown.pl.


- [PHP Markdown Extra](https://michelf.ca/projects/php-markdown/extra/) by Michel Fortin:

> Markdown Extra is an extension to PHP Markdown implementing some features
currently not available with the plain Markdown syntax.


- [kramdown](https://kramdown.gettalong.org/) [<i class="fa fa-github" aria-hidden="true"></i>](https://github.com/gettalong/kramdown):

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
a minimal set of tags (say the one of the original Markdown) and a accurate
description of what a Markdown converter must do (it harder that it sounds,
think about how to deal with line breaks, nested tags, interference with html
tags...). This could be a core Markdown on the top of which extensions are built,
and that would be the different flavors, that would be great! Fortunately,
a couple of highly capable people have decided to tackle this challenge and
have created [CommonMark](http://commonmark.org/). The website provides:

1. a specification for Markdown, version 0.28 currently: http://spec.commonmark.org/

2. links to implementations in various programming languages: https://github.com/commonmark/CommonMark/wiki/List-of-CommonMark-Implementations

3. a great tutorial: ["LEARN MARKDOWN IN 60 SECONDS"](http://commonmark.org/help/).

I really hope this will soon represent a standard. This would be very useful to
switch from one converter to another without worrying about its behavior. You might
think this is only for advanced users but it is not. If you use Markdown in
different websites, you regularly switch from one converter to another! and you
probably do so because... Markdown is everywhere!




## Everywhere!

It would be a tedious work to provide an exhaustive list of the usages of
Markdown on the Internet. I have therefore decided to discuss below a curated
set of examples I am familiar with.

In any situation involving the edition of online content, the usage of Markdown
brings many advantages (well, it was designed for such purpose :sweat_smile:).
It is therefore not surprising that Markdown is supported by tons websites and
web applications where people edit content. For instance, you can use Markdown
to edit a question or an answer on [StackOverflow](https://stackoverflow.com/editing-help) or to exchange
with you colleagues on [Gitter](https://gitter.im/).

If you create you own website, you could easily find a way to edit content with Markdown. Indeed,
most famous Content Management Systems (CMS) such as [Wordpress support Markdown](https://en.support.wordpress.com/markdown/) and static site
generator such as [Hugo](https://gohugo.io/) and [Jekyll](https://jekyllrb.com/)
always include such feature. Furthermore, when markdown support is not a primary feature, you will likely find a pluggin/tool
that will bring you this feature, for instance, if you blog with [Medium](https://medium.com/) you can use [markdown to Medium](http://markdowntomedium.com/).

Speaking about plugins [Markdown Here](https://markdown-here.com/) allows you to write email in Markdown. I really enjoy Markdown Here, I use the plugin for Thunderbird (curenlty I use
Thunderbird 52.7.0) pretty much everyday, let me show you!


<video width="100%" controls>
 <source src="assets/ex_markdownhere.webm" type="video/webm">
 Your browser does not support the video tag.
</video>


Markdown can also be used to edit your content in HTML presentation frameworks
such as [reveal.js](https://revealjs.com/#/) and [remark](https://remarkjs.com/#1).
For developers, Markdown has become a natural syntax to write README and Wiki files,
again easy-to-read, easy-to-write! And as it is a markup language, it is also
easy-to-format! That's how a README file turned into a very helpful and good-looking
webpage on your Github projects!

Last but not least, Markdown is now extensively used to produce dynamic documents /
dynamic webpages where text and code are integrated together. For instance,
you can format your text with Markdown in [Jupyter Notebooks](http://jupyter.org/).
R users now extensively use  [Rmarkdown](https://rmarkdown.rstudio.com/) to
edit reports, create package documentations, presentation and website.
We have created this blog with Blogdown and so widely use Markdown
in our posts. By the way, do you remember what I've said about switching
from one converter to another? Well we do so! We used blackfriday and
pandoc to convert our post, why? [Look at this](https://github.com/rstudio/blogdown/issues/171)




## Markdown for other markup languages?

Once again Markdown is a Lightweight Markup Language and was originally designed
to be converted to HTML. HTML is one among a long [list of markup languages](https://en.wikipedia.org/wiki/List_of_markup_languages). It is however
designed to ease the writing of formatted text in HTML. So, let's consider another
Markup language also designed to format text, say [LateX](https://www.latex-project.org/)
(which itself built on the top of TeX :smile_cat:!). Why not using Markdown and
another converter to ease the use of the second language which would also
mean that we can use markdown for two different language.

Markdown <i class="fa fa-long-arrow-right" aria-hidden="true"></i> HTML

Markdown <i class="fa fa-long-arrow-right" aria-hidden="true"></i> LateX

We can also image an universal intermediare, an abstract representation

 Markdown <i class="fa fa-long-arrow-right" aria-hidden="true"></i> LU <i class="fa fa-long-arrow-right" aria-hidden="true"></i> L2


 L1 <i class="fa fa-long-arrow-right" aria-hidden="true"></i> LU <i class="fa fa-long-arrow-right" aria-hidden="true"></i> L2


That is pretty much what [Pandoc](https://pandoc.org/) offers! From
https://hackage.haskell.org/package/pandoc :

> In contrast to most existing tools for converting Markdown to HTML, pandoc has
a modular design: it consists of a set of readers, which parse text in a given
format and produce a native representation of the document, and a set of writers,
which convert this native representation into a target format. Thus, adding an
input or output format requires only adding a reader or writer.


I won't give much details about Pandoc, which deserves a post it-self (if not more than),
let simply assume that within a common line like `pandoc cool.mu1 -o cool.mu2`
does a conversion from to another.



## Is Markdown suitable for academic writing?

Very good question! Truncated answer "No" :disappointed:. Less truncated
answer "No answer UNLESS you use an enhanced flavor of Markdown and an awesome
tool such as Pandoc!" :sweat_smile:.  Indeed if you consider the orignal version
of pandoc are, many essential formatting aspects are not included, among them, the most
important of them are:

- annotations (admittedly not vital)
- tables
- equations (a support for math editing at large)
- references (crucial)

Fortunately Pandoc's Markdown covers such needs. Also an awesome associated tool
[pandoc-citeproc](https://github.com/jgm/pandoc-citeproc) to deal with citations.
Well the only think is then to move away form

Markdown <i class="fa fa-long-arrow-right" aria-hidden="true"></i> LateX <i class="fa fa-long-arrow-right" aria-hidden="true"></i> pdf


Markdown <i class="fa fa-long-arrow-right" aria-hidden="true"></i> docx

Atom preview marjdown autocomplete bibtex and then you go to go.!

A very rich tutorial on [swcarpentry](http://swcarpentry.github.io/modern-scientific-authoring/)

["Why scholars should write in Markdown"](http://blogs.harvard.edu/pamphlet/files/2014/08/markdownpost-amsart.pdf) by Stuart M. Shieber on Harvard blog. See Publications in Rerouce for more details.


A final note about reviews. I personally write my review in Markdown and convert
them in PDF. I then copy paste the markdown and attache the pdf, I think it makes
sense and it would be even better than the zone where I paste makfdwin be converted
into a nice formatted HTML text. So far, not seen but I am sure some journal
use it and PCI ecology PCI ecology support markdown!









## Resources

While I was writing this post I realize that just as Markdown is, resources
are everywhere! I though it would be useful to end this posts by providing a
personal selection of links below.
Before proceeding, I shall mention the existence of several of [Awesome lists](https://github.com/sindresorhus/awesome) where you will find even more
resources. There is even a [list that lists such lists](https://github.com/tajmone/markdown-guide#awesomeness).
I recommend you have a look at the list created by [mundimark](https://github.com/mundimark/awesome-markdown) and
and the one by [BubuAnabelas](https://github.com/BubuAnabelas/awesome-markdown).



### Syntax descriptions / Specification

- [Original markdown](https://daringfireball.net/projects/markdown/syntax)
- [MultiMarkdown](fletcherpenney.net/multimarkdown/)
- [PHP Markdown Extra](https://michelf.ca/projects/php-markdown/extra/)
- [kramdown](https://kramdown.gettalong.org/)
- [Pandoc's Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown)
- [Rmarkdown](https://rmarkdown.rstudio.com/)
- [Wordpress](https://en.support.wordpress.com/markdown/)
- [Comon Mark](http://commonmark.org)



### Publications / articles / discussion


- ["What is Markdown?"](http://kirkstrobeck.github.io/whatismarkdown.com/) by Kirk Strobeck

- ["A Call for Scholarly Markdown"](http://blogs.plos.org/mfenner/2012/12/13/a-call-for-scholarly-markdown/) by Martin Flenner on Plos Blog

- ["Why scholars should write in Markdown"](http://blogs.harvard.edu/pamphlet/files/2014/08/markdownpost-amsart.pdf) by Stuart M. Shieber on Harvard blog

-  [Writing Technical Papers with Markdown](http://blog.kdheepak.com/writing-papers-with-markdown.html) by Dheepak Krishnamurthy

- [Modern Scientific Authoring](http://swcarpentry.github.io/modern-scientific-authoring/02-markdown.html) on Software Carpentry website

- ["Markdown for Writers"](https://www.kobo.com/ca/en/ebook/markdown-for-writers-1) by Gene Wilburn



### Editors

There are specific editor such as [Abricotine](http://abricotine.brrd.fr/),
[Mou](http://25.io/mou/) or [Stackedit](https://stackedit.io/). Most of modern
code editor includes specific library for highlight syntaxing and
preview. For instance [Atom](https://atom.io/) includes a [markdown preview](https://atom.io/packages/markdown-preview) a core
package and a quick search show that there 30 packages (querry on
May 12, I use atom 1.26.1 on my debian device), I personally enjoy the [markdown preview enhanced](https://atom.io/packages/markdown-preview) package.


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
