
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aquacultuR <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->

[![GPLv3
license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17788664.svg)](https://doi.org/10.5281/zenodo.17788664)
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

aquacultuR is an R package that provides functions for the calculation
of growth and feed conversion metrics. The provided example datasets
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

If you prefer the latest development version, you can also **install
aquacultuR from GitHub** by using:

``` r
require(devtools)
devtools::install_github("TellAnAx/aquacultuR")
```

In both cases, the package can eventually be loaded using:

``` r
library(aquacultuR)
```

# Functionalities


| Function     | Metric                                          | Description                                                                                                                                | Typical Unit      | Synonym / Notes                                              |
| ------------ | ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----------------- | ------------------------------------------------------------ |
| `gbw()`      | Geometric bodyweight                            | Calculates the geometric mean of body weight between two sampling points. Often used to reduce bias caused by exponential growth patterns. | g or kg           | —                                                            |
| `mbw()`      | Metabolic bodyweight                            | Calculates metabolic body weight using BW^0.75. Represents metabolic energy demand and is widely used in nutritional modelling.            | g^0.75 or kg^0.75 | —                                                            |
| `ag()`       | Absolute growth (AG)                            | Calculates total weight gained over a defined period.                                                                                      | g or kg           | Weight gain                                                  |
| `agr()`      | Absolute growth rate (AGR)                      | Measures growth per unit of time, showing how fast an organism increases in body weight.                                                   | g/day             | —                                                            |
| `rgr()`      | Relative growth rate (RGR)                      | Measures proportional growth relative to initial body weight. Useful when comparing growth across different size classes.                  | % per day         | —                                                            |
| `sgr()`      | Specific growth rate (SGR)                      | Logarithmic growth rate widely used in aquaculture. Allows standardized comparison across experiments and species.                         | % per day         | Most commonly reported growth metric                         |
| `tgc()`      | Thermal growth coefficient (TGC)                | Growth metric adjusted for temperature effects. Used for cross-study comparisons when temperature varies.                                  | Dimensionless     | Temperature-adjusted growth                                  |
| `nr()`       | Nutrient retention                              | Measures proportion of ingested nutrients retained in body tissues. Indicates nutrient utilization efficiency.                             | %                 | —                                                            |
| `fcr()`      | Feed conversion ratio (FCR)                     | Measures amount of feed required to produce one unit of biomass. Lower values indicate better feed efficiency.                             | Ratio             | One of the most important aquaculture performance indicators |
| `fce()`      | Feed conversion efficiency (FCE)                | Reciprocal of FCR, representing biomass produced per unit of feed consumed.                                                                | % or ratio        | Inverse of FCR                                               |
| `ner()`      | Nutrient efficiency ratio (NER)                 | Measures efficiency of specific nutrient utilization such as protein or energy.                                                            | Ratio             | Protein Efficiency Ratio (PER), Energy Efficiency Ratio      |
| `adc_dm()`   | Apparent digestibility coefficient – dry matter | Estimates digestibility of total dry matter in feed using inert markers.                                                                   | %                 | —                                                            |
| `adc_nut()`  | Apparent digestibility coefficient – nutrient   | Estimates digestibility of specific nutrients such as protein, lipid, or energy.                                                           | %                 | —                                                            |
| `adc_ingr()` | Apparent digestibility coefficient – ingredient | Estimates digestibility of individual feed ingredients within compound diets.                                                              | %                 | Useful in feed formulation studies                           |



# About

**Authors:**

- [Anıl Axel Tellbüscher](https://anil.tellbuescher.online) -
  [University of South Bohemia in České
  Budějovice](https://www.jcu.cz/en/), CZ
- [Davide Machado e
  Silva](https://www.researchgate.net/profile/Davide-Machado-E-Silva) -
  [University of Aveiro](https://www.ua.pt/en), PT
- [Simão Correia](https://www.researchgate.net/profile/Simao-Correia) -
  [University of Perpignan](https://www.univ-perp.fr/en), FR

**Contributors:**

- [Madhav
  Karthikeyan](https://www.researchgate.net/profile/Madhav-Karthikeyan-2) -
  [University of Crete](https://www.uoc.gr/en/home/), GR

**Logo design:**

- [Tomáš Pěnka](https://www.researchgate.net/profile/Tomas-Penka) -
  [University of South Bohemia in České
  Budějovice](https://www.jcu.cz/en/), CZ
