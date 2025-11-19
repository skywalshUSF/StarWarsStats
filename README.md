
<!-- README.md is generated from README.Rmd. Please edit that file -->

# StarWarsStats

<!-- badges: start -->

<!-- badges: end -->

The goal of this R Package is to provide a set of utility functions to
easily load, filter, validate, and analyze data from the
‘dplyr::starwars’ data set, focusing on character attributes, names,
heights, genders, and associated starships. The package offers robust,
well documented examples of R programming techniques, including, ‘dplyr’
wrangling, input validation, and error handling within a fun, accessible
domain. It was created as an educational exercise to demonstrate
practical R function writing and documentation standards, and is
primarily intended for students learning R programming who want hands on
examples of data manipulation and building reuseable functions within
validation checks.

## Installation

Since this package is not yet on CRAN, you can install the development
version directly from
[GitHub](https://github.com/skywalshUSF/StarWarsStats) using the
‘remotes’ package.

### Prerequisites

You must have the following packages installed:

remotes: To install packages directly from GitHub.

dplyr: This package contains the ‘starwars’ dataset and the functions
the package relies on.

You can install these prerequisites by running the following command in
your R console:

``` r
# install.packages(c("remotes", "dplyr"))
```

### Install the ‘StarWarsStats’ Package

Once the remotes package is installed, use the install_github()
function:

``` r
# Install 'StarWarsStats' package

# remotes::install_github("skywalshUSF/StarWarsStats")
```

### Load the Package

After installation is complete, you can load the package and start using
your functions:

``` r
library(StarWarsStats)
```

## Data

The ‘StarWarsStats’ package uses the widely available ‘starwars’ dataset
provided by the ‘dplyr’ package.

Source: The data is a curated selection from the Star Wars API (SWAPI),
packaged for use in R.

Content: It contains 87 characters across 14 variables, covering
biographical, physical, and historical information (e.g., name, height,
species, and films appeared in).

Key Detail (Birth Year): Note that birth years are measured relative to
the Battle of Yavin (BBY). A positive number (e.g., 41.9) means the
event occurred Before the Battle of Yavin, and a negative number means
it occurred After the Battle of Yavin (ABY).

``` r
# To see a full description of all 14 variables in the dataset, run the following command in your R console:

# ?starwars
# summary(starwars)
```

## Examples of Functions

### char_height_by_planet()

Filter Characters Taller Than a Minimum Height by Planet

Subsets the Star Wars characters who meet or exceed a specified minimum
height and groups the results by their homeworld.

This function is useful for identifying the tallest individuals and
analyzing their distribution across different planets. The resulting
data frame includes the name, height, and homeworld columns from the
dataset, but is grouped by homeworld and then sorted by height in
descending order within each group.

``` r
# Find all characters who are 200 cm (6'7") or taller
char_height_by_planet(min_height = 200)
#> # A tibble: 11 × 3
#> # Groups:   homeworld [8]
#>    name         height homeworld
#>    <chr>         <int> <chr>    
#>  1 Grievous        216 Kalee    
#>  2 Lama Su         229 Kamino   
#>  3 Taun We         213 Kamino   
#>  4 Tarfful         234 Kashyyyk 
#>  5 Chewbacca       228 Kashyyyk 
#>  6 Roos Tarpals    224 Naboo    
#>  7 Rugor Nass      206 Naboo    
#>  8 Yarael Poof     264 Quermia  
#>  9 Darth Vader     202 Tatooine 
#> 10 Tion Medon      206 Utapau   
#> 11 IG-88           200 <NA>

# Find the giants of the galaxy (e.g., taller than 225 cm)
char_height_by_planet(min_height = 225)
#> # A tibble: 4 × 3
#> # Groups:   homeworld [3]
#>   name        height homeworld
#>   <chr>        <int> <chr>    
#> 1 Lama Su        229 Kamino   
#> 2 Tarfful        234 Kashyyyk 
#> 3 Chewbacca      228 Kashyyyk 
#> 4 Yarael Poof    264 Quermia
```
