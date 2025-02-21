# aquacultuR <img src="man/figures/logo.png" align="right" height="139" alt="" />

aquacultuR is an R package providing functions for the calculation of
growth and feed conversion metrics. The provided example datasets
originate from studies in the field of aquaculture.

## Table of Contents
- [Why Use aquacultuR?](#why-use-aquacultur)
- [Installation](#installation)
- [Functionalities](#functionalities)
  - [Current](#current)
  - [Planned](#planned)
- [Example Usage](#example-usage)
- [About](#about)

## Why Use aquacultuR?

Until now, a comprehensive collection of equations that are commonly
used in animal nutrition does not exist. This can make it difficult for
people entering the field to understand how values were obtained. Also,
the use of incorrect equations might not be recognized by reviewers in
some cases. The **advantages** of wrapping those equations up in an R
package in comparison to an Excel file are

- superior reproducibility
- reduced susceptibility to human errors
- having a citeable resource on hand that can be referred to

## Installation

To install the latest version of `aquacultuR` from GitHub, follow these steps:

### Installing R
Before installing aquacultuR, ensure you have R installed. You can download and install R from the official CRAN website:

[Download R](https://cran.r-project.org/)

Windows: Run the downloaded .exe file and follow the on-screen instructions.

macOS: Download the .pkg file and install it by following the guided setup.

Linux: Use the package manager (e.g., sudo apt install r-base for Debian/Ubuntu or sudo dnf install R for Fedora).

### Installing RStudio (Optional but Recommended)

RStudio is a  IDE for R that enhances the development experience. Download it from:

[Download RStudio](https://posit.co/downloads/)

After installing RStudio, you can launch it and start coding in R with an improved interface.

### Setting Up the Environment

Once R is installed, to set up your development environment by installing essential dependencies:

```r
install.packages(c("tidyverse", "remotes"))
```

To ensure all packages are up to date, run:
```r
update.packages(ask = FALSE)
```
Your now ready to install aquacultuR

### Prerequisites
Ensure you have the `devtools` package installed:

```r
install.packages("devtools")
```

### Installing the Package
Use `devtools` to install `aquacultuR` from GitHub:

```r
library(devtools)
devtools::install_github("TellAnAx/aquacultuR")
```

### Loading the Package
Once installed, load the library using:

```r
library(aquacultuR)
```

## Functionalities

### Current

The package provides functions for calculating the following:
- **Geometric bodyweight**
- **Metabolic bodyweight**
- **Absolute growth (AG)**
- **Absolute growth rate (AGR)**
- **Relative growth rate (RGR)**
- **Specific growth rate (SGR)**
- **Thermal growth coefficient (TGC)**
- **Feed conversion ratio (FCR)**
- **Nutrient efficiency ratio (NER)**
- **Apparent digestibility coefficient (ADC)**

### Planned
- Data entry draft sheets
- Functions for automated data analysis

## Example Usage

Here’s a simple example demonstrating the calculation of the **specific growth rate (SGR)**:

```r
#Example dataset
initial_weight <- 10  #Initial weight of the fish (grams)
final_weight <- 50     #Final weight (grams)
days <- 30            #Number of days

#Calculate SGR
aquacultuR::SGR(initial_weight, final_weight, days)
```

This function returns the specific growth rate as a percentage per day.

## About

**Author:**
- [Anıl Axel Tellbüscher](https://anil.tellbuescher.online)

**Logo Design:**
- [Tomáš Pěnka](https://www.linkedin.com/in/tomáš-pěnka-a25866287/)

