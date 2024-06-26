---
title: Inferring transition probabilities with R, Quebec forest as an example
author: [kevin]
date: 2024-06-25
tags: [Markov chain, R]
rpkgs: [msm, INLA, INLAjoint]
tweet: "Inferring transition probabilities with R"
draft: true
review: false
rbloggers: false
estime: 20
bibliography: "/home/kc/git/inSilecoBlog/inSileco.github.io/static/ref/inSileco.bib"
csl: "/home/kc/git/inSilecoBlog/inSileco.github.io/static/ref/peerj.csl"
tldr: |
    Inferring transition probabilities with R. Using msm package and Cox model with INLA.
output:
  blogdown::html_page:
    dev: svglite
---

## Context and problem

### Quebec forest and global change

In Canada, forests are a significant economic asset. [^1].
In Quebec, more specifically, forestry represents 6,4 G\$ of GDP.
Forests are directly impacted via forestry, land-use change, or indirectly by climate change.

https://ressources-naturelles.canada.ca/sites/nrcan/files/forest/sof2023/NRCAN_SofForest_Annual_2023_FR_Vf.pdf

> Les données de 2023 confirment la place centrale qu’occupe le secteur forestier dans l’économie québécoise :

> - PIB de 6,4 G\$ (soit 1,5 % de l’activité économique globale du Québec);

> Près de 2 000 établissements emploient plus de 57 000 travailleurs et travailleuses;

> Environ 21,8 G\$ en livraisons manufacturières (nationales et internationales).

Modelling forest is therefore a central challenge. There are various approaches. To understand, the evolution of community at large scale under climate change, one approach is to consider forest plots as units in a given state and strive to model the transition dynamics among these states.

Along the longitudinal gradient, there is a clear can be simplified as 3 states: Boreal (B), Temperate (T), Pioneer (P). Example found in Brice et al. (2020) There is one more, here we could consider that were Temperate and Boreal co-occur is Mixed but do not explicit to reduce the number of state to three.

<figure>
<img src="img/multistates.svg" class="center" style="width:70.0%" alt="Three state model: Temperate, Boreal and Pioneer species." />
<figcaption aria-hidden="true">Three state model: Temperate, Boreal and Pioneer species.</figcaption>
</figure>

### Markov chains

#### Definition and considerations

A major tool to model transitions between a set of states is Markov chain. As explained on Wikipedia:

