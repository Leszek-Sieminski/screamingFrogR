# screamingFrogR v0.1.0
![Lifecycle_Status](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
[![Build status](https://travis-ci.org/Leszek-Sieminski/screamingFrogR.svg?branch=master)](https://travis-ci.org/Leszek-Sieminski/screamingFrogR)
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

## Installation
### Windows
tbd

### Mac OS
tbd

### Linux
tbd

### More info
For more information, please read: [link](https://www.screamingfrog.co.uk/seo-spider/user-guide/general/#command-line)

## Setup
### Entering you licence key
Create a file in your .ScreamingFrogSEOSpider directory called licence.txt. Enter (copy and paste to avoid typos) your license username on the first line and license key on the second line and save the file.

### Accepting the EULA
Create or edit the file spider.config in your .ScreamingFrogSEOSpider directory. Locate and edit or add the following line:

*eula.accepted=8*

save the file and exit.

### Run the setup function on Windows
Please use *sfr_setup_windows()* function to setup Screaming Frog SEO Spider properly. To do this, you must provide a path to the directory of installation. Proper directory MUST contain 'ScreamingFrogSEOSpiderCli.exe' file to work properly, otherwise it won't work.

*sfr_setup_windows(path = "C:/Program Files/Screaming Frog SEO Spider/")*

## Usage
