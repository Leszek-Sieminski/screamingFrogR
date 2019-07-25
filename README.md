# screamingFrogR v0.1.0
![Lifecycle_Status](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
[![Build status](https://travis-ci.org/Leszek-Sieminski/screamingFrogR.svg?branch=master)](https://travis-ci.org/Leszek-Sieminski/screamingFrogR)
[![codecov](https://codecov.io/gh/Leszek-Sieminski/screamingFrogR/branch/master/graph/badge.svg)](https://codecov.io/gh/Leszek-Sieminski/screamingFrogR)
[![CRAN status](https://www.r-pkg.org/badges/version/screamingFrogR)](https://CRAN.R-project.org/package=screamingFrogR)

R integration with Screaming Frog CLI

* [What is Screaming Frog?](#what-is-screaming-frog)
* [Features](#features)
* [Downloading and License](#downloading-and-license)
* [Installation](#installation)
* [Setup](#setup)
* [Usage](#usage)

## What is Screaming Frog?
[Screaming Frog SEO Spider](https://www.screamingfrog.co.uk/seo-spider/) is a website crawler for Windows, MacOS and Ubuntu designed for creating technical SEO audits. It can be used for free (for websites up to 500 URLs) or after purchasing the license.

Version 10.0 introduced Command Line Interface (CLI) that enables programmatic crawling and scheduling. This package is an R wrapper for the CLI.

**This package requires version 10.0+ of Screaming Frog SEO Spider.**

## Features
* setup the crawler
* create a crawl and choose which reports to include
* export the reports as a CSV, XLS or XLSX and load to R's global enviroment
* provide a configuration file if the default spider settings are not enough

## Downloading and License
Screaming Frog SEO Spider can be downloaded [here](https://www.screamingfrog.co.uk/seo-spider/) via a 'Download' button.
If you happen to be installing it on a server (without GUI), remember to accept the EULA.

## Installation of Screaming Frog SEO Spider
### Windows
Please read official documentation: [installation on Windows](https://www.screamingfrog.co.uk/seo-spider/user-guide/general/#installation-on-windows)

### Mac OS
Please read official documentation: [installation on Mac OS](https://www.screamingfrog.co.uk/seo-spider/user-guide/general/#installation-on-macos)

### Linux
Please read official documentation: [installation on Ubuntu](https://www.screamingfrog.co.uk/seo-spider/user-guide/general/#installation-on-ubuntu)

### Command line
For more information about CLI, please read: [link](https://www.screamingfrog.co.uk/seo-spider/user-guide/general/#command-line)

## Setup
### 1. Entering you licence key
Create a file in your .ScreamingFrogSEOSpider directory called licence.txt. Enter (copy and paste to avoid typos) your license username on the first line and license key on the second line and save the file.

### 2. Accepting the EULA
Create or edit the file spider.config in your .ScreamingFrogSEOSpider directory. Locate and edit or add the following line:

*eula.accepted=8*

save the file and exit.

## Using the package
### Download & Install
````r
install.packages(devtools)
library(devtools)
devtools::install_github("Leszek-Sieminski/screamingFrogR")
library("screamingFrogR")
```

### Run the setup function (Windows only)
Please use *sfr_setup_windows()* function to setup Screaming Frog SEO Spider properly. To do this, you must provide a path to the directory of installation. Proper directory MUST contain 'ScreamingFrogSEOSpiderCli.exe' file to work properly, otherwise it won't work:

```r
sfr_setup_windows(path = "C:/Program Files/Screaming Frog SEO Spider/")
```

## Crawling
```r
# installation ----------------------------------------------------------------
install.packages("devtools")
devtools::install_github("Leszek-Sieminski/screamingFrogR")
library("screamingFrogR")

# setup (Windows only) --------------------------------------------------------
screamingFrogR::sfr_setup_windows(path = "C:/Program Files/Screaming Frog SEO Spider/")

# running a crawl -------------------------------------------------------------
screamingFrogR::sfr_crawl(
  url = "https://julialang.org/learning/",
  export_tabs = c("Internal:All", "External:All"),
  timestamped_output = TRUE
)
```
