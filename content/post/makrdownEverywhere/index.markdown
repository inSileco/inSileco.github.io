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
T


## Origin and philosophy

If you scroll down the Wikipedia page, you should learn that Markdown was first
released in 2004 by John Gruber and you will find the URL of the *orignal
webpage* on daringfireball.net, *i.e.* https://daringfireball.net/projects/markdown/.
There you will find:

1. details about the philosophy behind Markdown,
1. a description of the original syntax,
2. how the conversion is made, *i.e.* the call to a [perl](https://www.perl.org/) parser `Markdown.pl`,
4. a small [web application](https://daringfireball.net/projects/markdown/dingus) to try Markdown.


As [John Gruber wrote](https://daringfireball.net/projects/markdown/syntax):

> Markdown is intended to be as easy-to-read and easy-to-write as is feasible.

and it really is! Let me select, copy and slightly modify an example from the
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

Easy-to-read and easy-to-write indeed! If not before, now you should understand
the play on words: HTML (HyperText Markup Language) is a
[markup language](https://en.wikipedia.org/wiki/Markup_language) and Markdown
is a [Lightweight Markup Language (LML)](https://en.wikipedia.org/wiki/Lightweight_markup_language)
that reduces the length of the most commonly used tags, Mark~~up~~down.

Broadly speaking, the philosophy behind Markdown is actually omnipresent
in computer science. In many case, for efficiency/ergonomy purposes it makes
more sense to write an new language on the top of another. It is the principle
that explains why we use language such as C or Python, called [high level programming
languages](https://en.wikipedia.org/wiki/High-level_programming_language) instead
of programming directly using machine language (would be a pain in the #!@?#),
even though ultimately the machine language is used.

Markdown is not a programming language but a markup language and the power
comes from the chnages in syntax (see [syntactic sugar](https://en.wikipedia.org/wiki/Syntactic_sugar])). an Markdown tags represent a very
restricted subset of HTLM tags (the one for text formating) In this sense it is
very akin to language such as [CoffeeScript](http://coffeescript.org/) but again
Markdown is a markup langage.




## Many flavors

John Gruber released Markdown on dairingball on 2004, he described the original
syntax and the perl parser, but he did not provide a complete specification,
*i.e.* a set of instruction that would allow anyone to write a Markdown parser
in any programming language that would reproduce .
That lead some blogger to write that Markdown suffered from [bad parenting]( https://blog.codinghorror.com/responsible-open-source-code-parenting/).
I think there is no reason to blame John Gruber for not writing a specification,
however, as a direct consequences, different flavors were created to expand the original
version for different purposes, among them:


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
"*how can I change the size of an image using Markdown?*" you don't have
an unique answer, you may have one answer per flavor, well this explains
the confusion on the answer of the question on [StackOverflow](https://stackoverflow.com/questions/14675913/changing-image-size-in-markdown.).
So when asking a question about Markdown, beware of the flavor!


## A specification

As I previously wrote, the main reason of the emergence of partially compatobel  
flavore is that it original Markdown was lacking a specification.
A specification is like a manual of the manual,not the manual to learn
how to do this and that with the langage but what the language is supposed to do,
a complete caracteisation of the lanegge. In the case of Markdown
this means an unequivocal description of what the parser must do. eFortunately,
highly capable people have developed such specification, it is called
[CommonMark](http://commonmark.org/): and provide



- Specification: http://spec.commonmark.org/, currenlty 0.28
- implementations https://github.com/commonmark/CommonMark/wiki/List-of-CommonMark-Implementations
- also a tutorial "learn markdown in 60 seconds"





## Everywhere!

It would be a tedious work to provide an exhaustive list of the usages of
Markdown. I have therefore decided to discuss a couple of example I am familiar
to illustrate different way to take advantage from Markdown.

In any situation involving the editing of online content, the usage of Markdown
brings many advantages (well, it was designed for such purpose :smirk:). It is therefore
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



- another ref: https://www.kobo.com/ca/en/ebook/markdown-for-writers-1

### Pandoc to the rescue

This includes another dimensions happening with

Easy but also very confusing and many questions raised with Rmarkdown about what I can do and what I cannot !



### For academic writing?

  http://swcarpentry.github.io/modern-scientific-authoring/

  Discussion about needed more unless a template doem which IMHO should be the case.

<!-- Needs to know about Latex -->

PCI ecology suupoort markdown!


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


## Concluding questions

Instead of a classical "concluding remark" I would like to end this post by asking
two questions to let you (and me) think about Markdown:

1. Why not replacing the HTML tags by their associated Markdown tag?

2. Is it worth learning HTML/CSS/Latex (among others) while I can rather stick to Markdown?

I am not a specialist of all of this, so my thoughts may not be the best, but here
they are:

- Regarding 1. I think it is useless to replace the specification. HTML has
it owns tag system and it should better keep it that way. Again it makes

- Regarding 2. Yes! Always good to learn, and you need to know more Mardown alone
is no more, but no less that shortcuts and you need to know the oter to use them.
That being said, regarding who you are and you usage you may not need more
many peolple use R markdown and they do not know much more beacuse they
don,t need to, That being saud they often enconter issue...
