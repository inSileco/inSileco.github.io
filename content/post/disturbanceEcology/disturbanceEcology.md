---
title: Disturbance Ecology Series
author: [david]
reviewer:
date: 2018-07-01
tags: [Disturbance Ecology, ecology, disturbance, model, population, community]
draft: true
tweet: "Disturbance Ecology Series"
estime: 15
navposts:
  home: disturbanceEcology
  next: geometricGrowth
---

### A naïve beginning

As a PhD student, my thesis is focused on the impacts of multiple environmental
drivers such as fisheries, climate change and coastal development on ecological
communities, from phytoplankton to marine mammals. As I was writing my
research proposal a couple of years ago, I naïvely thought that I would be
spending quite a lot of time in the lab, exposing marine communities to multiple
simultaneous disturbances using increasingly complex experimental designs to
glean empirical insights as to how multiple drivers can act synergistically
to impact ecological communities.

### A transformative epiphany

Fast-forward to now. Here I am, coding life away and founding a blog on
computational ecology with a couple of like-minded friends that I encountered
along the way. Did my research interests change? Not one bit! So what happened?

As it turns out, I quickly realized that the field of disturbance ecology is
cruelly lacking in theory when it comes to multiple disturbances and that
experimental approaches quickly become logistically and analytically intractable
as you add complexity to the overall design.

### A redesigned strategy

Realizing this, I decided to focus part of my thesis on using theoretical ecology
models to investigate how populations of interacting species are likely to be
affected when multiple disturbances are acting simultaneously. I added another
supervisor to my thesis committee, Dominique Gravel, who works on all things
theoretical in the realm of ecology, with a healthy touch of empirical work
thrown in. I also reconnected with R from my master's days and quickly realized
how poorly I was coding back then. In all fairness, I will probably realize
in a few years how poorly I am coding right now!

All of these steps brought me in contact with ecological models, ranging from
static depiction of food webs using network theory to more dynamic models
beginning with the Lotka-Volterra interspecific competition model. Entering
this world, I redesigned my thesis to begin investigating how multiple
disturbances are likely to affect the structure of networks of interacting
species through theory.

### A shortcoming recognition

The reality is, however, that my scientific life thus far has been focused on
empirical studies, conservation and wildlife management, with very little formal
theoretical and mathematical training. This is a problem when your goal is to
use ecological theory for your thesis!

### A learning undertaking

So in an attempt to address my weaknesses and most importantly to finish my
thesis (!!), I decided to teach myself theoretical ecology in the context of
multiple disturbances, and since I learn by doing, I figured I would build a
post series focused on the subject. Of course I will not be doing this from
scratch and I need to give full credit to the book I am heavily relying on to
initiate this work,
[*A Primer of Ecology with R*](https://www.springer.com/gp/book/9780387898810)
by [M. Henry H. Stevens](http://blogs.miamioh.edu/stevens-lab/) [@Stevens_2009].

Posts will begin with the most basic models and grow in complexity. The content
of these post is going to be quite straightforward. First, I will provide a
brief overview of the theory of the topic I working on. Then, I will provide
code to simulate an example of the theory. Then I will tinker around with
relevant variables to simulate disturbances on the populations or communities
that have been simulated. All models presented will be available as functions
in the [`inSilecoMod` package](https://github.com/inSileco/inSilecoMod).

I truly hope you enjoy and that we get to learn something together along the way!

<br/>

### Outline

To navigate through the post series, use the three following symbols <i class="fa fa-home fa-x" aria-hidden="true"></i> to go (back) to this home page, <i class="fa fa-arrow-circle-o-right fa-x" aria-hidden="true"></i> to go to the previous post and <i class="fa fa-arrow-circle-o-right fa-x" aria-hidden="true"></i> to go to the next post (or to go to a specific post below).
Also to access the full list of post of the series, click on the tag [Disturbance Ecology](http://127.0.0.1:4321/tags/disturbance-ecology/).

<br/>

#### **1- Discrete Density-Independent Growth** [<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>]({{< ref "geometricGrowth" >}})

#### **2- Continuous Exponential Growth** [<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>]({{< ref "exponentialGrowth" >}}) 
