---
title: "Mathematical Modelling in Ecology: a taste of differential equations in R"
author: [azenor, willian]
date: 2018-08-06
tags: [Models in ecology, Ordinary differential equation, Mathematics, R]
tweet: "Mathematical Modelling in Ecology: a taste of differential equations in R"
draft: true
navposts:
  home:
  next:
---

## Why models?

We are all modellers, and so since a long time. The first drawings you did as a child, whether it was a cloud, your house or members of your family, were models . Similarly, if you imagine the outcome of a war, an epidemic, a migration crisis, you are running an implicit model.

Indeed, a model is an abstraction of the reality, that allows people to focus on the essentials by keeping out non-essential details. As Levin said in 1992:

> A good model does not attempt to reproduce every detail of the biological system (...) The objective of a model should be to ask how much detail can be ignored without producing results that contradict specific sets of observations, on particular scales of interest.

Or simply:

<center>
<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">All good models start as good abstractions <a href="https://t.co/FKHfbIahcQ">https://t.co/FKHfbIahcQ</a></p>&mdash; Timothée Poisot (@tpoi) <a href="https://twitter.com/tpoi/status/1026142588435423232?ref_src=twsrc%5Etfw">August 5, 2018</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</center>

Hence, as George E. P. Box, famously said in 1976, "All models are wrong but some are useful".
Indeed, models are useful and, thus, are widely used. They are pervasive in biology. For instance, out of 231 articles published in the journal Ecology in 2001, 100% of them used a mathematical model, in the broadest sense (including statistical or phylogenetic analyses with a mathematical basis).
Models can be used for many different reasons. When people think of why building models, the common answer is "to make predictions". However, models can also be useful to explain, to guide data collection, to raise new questions, to train practitioners... (more [here](http://jasss.soc.surrey.ac.uk/11/4/12.html)).

## Classification

Mathematical models may take different forms for different objectives.
It is a general term to describe the use of equations to solve or understand a problem.
The first form to come in mind is **statistical models** that, based in a probabilistic thinking, uses data to describe or predict a process.
Other forms of mathematical models are more deterministic, often used to study the dynamic of a process.
These **dynamical models** can be expressed by differential or integral equations.
A more complete discussion in the difference between statistical and dynamical models can be found [here](http://sherrytowers.com/2013/08/03/module-ii-the-difference-between-mathematical-and-statistical-modelling-plus-some-more-basics-of-r/).
In this first series of posts on [models in ecology](tagLink), we will stay simple and focus only on differential equations.

## Outline

1 - **TITLE**: introduces differential equations and show with a toy model how to code and visualize its dynamical in R.

2 - **TITLE**: introduces the theoretical concepts in analyzing and solving differential equations.

3 - **TITLE**: shows the existent R packages and functions used to analyze and solve differential equations.

4 - **TITLE**: discuss the graphical representation and a taste of sensitivity analyses.

To navigate through the post series, use the three following symbols <i class="fa fa-home fa-2x" aria-hidden="true"></i> to go (back) to this home page, <i class="fa fa-arrow-circle-o-right fa-2x" aria-hidden="true"></i> to go to the previous post and <i class="fa fa-arrow-circle-o-right fa-2x" aria-hidden="true"></i> to go to the next post (or to go to a specific post below).
Also to access the full list of post of the series, click on the tag [Ordinary differential equation]().

## References

http://www.open.edu/openlearn/science-maths-technology/computing-and-ict/models-and-modelling/content-section-2.1 :

Epstein, Joshua M. (2008). 'Why Model?'. Journal of Artificial Societies and Social Simulation 11(4)12 <http://jasss.soc.surrey.ac.uk/11/4/12.html>

Otto, S. P., & Day, T. (2011). A biologist's guide to mathematical modeling in ecology and evolution. Princeton University Press.
