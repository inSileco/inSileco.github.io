---
title: Markdown everywhere!
author: [kevin]
reviewer:
date: 2018-05-10
tags: [Markdown, markup language]
draft: true
tweet: "Markdown everywhere!"
estime: 10
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



## Origin and philosophy

Scrolling down the Wikipedia page, you'll learn that Markdown was first
released in 2004 by John Gruber and if you look up Markdown on the Internet,
you may rapidly find the *orignal webpage* on daringfireball.net,
*i.e.* https://daringfireball.net/projects/markdown/. There you will find a
description of the original syntax and an explanation about how the conversion
is made, *i.e.* the call to a [perl](https://www.perl.org/) parser `Markdown.pl`
and even a small web application to try it https://daringfireball.net/projects/markdown/dingus.


As [John Gruber wrote](https://daringfireball.net/projects/markdown/syntax):

> Markdown is intended to be as easy-to-read and easy-to-write as is feasible.

and it really is! Let me pick, copy and slightly modify an example from the
[daringfireball](https://daringfireball.net/projects/markdown/basics) to compare
the two versions:  

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

If not before, now you should get the play on words: HTML (HyperText Markup Language) is a [markup language](https://en.wikipedia.org/wiki/Markup_language) and Markdown is a [Lightweight Markup Language (LML)](https://en.wikipedia.org/wiki/Lightweight_markup_language) that reduces the length of the most commonly
used tags.

Broadly speaking, the philosophy behind Markdown is something omnipresent
in computer science. Indeed Given a specific langage, a create easier
that how we end up hivong code easy to read such as C, FORTAN, Python, ...
while utilimatiely the mchine langage is used. [CoffeeScript](http://coffeescript.org/)

https://en.wikipedia.org/wiki/Syntactic_sugar


You have a very efficient and langage
In some sense markdown in a higher langage just as C in

A good example in Coffee script: http://coffeescript.org/
A it different is not a programming lanage but a this has different consequences.


x
## Many flavors

John Gruber released Markdown on dairingball on 2004, he provided the syntax
the perl paser, but it did not purdue and did not provide a complete specification
so that would allow one to wirte a paser in any langage and produce the same result.
That lead some blogger to assert that Markdown suffered from [bad parenting]( https://blog.codinghorror.com/responsible-open-source-code-parenting/).

As a consequence different flavors were created to expand the original
version for different purpose, among them:


- [MultiMarkdown](fletcherpenney.net/multimarkdown/) [<i class="fa fa-github" aria-hidden="true"></i>](https://github.com/fletcher/MultiMarkdown) by Fletcher Penney:

> MultiMarkdown, or MMD, is a tool to help turn minimally marked-up plain text into well formatted documents, including HTML, PDF (by way of LaTeX), OPML, or OpenDocument (specifically, Flat OpenDocument or ‘.fodt’, which can in turn be converted into RTF, Microsoft Word, or virtually any other word-processing format).

> MMD is a superset of the Markdown syntax, originally created by John Gruber. It adds multiple syntax features (tables, footnotes, and citations, to name a few), in addition to the various output formats listed above (Markdown only creates HTML). Additionally, it builds in “smart” typography for various languages (proper left- and right-sided quotes, for example).

> MultiMarkdown started as a Perl script, which was modified from the original Markdown.pl.

- [PHP Markdown Extra](https://michelf.ca/projects/php-markdown/extra/) by Michel Fortin:

> Markdown Extra is an extension to PHP Markdown implementing some features currently not available with the plain Markdown syntax.

- [kramdown](https://kramdown.gettalong.org/) [<i class="fa fa-github" aria-hidden="true"></i>](https://github.com/gettalong/kramdown):

> kramdown (sic, not Kramdown or KramDown, just kramdown) is a free MIT-licensed Ruby library for parsing and converting a superset of Markdown. It is completely written in Ruby, supports standard Markdown (with some minor modifications) and various extensions that have been made popular by the PHP Markdown Extra package and Maruku.


As a consequence, even though all flavors are very alike, they have the difference
and this leads to many confucion when asking ""
see https://stackoverflow.com/questions/14675913/changing-image-size-in-markdown.
Better refer to a specific and a detailed response to should inclue difference
bewteen


## A specification

The main reason of the di

- Specification is something major for any langage. (C is not well specified)
- Markdown not well specified, parser Perl not clear.


- [CommonMark](http://commonmark.org/)
- Specification: http://spec.commonmark.org/ 0.28
- implementations https://github.com/commonmark/CommonMark/wiki/List-of-CommonMark-Implementations
- also a tutorial "learn markdown in 60 seconds"

- another ref: https://www.kobo.com/ca/en/ebook/markdown-for-writers-1





## Everywhere!

It would be a tedious work to provide an exhaustive list of the usages of
Markdown. I have therefore decided to discuss a couple of example I am familiar
to illustrate different way to take advantage from Markdown.

In any situation involving the editing of online content, the usage of Markdown
brings many advantages (well, it was design for such purpose :smirk:). It is therefore
not surprising that Markdown is supported by many websites and web applications where people edit content. For instance, you can use Markdown to edit a question or an answer on [StackOverflow](https://stackoverflow.com/editing-help) or to exchange
with you colleagues on [Gitter](https://gitter.im/). When you are writing
content for your own website, you may find a solution to use Markdown.
Most famous Content Management Systems (CMS) such as [Wordpress support Markdown](https://en.support.wordpress.com/markdown/). Static Website
Generator such as Hugo and Jekyll always include such feature.
When markdown support is not a primary feature, you will likely find a pluggin/tool
that will bring you this feature. For instance if you blog with [Medium](https://medium.com/) you can use  [markdown to Medium](http://markdowntomedium.com/). Speaking about pluggins [Markdown Here](https://markdown-here.com/) s a great one that lead you create email in
Markdown. I did a quick screecast:


<video width="100%" controls>
 <source src="assets/ex_markdownhere.webm" type="video/webm">
 Your browser does not support the video tag.
</video>


Also tools to create HTML presentation Remark

For developers, Markdown becomes a natural for readme and wiki: easy-to-writem easy-to-read but also easy-to-format!




### Jupyter notebook

Text can be added to IPython Notebooks using Markdown cells. Markdown is a popular markup language that is a superset of HTML. Its specification can be found here:

http://daringfireball.net/projects/markdown/

<!-- I wonder why they do not use common mark -->


### R

- [Rmarkdown](https://rmarkdown.rstudio.com/) has beconme very puplar,.

- bookdown

- Blogdown they are two ways to use markdown! and use for this blog

Rmarkdown propose more than HTML, how?





## More than an HTML sugar syntatic?

### Let's go back to the principle

Markdown <i class="fa fa-long-arrow-right" aria-hidden="true"></i> HTML

But we can easily imagine equivalent

Markdown <i class="fa fa-long-arrow-right" aria-hidden="true"></i> LaTex

And then you use other. It works well with html where you can create division
where this will be the text converted and the and wokr the visual rendering
using CSS. You should however sonetine integrate extension table equations
and you can actually include balsie. Could be a bit confusing at forst but always
renmender there is a conversion so you actually should thing that tou are
writting n HTML or latex and Mardown in no more but no less that a easier to
write,.

In the rest of the section I develop how this is used in a example.



### Pandoc to the rescue

This includes another dimensions happening with

Easy but also very confusing and many questions raised with Rmarkdown about what I can do and what I cannot !



### For academic writing?

  http://swcarpentry.github.io/modern-scientific-authoring/

  Discussion about needed more unless a template doem which IMHO should be the case.

<!-- Needs to know about Latex -->


## Resources

While I was writing this post I realize that just as Mardown is, resources
are everywhere!


- Wordpress: https://en.support.wordpress.com/markdown/

Editor http://25.io/mou/
package mardown preview https://atom.io/packages/markdown-preview

### Cheat sheets

- https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
- https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf
- https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf


## Concluding remarks

Instead

Here I ask 2 questions and propose and answer. I am not a specialist so it's very subjectve and I

- Why not replacing all common HTML tags by their associated Markdown tag?

- Is it worth learning HTML/CSS/Latex (among other) while I can rather stick to Markdown?

Of course.
