
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CountGroupBy

<!-- badges: start -->
<!-- badges: end -->

The goal of CountGroupBy is to count the number of the value
choose_value in the column group_by_column of the given dataset

## Installation

You can install the development version of countGroupBy from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-ziwei11")
```

## Example

This is a basic example which shows you how to count the number of data
with ‘2017-02-02’ in column issue_date and the number of data with ‘New
Building’ in column type_of_work in the dataset
datateachr::building_permits:

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(datateachr)
library(tidyr)
library(countGroupBy)

count_group_by(datateachr::building_permits, "issue_date", as.Date("2017-02-02", format = "%Y-%m-%d"))
#> # A tibble: 1 × 2
#> # Groups:   issue_date [1]
#>   issue_date     n
#>   <date>     <int>
#> 1 2017-02-02    29
count_group_by(datateachr::building_permits, "type_of_work", "New Building")
#> # A tibble: 1 × 2
#> # Groups:   type_of_work [1]
#>   type_of_work     n
#>   <chr>        <int>
#> 1 New Building  4728
```
