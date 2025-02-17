
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aquacultuR <img src="man/figures/logo.png" align="right" height="139" alt="" />

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

You can install the latest version of aquacultuR from GitHub using:

``` r
require(devtools)
devtools::install_github("TellAnAx/aquacultuR")
```

The library can eventually be loaded using:

``` r
library(aquacultuR)
```

# Functionalities

### Current

- Geometric bodyweight
- Metabolic bodyweight
- Absolute growth (AG)
- Absolute growth rate (AGR)
- Relative growth rate (RGR)
- Specific growth rate (SGR)
- Thermal growth coefficient (TGC)
- Feed conversion ratio (FCR)
- Nutrient efficiency ratio (NER)
- Apparent digestibility coefficient (ADC)

## Planned

- Data entry draft sheets
- Functions for automated data analysis

# About

**Author:**

- [Anıl Axel Tellbüscher](https://anil.tellbuescher.online)

**Logo design:**

- [Tomáš Pěnka](https://www.linkedin.com/in/tomáš-pěnka-a25866287/)
