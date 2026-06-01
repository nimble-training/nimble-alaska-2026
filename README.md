# nimble-alaska-2026
Materials for the NIMBLE workshop for the Alaska ASA, June 16-17, 2026

To prepare for the workshop:

 - Install NIMBLE (see below)
 - Install additional packages (see below)
 - Download these materials (and check back before the workshop on Monday for updates)

All materials for the workshop will be in this GitHub repository. If you're familiar with Git/GitHub, you already know how to get all the materials on your computer. If you're not, simply click [here](https://github.com/nimble-training/nimble-alaska-2026/archive/main.zip).

There is some overview information [here (https://htmlpreview.github.io/?https://github.com/nimble-training/nimble-alaska-2026/blob/main/overview.html), including links to the content modules in order.

Time: 9 am - 4:30 pm Alaska time (GMT-9)

## Tentative Schedule

Day 1 (Tuesday June 16):

1. (9 am - 9:45 am) Introduction to NIMBLE: Basic concepts and workflows
2. (10 am - 11 am) Working with NIMBLE models and converting from WinBUGS/JAGS
3. (11:15 am - 12:30 pm) Comparing and customizing MCMC methods in NIMBLE
4. (12:30 pm - 1:30 pm) Lunch (provided)
5. (1:30 pm - 2:30 pm) Strategies for improving MCMC
6. (2:45 pm - 4 pm) Spatial modeling
9. (4:15 pm - 4:30 pm) Writing your own functions and distributions 

Day 2 (Wednesday June 17):

9. (9 am - 10 am) Writing your own functions and distributions (cont'd)
8. (10:15 am - 12 pm) Ecological models (including Hidden Markov Models)
10. (12 pm - 1 pm) Lunch (provided)
11. (1 pm - 2 pm) Introduction to nimbleFunctions and nimble programming
12. (2:15 pm - 3:15 pm) nimbleFunction programming (with user-defined sampler example)
13. (3:30 pm - 4:15 pm) Automatic differentiation, Laplace approximation, and INLA-like nested approximation
14. (4:15 pm - 4:30 pm) Wrapup and NIMBLE 2.0

## Help with NIMBLE

Our user manual is [here](https://r-nimble.org/html_manual/cha-welcome-nimble.html).

We have a 'cheatsheet' and a guide to converting from JAGS or WinBUGS to NIMBLE [here](https://r-nimble.org/documentation).

For the small number of you who are not already familiar with writing models in WinBUGS, JAGS, or NIMBLE, you may want to look through the first module (Introduction to NIMBLE) or Section 5.2 of our user manual in advance.

We're happy to answer questions about writing models as we proceed through the workshop, but if you have no experience with it, reviewing in advance will greatly lessen the odds you feel lost right at the beginning.

## Installing NIMBLE

NIMBLE is an R package on CRAN, so in general it will be straightforward to install as with any R package, but you do need a compiler and related tools on your system.  

In summary, here are the steps.

1. Install compiler tools on your system. [https://r-nimble.org/download](https://r-nimble.org/download) has more details on how to install *Rtools* on Windows and how to install the command line tools of *Xcode* on a Mac. Note that if you have packages requiring a compiler (e.g., *Rcpp*) on your computer, you should already have the compiler tools installed.

2. Install the *nimble* package from CRAN in the usual fashion for an R package. More details (including troubleshooting tips) can also be found in Section 4 of the [NIMBLE manual](https://r-nimble.org/html_manual/cha-installing-nimble.html).

3) To test that things are working please run the following code in R:

```
library(nimble)
code <- nimbleCode({
  y ~ dnorm(0,1)
})
model <- nimbleModel(code)
cModel <- compileNimble(model)
```


If that runs without error, you're all set. If not, please see the troubleshooting tips and email nimble.stats@gmail.com directly if you can't get things going.  

In general we encourage you to update to the most recent version of NIMBLE (>=1.4.0).


## Installing additional packages

Some of the packages we will use (beyond those automatically installed with `nimble`) can be installed as follows:

```
install.packages(c("compareMCMCs", "mcmcplots", "CARBayesdata", "sp", "spdep", "classInt", "coda", "nimbleEcology", "nimbleSCR"))
```