> A Markov chain or Markov process is a stochastic model describing a sequence of possible events in which the probability of each event depends only on the state attained in the previous event (Wikipedia https://en.wikipedia.org/wiki/Markov_chain).

There are numerous course available on line to learn more about Markov chains (e.g. on the [MIT](https://ocw.mit.edu/courses/6-041-probabilistic-systems-analysis-and-applied-probability-fall-2010/resources/lecture-16-markov-chains-i/) website or on the website of [University of Cambridge](https://www.statslab.cam.ac.uk/~rrw1/markov/index.html)). Here we do not aim at going at exploring the mathematical properties of Markov chains, though we will mention key properties and important results when required.
We further note that Markov chains tool to build theoretical model. One example is the revisit of the classical model of biogeography
(Cazelles et al., 2016) whereMarkov chains where used to explore the role of trophic interactions. There is also a in depth derivation of the chains that can be of use: https://kevcaz.insileco.io/biogeonet/articles/Cazelles_2016_SI.html.

#### Continuous versus Discrete time Markov chain

It may be easier to understand think about Markov chain using discrete time. For instance, in our case, it may be easier to think about the probability that a plot dominated by boreal species could switch to a state where the dominating species are temperature. With an increase of a few degree we may get the estimate for a period, say 20 years that this happens.
We can then try to convert that for a year, then for a day. This is how the question of the value of the instant rate arise, this is how we jump from dis

TODO: show the math.

## Generating a mock datasets

Here we will start be generating a theoretical model of our system to show how Markov chains work. We will then use our Markov chain to generate a mock dataset that describes transition. The goal is to generate a dataset that resembles to the real one used in Brice et al. (2020).

### Generating states dynamics using a discrete Markov chain

At time t (here `\(t \in \mathbb{N}\)`) `\(\mathbb{P}_{t}(B, P, D)\)` describes the vector of probabilities of the three states. For instance, if `\(P_{0}(B, P, D) = (0.5, 0.1, 0.4)\)` means probability that 0.5 in state Boreal (community of tree species is classified as boreal because species composition), 0.1 in state P and 0.4 in Temperate.

`$$\mathbb{P}_{t+1}(B, P, D) = \mathbf{B}\mathbb{P}_{t}(B, P, D)$$`

Here `\(P_{t+1}(B, P, D)\)` is a column vector but it is also frequent to use the row vector (important to keep this is mind).

Once defined, the Markow chain can be used to dynamic.

`$$\mathbb{P}_{t+2}(B, P, D) = \mathbf{B}\mathbb{P}_{t+1}(B, P, D) = \mathbf{B}^2 \mathbb{P}_{t}(B, P, D)$$`

By induction:

`$$\mathbb{P}_{t+n}(B, P, D) = \mathbf{B}^n\mathbb{P}_{t}(B, P, D)$$`

And because of Markov property `\(t\)` does not matter. One important result for [ergodic Markov chains](https://en.wikipedia.org/wiki/Markov_chain#Ergodicity) is that the proportioned is given by the eigen vector corresponding to the eigen value 1.

Below we create functions to run the dynamics. Note that a column vector is used for the state distribution and that it is also common to use the row vector, it just the eigen vector to be used to assess the distribution.

``` r
# This function creates the Markov matrix as we have 3 states it is a 3x3 matrix
# p_ij means transition probability from state i to state j
gen_mc <- function(p_BP, p_BT, p_PB, p_PT, p_TP, p_TB) {
  check_pair(p_BP, p_BT) # helper function see below
  check_pair(p_PB, p_PT)
  check_pair(p_TP, p_TB)
  #
  cbind(
    c(1 - p_BP - p_BT, p_BP, p_BT),
    c(p_PB, 1 - p_PB - p_PT, p_PT),
    c(p_TB, p_TP, 1 - p_TB - p_TP)
  )
}

# helper function: check that values are probabilities
check_pair <- function(x, y) {
  stopifnot(x >= 0)
  stopifnot(x <= 1)
  stopifnot(y >= 0)
  stopifnot(y <= 1)
  stopifnot(x + y <= 1)
}

# the function below runs the Markov chain and stored results in a matrix that # has many columns as there are time steps
run_mc <- function(start, M, n = 1) {
  out <- start |> as.matrix()
  for (i in seq_len(n)) {
    out <- cbind(out, M %*% out[, i])
  }
  out
}

# Function to obtaine the equilibrium using the eigen vector
get_eq <- function(M) {
  tmp <- eigen(M)$vectors[, 1] / sum(eigen(M)$vectors[, 1])
  # if some other eigen are imaginary all eigen vector will be imaginary so we 
  # use the Real part after checking that it is actually a purely real number 
  # which is what we expect 
  stopifnot(all(Im(tmp) == 0))
  Re(tmp)
}
```

We now use the functions below to generate two dynamics, one that starts with
a boreal state and we assess what is distribution probabilities over the next 25 years. The second dynamics is similar but start we a temperate state.

``` r
# Generate the matrix M describing the Markov Chain
M <- gen_mc(0.1, 0.2, 0.2, 0.2, 0.05, 0.15)
# Run it for 25 years
res <- run_mc(c(1, 0, 0), M, 25)
res2 <- run_mc(c(0, 0, 1), M, 25)
# Get the proportion at equilibrium
v_eq <- get_eq(M)

# Create the plot
par(las = 1, mfrow = c(1, 2))
## Color palette
pal <- c("#87cdde", "#8d5fd3", "#ff2a7f")
plot(c(0, 25), c(0, 1), type = "n", xlab = "Time", ylab = "Probability")
## Add dynamics
for (i in 1:3) {
  lines(0:25, res[i, ], col = pal[i], lwd = 4)
}
## Add proportion at equilibrium as point
for (i in 1:3) {
  points(25, v_eq[i], col = pal[i], cex = 3, pch = 19)
}
## Second plot 
pal <- c("#87cdde", "#8d5fd3", "#ff2a7f")
plot(c(0, 25), c(0, 1), type = "n", xlab = "Time", ylab = "Probability")
for (i in 1:3) {
  lines(0:25, res2[i, ], col = pal[i], lwd = 4)
}
for (i in 1:3) {
  points(25, v_eq[i], col = pal[i], cex = 3, pch = 19)
}
legend("topright", legend = c("B", "P", "T"), col = pal, lty = 1, lwd = 2, 
  bty  ="n")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/mc2-1.svg" width="960" style="display: block; margin: auto;" />

### Influence of the temperature of the transition probabilities

We now will introduce the influence of the temperature on the dynamics.
Use this so that transition probabilities change with temperate. Here it is annual temperature and order of magnitude works for Quebec (-10°C and 10°C).

``` r
## We will use this function to model the impact of the dynamic 
## logit and its inverse comes with R in the 'stats' package but for good 
## reseaon they are named differently, see 
## https://ro-che.info/articles/2018-08-11-logit-logistic-r
logit <- stats::qlogis
inv_logit <- stats::plogis

## Sequence of the 
s_temp <- seq(-10, 10, 0.1)

# Transition probabilities as functions of the temperature
p_BT_temp <- function(temp) 0.1 * inv_logit(temp * 0.5 - 2)
p_TB_temp <- function(temp) 0.1 * (1 - inv_logit(temp * 0.5 + 2))
p_PT_temp <- function(temp) 0.5 * inv_logit(temp * 0.5)
p_PB_temp <- function(temp) 0.5 * (1 - inv_logit(temp * 0.5))

par(las = 1, mfrow = c(1, 2))

plot(range(s_temp), c(0, 0.1), type = "n", 
  main = "Temperate-Boreal transitions", xlab = "Temperatue", 
  ylab = "Transtion probabilities")
lines(s_temp, p_BT_temp(s_temp), lty = 1, lwd = 2)
lines(s_temp, p_TB_temp(s_temp), lty = 2, lwd = 2)
legend("right", c("p_BT", "p_TB"), bty = "n", lwd = 2, lty = c(1, 2))

plot(range(s_temp), c(0, 0.5), type = "n", main = "Pioneer transtions", 
  xlab = "Temperatue", ylab = "Transtion probabilities")
lines(s_temp, p_PT_temp(s_temp), lty = 1, lwd = 2)
lines(s_temp, p_PB_temp(s_temp), lty = 2, lwd = 2)
legend("right", c("p_PT", "p_PB"), bty = "n", lwd = 2, lty = c(1, 2))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/trans_temp-1.svg" width="864" style="display: block; margin: auto;" />

Using previous code, we can generate the equilibrium along the gradient.

TODO: use the transient dynamics, not the equilibrium.

``` r
gen_mc_temp <- function(temp) {
  gen_mc(
    p_BP = 0.1,
    p_BT = p_BT_temp(temp), 
    p_PB = p_PB_temp(temp), 
    p_PT = p_PT_temp(temp), 
    p_TP = 0.05,
    p_TB = p_TB_temp(temp)
  )
}

grad_eq <- function(v_temp) {
  out <- list()
  for (i in seq(v_temp)) {
    out[[i]] <- gen_mc_temp(v_temp[i]) |> get_eq()
  }
  do.call(cbind, out)
}


s_temp <- seq(-10, 10, 0.1)
res <- grad_eq(s_temp)

par(las = 1)
plot(range(s_temp), c(0, 1), type = "n", xlab = "Temperature", ylab = "Probabilities")
for (i in 1:3) {
    lines(s_temp, res[i, ], col = pal[i], lwd = 4)
}
```

<img src="{{< blogdown/postref >}}index_files/figure-html/prop_state_temp-1.svg" width="768" style="display: block; margin: auto;" />

### Generating data set using equilibrium

We need to element, one way to generate the state of based on temperature and one function one temperature mode.

``` r
sample_states <- function(temp) {
  if (length(temp) > 1) {
    lapply(temp, sample_states) |> unlist()
  } else {
    eq <- gen_mc_temp(temp) |> get_eq()
    c("B", "P", "T")[which(runif(1) <= cumsum(eq))[1L]]
  }
}
```

A simple function that gives us temperature over latitude and time. All made up.

``` r
# Create a temperature gradient grid
mod_temp <- function(time, latitude) {
  (time - 1960) * 0.02 + (55 - latitude) + rnorm(1) * 2
}
```

``` r
gen_data_plot <- function(n) {
  out <- list()
  for (i in seq_len(n)) {
    out[[i]] <- data.frame(
      plot_id = i,
      latitude = rep(runif(1, 45, 65), 3),
      time = 1960.0 + runif(3, 10, 20) |> cumsum()
    )
    out[[i]]$temperature <- mod_temp(out[[i]]$time, out[[i]]$latitude)
    out[[i]]$state <- sample_states(out[[i]]$temperature)
  }
  out |>
    do.call(what = rbind)
}

set.seed(777)
mock_data <- gen_data_plot(15000)
head(mock_data)
#R>    plot_id latitude     time temperature state
#R>  1       1 58.75715 1974.922   -2.437037     B
#R>  2       1 58.75715 1988.373   -2.168014     B
#R>  3       1 58.75715 2008.324   -1.769004     T
#R>  4       2 49.98385 1977.328    5.842430     P
#R>  5       2 49.98385 1993.931    6.174488     T
#R>  6       2 49.98385 2009.734    6.490551     T
```

## Inference with package `msm`

The package [`msm`](https://CRAN.R-project.org/package=msm)
(Multi-State Markov and Hidden Markov Models in Continuous Time) created and maintained by [Christopher Jackson](https://github.com/chjackson) was designed to fit and predict from multi-state models for intermittently observed data. There is a practical course with material available o line https://chjackson.github.io/msm/msmcourse/. This will use likelihood inference.

``` r
library(msm)
# msm required numbers for state 
# B is 1, P is 2, T is 3
mock_data$state2 <- as.factor(mock_data$state) |> 
  as.numeric()

statetable.msm(state, plot_id, data = mock_data)
#R>      to
#R>  from     B     P     T
#R>     B  7180  1675  2026
#R>     P  1592   463  1680
#R>     T  1693  1585 12106
```

Here all our states communicates.

``` r
Q <- matrix(1, 3, 3)
```

With no covariates.

``` r
res1 <- msm(state2 ~ time,
  subject = plot_id,
  data = mock_data,
  qmatrix = Q,
  gen.inits = TRUE,
  control = list(maxit = 1000, fnscale = 30000, trace = 1, reltol = 1e-16)
)
#R>  initial  value 1.659839 
#R>  iter  10 value 1.571854
#R>  iter  20 value 1.569171
#R>  iter  30 value 1.569074
#R>  iter  40 value 1.568893
#R>  iter  50 value 1.568788
#R>  iter  60 value 1.568769
#R>  iter  70 value 1.568696
#R>  iter  80 value 1.568682
#R>  iter  90 value 1.568665
#R>  iter 100 value 1.568634
#R>  iter 110 value 1.568623
#R>  iter 120 value 1.568604
#R>  iter 130 value 1.568595
#R>  iter 140 value 1.568587
#R>  iter 150 value 1.568573
#R>  iter 160 value 1.568566
#R>  iter 170 value 1.568559
#R>  iter 180 value 1.568553
#R>  iter 190 value 1.568546
#R>  iter 200 value 1.568539
#R>  iter 210 value 1.568534
#R>  iter 220 value 1.568531
#R>  iter 230 value 1.568525
#R>  iter 240 value 1.568520
#R>  iter 250 value 1.568515
#R>  iter 260 value 1.568512
#R>  iter 270 value 1.568509
#R>  iter 280 value 1.568504
#R>  iter 290 value 1.568501
#R>  iter 300 value 1.568498
#R>  iter 310 value 1.568495
#R>  iter 320 value 1.568492
#R>  iter 330 value 1.568488
#R>  iter 340 value 1.568486
#R>  iter 350 value 1.568484
#R>  iter 360 value 1.568481
#R>  iter 370 value 1.568478
#R>  iter 380 value 1.568476
#R>  iter 390 value 1.568474
#R>  iter 400 value 1.568472
#R>  iter 410 value 1.568470
#R>  iter 420 value 1.568468
#R>  iter 430 value 1.568466
#R>  iter 440 value 1.568465
#R>  iter 450 value 1.568463
#R>  iter 460 value 1.568461
#R>  iter 470 value 1.568459
#R>  iter 480 value 1.568458
#R>  iter 490 value 1.568456
#R>  iter 500 value 1.568454
#R>  iter 510 value 1.568453
#R>  iter 520 value 1.568452
#R>  iter 530 value 1.568451
#R>  iter 540 value 1.568449
#R>  iter 550 value 1.568448
#R>  iter 560 value 1.568447
#R>  iter 570 value 1.568445
#R>  iter 580 value 1.568444
#R>  iter 590 value 1.568443
#R>  iter 600 value 1.568442
#R>  iter 610 value 1.568441
#R>  iter 620 value 1.568440
#R>  iter 630 value 1.568438
#R>  iter 640 value 1.568437
#R>  iter 650 value 1.568437
#R>  iter 660 value 1.568436
#R>  iter 670 value 1.568434
#R>  iter 680 value 1.568433
#R>  iter 690 value 1.568433
#R>  iter 700 value 1.568432
#R>  iter 710 value 1.568431
#R>  iter 720 value 1.568430
#R>  iter 730 value 1.568429
#R>  iter 740 value 1.568428
#R>  iter 750 value 1.568428
#R>  iter 760 value 1.568427
#R>  iter 770 value 1.568426
#R>  iter 780 value 1.568425
#R>  iter 790 value 1.568424
#R>  iter 800 value 1.568424
#R>  iter 810 value 1.568423
#R>  iter 820 value 1.568422
#R>  iter 830 value 1.568422
#R>  iter 840 value 1.568421
#R>  iter 850 value 1.568420
#R>  iter 860 value 1.568420
#R>  iter 870 value 1.568419
#R>  iter 880 value 1.568418
#R>  iter 890 value 1.568418
#R>  iter 900 value 1.568417
#R>  iter 910 value 1.568417
#R>  iter 920 value 1.568416
#R>  iter 930 value 1.568415
#R>  iter 940 value 1.568415
#R>  iter 950 value 1.568414
#R>  iter 960 value 1.568414
#R>  iter 970 value 1.568413
#R>  iter 980 value 1.568413
#R>  iter 990 value 1.568412
#R>  iter1000 value 1.568412
#R>  final  value 1.568412 
#R>  stopped after 1000 iterations
#R>  Used 1000 function and 1000 gradient evaluations
```

``` r
pmatrix.msm(res1, t = 1)
#R>              State 1    State 2     State 3
#R>  State 1 0.954378726 0.04217156 0.003449719
#R>  State 2 0.117180919 0.78083082 0.101988260
#R>  State 3 0.001871054 0.02264031 0.975488637
```

> It is often worthwhile to normalize the optimization using
> ‘control=list(fnscale = a)’, where ‘a’ is the a number of the
> order of magnitude of the -2 log likelihood.

Note that `list(fnscale = 5000)` is required to avoid numerical overflow in the
likelihood estimation.

> Any diagonal entry of ‘qmatrix’ is
> ignored, as it is constrained to be equal to minus the sum of
> the rest of the row.

Temperate as covariates:

``` r
res2 <- msm(state2 ~ time,
  subject = plot_id,
  data = mock_data,
  qmatrix = Q,
  gen.inits = TRUE,
  covariates = list(
    "2-1" = ~temperature,
    "2-3" = ~temperature,
    "3-1" = ~temperature,
    "1-3" = ~temperature
  ),
  obstype = 1,
  control = list(maxit = 1000, fnscale = 10000, trace = 1, reltol = 1e-16)
)
#R>  initial  value 4.979518 
#R>  iter  10 value 3.629998
#R>  final  value 3.618541 
#R>  converged
#R>  Used 136 function and 17 gradient evaluations
```

Goodness fit

``` r
res1
#R>  
#R>  Call:
#R>  msm(formula = state2 ~ time, subject = plot_id, data = mock_data,     qmatrix = Q, gen.inits = TRUE, control = list(maxit = 1000,         fnscale = 30000, trace = 1, reltol = 1e-16))
#R>  
#R>  Maximum likelihood estimates
#R>  
#R>  Transition intensities
#R>                    Baseline                         
#R>  State 1 - State 1 -0.0497996 (-5.278e-02,-0.046986)
#R>  State 1 - State 2  0.0488794 ( 4.501e-02, 0.053084)
#R>  State 1 - State 3  0.0009202 ( 1.243e-04, 0.006811)
#R>  State 2 - State 1  0.1358360 ( 1.262e-01, 0.146160)
#R>  State 2 - State 2 -0.2525786 (-2.689e-01,-0.237234)
#R>  State 2 - State 3  0.1167426 ( 1.078e-01, 0.126373)
#R>  State 3 - State 1  0.0003006 ( 3.399e-05, 0.002659)
#R>  State 3 - State 2  0.0259223 ( 2.438e-02, 0.027558)
#R>  State 3 - State 3 -0.0262229 (-2.755e-02,-0.024957)
#R>  
#R>  -2 * log-likelihood:  47052.35
```

``` r
res2
#R>  
#R>  Call:
#R>  msm(formula = state2 ~ time, subject = plot_id, data = mock_data,     qmatrix = Q, gen.inits = TRUE, obstype = 1, covariates = list(`2-1` = ~temperature,         `2-3` = ~temperature, `3-1` = ~temperature, `1-3` = ~temperature),     control = list(maxit = 1000, fnscale = 10000, trace = 1,         reltol = 1e-16))
#R>  
#R>  Optimisation probably not converged to the maximum likelihood.
#R>  optim() reported convergence but estimated Hessian not positive-definite.
#R>  
#R>  -2 * log-likelihood:  36185.41
```

Predictions

``` r
res_eq <- res_temp <- res_rate <- list()
for (i in seq(s_temp)) {
  res_temp[[i]] <- pmatrix.msm(res2, t = 1, covariates = list(temperature = s_temp[i]))
  res_rate[[i]] <- qmatrix.msm(res2, covariates = list(temperature = s_temp[i]))
  res_eq[[i]] <- t(res_temp[[i]]) |> get_eq()
}

par(las = 1, mfrow = c(1, 2))

plot(range(s_temp), c(0, 1), type = "n", xlab = "Temperature", ylab = "Transtion probabilities")
lines(s_temp, lapply(res_temp, \(x) x[1, 3]) |> unlist())
lines(s_temp, lapply(res_temp, \(x) x[3, 1]) |> unlist(), lty = 2)
legend("right", c("p_BT", "p_TB"), bty = "n", lwd = 2, lty = c(1, 2))

plot(range(s_temp), c(0, 0.5), type = "n", xlab = "Temperature", ylab = "Transtion probabilities")
lines(s_temp, lapply(res_temp, \(x) x[2, 3]) |> unlist())
lines(s_temp, lapply(res_temp, \(x) x[2, 1]) |> unlist(), lty = 2)
legend("right", c("p_PT", "p_PB"), bty = "n", lwd = 2, lty = c(1, 2))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/msm6-1.svg" width="864" style="display: block; margin: auto;" />

``` r
par(las = 1, mfrow = c(1, 2))

plot(range(s_temp), c(0, 20), type = "n", xlab = "Temperature", ylab = "Transtion probabilities")
lines(s_temp, lapply(res_rate, \(x) x[1, 3])  |> lapply(\(x) x[1]) |> unlist())
lines(s_temp, lapply(res_rate, \(x) x[3, 1])  |> lapply(\(x) x[1]) |> unlist(), lty = 2)
legend("right", c("p_BT", "p_TB"), bty = "n", lwd = 2, lty = c(1, 2))

plot(range(s_temp), c(0, 0.5), type = "n", xlab = "Temperature", ylab = "Transtion probabilities")
lines(s_temp, lapply(res_rate, \(x) x[2, 3]) |> lapply(\(x) x[1]) |> unlist())
lines(s_temp, lapply(res_rate, \(x) x[2, 1]) |> lapply(\(x) x[1]) |> unlist(), lty = 2)
legend("right", c("p_PT", "p_PB"), bty = "n", lwd = 2, lty = c(1, 2))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/qmat-1.svg" width="672" style="display: block; margin: auto;" />

``` r
resf <- res_eq |> do.call(what = cbind)
par(las = 1)

plot(range(s_temp), c(0, 1), type = "n", xlab = "Temperature", ylab = "Probability")
## Add dynamics
for (i in 1:3) {
  lines(s_temp, resf[i, ], col = pal[i], lwd = 4)
}
```

<img src="{{< blogdown/postref >}}index_files/figure-html/msm7-1.svg" width="864" style="display: block; margin: auto;" />

Example found in Brice et al. (2020) also see the post [Multistate Models for Medical Applications](https://rviews.rstudio.com/2023/04/19/multistate-models-for-medical-applications/) by Joseph Rickert.

## Inference via Cox model and the `INLA` package

### Survival models

## Link with survival function

Link with Survival

`$$1 - F(t)$$`

https://en.wikipedia.org/wiki/Survival_function

https://en.wikipedia.org/wiki/Survival_analysis

Hazard function

Install inla using a Cox model

https://becarioprecario.bitbucket.io/inla-gitbook/ch-survival.html

https://www.r-inla.org/download-install

A second option is to model every transition probability using survival function. In our case we will have 6 transition probabilities and therefore 6 hazard function to be modelled. There are various packages to do `survival`

Over the last decade, INLA has become a popular alternative. Integrated Nested Laplace Approximation to do approximate Bayesian inference for latent Gaussian models (LGMs). Bayesian additive models with a structured additive predictor (1); namely those which assign a Gaussian prior.

Survival model with INLA https://becarioprecario.bitbucket.io/inla-gitbook/ch-survival.htm. So now instead of the probability of an event to happen, we model the time.

INLA is not on CRAN so it may be trickier to use.

``` r
install.packages("INLA", repos = c(getOption("repos"), INLA = "https://inla.r-inla-download.org/R/stable"), dep = TRUE)
```

http://www.r-inla.or
https://onlinelibrary.wiley.com/doi/epdf/10.1002/sim.10160

## References

<div id="refs" class="references csl-bib-body hanging-indent" line-spacing="2">

<div id="ref-Brice_2020" class="csl-entry">

Brice M, Vissault S, Vieira W, Gravel D, Legendre P, Fortin M. 2020. Moderate disturbances accelerate forest transition dynamics under climate change in the temperate–boreal ecotone of eastern north america. *Global Change Biology* 26:4418–4435. DOI: [10.1111/gcb.15143](https://doi.org/10.1111/gcb.15143).

</div>

<div id="ref-Cazelles_2016" class="csl-entry">

Cazelles K, Mouquet N, Mouillot D, Gravel D. 2016. On the integration of biotic interaction and environmental constraints at the biogeographical scale. *Ecography* 39:921–931. DOI: [10.1111/ecog.01714](https://doi.org/10.1111/ecog.01714).

</div>

</div>

<div style="margin: 1.5rem 0rem 0.5rem 0rem;">

<details>
<summary>
<i class="fas fa-cogs" aria-hidden="true"></i> Display information relative to the R session used to render this post.
</summary>

``` r
sessionInfo()
#R>  R version 4.4.1 (2024-06-14)
#R>  Platform: x86_64-pc-linux-gnu
#R>  Running under: Ubuntu 24.04 LTS
#R>  
#R>  Matrix products: default
#R>  BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3 
#R>  LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.26.so;  LAPACK version 3.12.0
#R>  
#R>  locale:
#R>   [1] LC_CTYPE=en_CA.UTF-8       LC_NUMERIC=C               LC_TIME=en_CA.UTF-8       
#R>   [4] LC_COLLATE=en_CA.UTF-8     LC_MONETARY=en_CA.UTF-8    LC_MESSAGES=en_CA.UTF-8   
#R>   [7] LC_PAPER=en_CA.UTF-8       LC_NAME=C                  LC_ADDRESS=C              
#R>  [10] LC_TELEPHONE=C             LC_MEASUREMENT=en_CA.UTF-8 LC_IDENTIFICATION=C       
#R>  
#R>  time zone: America/Toronto
#R>  tzcode source: system (glibc)
#R>  
#R>  attached base packages:
#R>  [1] stats     graphics  grDevices datasets  utils     methods   base     
#R>  
#R>  other attached packages:
#R>  [1] msm_1.7.1         inSilecoRef_0.1.1
#R>  
#R>  loaded via a namespace (and not attached):
#R>   [1] xfun_0.45         bslib_0.7.0       htmlwidgets_1.6.4 processx_3.8.4    lattice_0.22-6   
#R>   [6] bspm_0.5.4        callr_3.7.6       vctrs_0.6.5       tools_4.4.1       ps_1.7.6         
#R>  [11] generics_0.1.3    curl_5.2.1        base64url_1.4     tibble_3.2.1      fansi_1.0.6      
#R>  [16] highr_0.11        pkgconfig_2.0.3   Matrix_1.7-0      data.table_1.15.4 secretbase_1.0.0 
#R>  [21] lifecycle_1.0.4   compiler_4.4.1    stringr_1.5.1     codetools_0.2-20  httpuv_1.6.15    
#R>  [26] htmltools_0.5.8.1 sass_0.4.9        yaml_2.3.8        later_1.3.2       pillar_1.9.0     
#R>  [31] jquerylib_0.1.4   DT_0.33           cachem_1.1.0      mime_0.12         tidyselect_1.2.1 
#R>  [36] digest_0.6.36     mvtnorm_1.2-5     stringi_1.8.4     dplyr_1.1.4       bookdown_0.39    
#R>  [41] splines_4.4.1     grid_4.4.1        bibtex_0.5.1      fastmap_1.2.0     expm_0.999-9     
#R>  [46] cli_3.6.3         magrittr_2.0.3    survival_3.7-0    crul_1.4.2        utf8_1.2.4       
#R>  [51] promises_1.3.0    backports_1.5.0   rmarkdown_2.27    igraph_2.0.3      blogdown_1.19    
#R>  [56] shiny_1.8.1.1     evaluate_0.24.0   knitr_1.47        miniUI_0.1.1.1    rlang_1.1.4      
#R>  [61] Rcpp_1.0.12       xtable_1.8-4      glue_1.7.0        httpcode_0.3.0    xml2_1.3.6       
#R>  [66] svglite_2.1.3     jsonlite_1.8.8    R6_2.5.1          rcrossref_1.2.0   plyr_1.8.9       
#R>  [71] systemfonts_1.1.0 targets_1.7.1     fs_1.6.4
```

</details>

</div>

[^1]: https://ressources-naturelles.canada.ca/nos-ressources-naturelles/forets/letat-forets-canada-rapport-annuel/lindustrie-forestiere-contribue/16518
