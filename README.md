
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aquacultuR <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->

[![GPLv3
license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)
![CRAN/METACRAN Version](https://img.shields.io/cran/v/aquacultuR)
![GitHub
Release](https://img.shields.io/github/v/release/TellAnAx/aquacultuR)
![GitHub Tag](https://img.shields.io/github/v/tag/TellAnAx/aquacultuR)
![GitHub
contributors](https://img.shields.io/github/contributors/TellAnAx/aquacultuR)
![GitHub last
commit](https://img.shields.io/github/last-commit/TellAnAx/aquacultuR)
[![R-CMD-check](https://github.com/TellAnAx/aquacultuR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/TellAnAx/aquacultuR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

aquacultuR is an R package providing functions for the calculation of
growth and feed conversion metrics. The provided example datasets
originate from studies in the field of aquaculture.

# Why using aquacultuR?

Until now, a comprehensive collection of equations that are commonly
used in animal nutrition does not exist. This can make it difficult for
people entering the field to understand how values were obtained. Also,
the use of incorrect equations might not be recognized by reviewers in
some cases. The **advantages** of wrapping those equations up in an R
package in comparison to an Excel file are

- superior reproducibility
- reduced susceptibility to human errors
- having a citeable resource on hand that can be referred to

# Installation

You can **install aquacultuR from CRAN** using:

``` r
install.packages("aquacultuR")
```

You can also **install aquacultuR from GitHub** if you prefer the latest
development version by using:

``` r
require(devtools)
devtools::install_github("TellAnAx/aquacultuR")
```

In both cases, the package can eventually be loaded using:

``` r
library(aquacultuR)
```

# Functionalities

| Function | Metric | Synonym |
|----|----|----|
| `gbw()` | Geometric bodyweight |  |
| `mbw()` | Metabolic bodyweight |  |
| `ag()` | Absolute growth (AG) | Weight gain |
| `agr()` | Absolute growth rate (AGR) |  |
| `rgr()` | Relative growth rate (RGR) |  |
| `sgr()` | Specific growth rate (SGR) |  |
| `tgc()` | Thermal growth coefficient (TGC) |  |
| `nr()` | Nutrient retention |  |
| `fcr()` | Feed conversion ratio (FCR) |  |
| `fce()` | Feed conversion efficiency (FCE) |  |
| `ner()` | Nutrient efficiency ratio (NER) | Protein/Energy/X efficiency ratio |
| `adc_dm()` | Apparent digestibility coefficient (ADC) |  |
| `adc_nut()` | Apparent digestibility coefficient (ADC) |  |
| `adc_ingr()` | Apparent digestibility coefficient (ADC) |  |

# About

**Authors:**

- [Anıl Axel Tellbüscher](https://anil.tellbuescher.online)
- Davide Machado e Silva
- Simão Correia

**Contributors:**

- Madhav Karthikeyan

**Logo design:**

- Tomáš Pěnka
