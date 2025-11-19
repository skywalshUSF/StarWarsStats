
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

# remotes::install_github("skywalshUSF/StarWarsStats", build_vignettes = TRUE)
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

### char_by_sex()

Filter Characters by Sex (Male or Female)

Subsets the Star Wars characters based on a user-specified sex input
(‘M’ or ‘F’).

This function validates the input, converts ‘M’ to “male” and ‘F’ to
“female” to match the values in the ‘starwars’ dataset, and then filters
the data. The function returns a focused table including the character’s
name, sex, and homeworld, grouped by sex and sorted alphabetically by
name.

``` r
# Find all female characters
char_by_sex(sex_input = "F")
#> # A tibble: 16 × 3
#> # Groups:   sex [1]
#>    name               sex    homeworld
#>    <chr>              <chr>  <chr>    
#>  1 Adi Gallia         female Coruscant
#>  2 Ayla Secura        female Ryloth   
#>  3 Barriss Offee      female Mirial   
#>  4 Beru Whitesun Lars female Tatooine 
#>  5 Captain Phasma     female <NA>     
#>  6 Dormé              female Naboo    
#>  7 Jocasta Nu         female Coruscant
#>  8 Leia Organa        female Alderaan 
#>  9 Luminara Unduli    female Mirial   
#> 10 Mon Mothma         female Chandrila
#> 11 Padmé Amidala      female Naboo    
#> 12 Rey                female <NA>     
#> 13 Shaak Ti           female Shili    
#> 14 Shmi Skywalker     female Tatooine 
#> 15 Taun We            female Kamino   
#> 16 Zam Wesell         female Zolan

# Find all male characters (case-insensitive check)
char_by_sex(sex_input = "m")
#> # A tibble: 60 × 3
#> # Groups:   sex [1]
#>    name                sex   homeworld
#>    <chr>               <chr> <chr>    
#>  1 Ackbar              male  Mon Cala 
#>  2 Anakin Skywalker    male  Tatooine 
#>  3 Arvel Crynyd        male  <NA>     
#>  4 Bail Prestor Organa male  Alderaan 
#>  5 Ben Quadinaros      male  Tund     
#>  6 Bib Fortuna         male  Ryloth   
#>  7 Biggs Darklighter   male  Tatooine 
#>  8 Boba Fett           male  Kamino   
#>  9 Bossk               male  Trandosha
#> 10 Chewbacca           male  Kashyyyk 
#> # ℹ 50 more rows
```

### chars_born_before()

Filter Characters Born Before a BBY Threshold

Returns a subset of Star Wars characters who were born earlier than (or
“before”) a specified year threshold (BBY).

This function is designed for chronological analysis. In the ‘starwars’
dataset, the ‘birth_year’ is given in BBY (Before Battle of Yavin).
Therefore, a higher number indicates the character was born *earlier* in
the timeline. The function filters for characters where ‘birth_year’ is
*greater* than ‘year_threshold_bby’, effectively finding the older
individuals. The input range is validated to be between 8 and 896.

``` r
# Find characters born before 200 BBY (e.g., Yoda, Jabba)
chars_born_before(year_threshold_bby = 200)
#> # A tibble: 2 × 14
#>   name      height  mass hair_color skin_color eye_color birth_year sex   gender
#>   <chr>      <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> <chr> 
#> 1 Yoda          66    17 white      green      brown            896 male  mascu…
#> 2 Jabba De…    175  1358 <NA>       green-tan… orange           600 herm… mascu…
#> # ℹ 5 more variables: homeworld <chr>, species <chr>, films <list>,
#> #   vehicles <list>, starships <list>

# Find characters born before 80 BBY
chars_born_before(year_threshold_bby = 80)
#> # A tibble: 10 × 14
#>    name     height  mass hair_color skin_color eye_color birth_year sex   gender
#>    <chr>     <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> <chr> 
#>  1 Yoda         66    17 white      green      brown            896 male  mascu…
#>  2 Jabba D…    175  1358 <NA>       green-tan… orange           600 herm… mascu…
#>  3 Chewbac…    228   112 brown      unknown    blue             200 male  mascu…
#>  4 C-3PO       167    75 <NA>       gold       yellow           112 none  mascu…
#>  5 Dooku       193    80 white      fair       brown            102 male  mascu…
#>  6 Qui-Gon…    193    89 brown      fair       blue              92 male  mascu…
#>  7 Ki-Adi-…    198    82 white      pale       yellow            92 male  mascu…
#>  8 Finis V…    170    NA blond      fair       blue              91 male  mascu…
#>  9 Palpati…    170    75 grey       pale       yellow            82 male  mascu…
#> 10 Cliegg …    183    NA brown      fair       blue              82 male  mascu…
#> # ℹ 5 more variables: homeworld <chr>, species <chr>, films <list>,
#> #   vehicles <list>, starships <list>
```

### get_starwars_data_by_name()

Retrieve Star Wars Data for a Specific Character

Filters the entire ‘starwars’ dataset to return all available
information for a single, named character.

This function is case-sensitive! You must enter the character’s name
exactly as it appears in the ‘name’ column of the ‘starwars’ dataset
(e.g., “Luke Skywalker” works, but “luke skywalker” will cause an
error). It provides robust error handling if the specified name is not
found.

``` r
# Correct way to find Luke Skywalker
get_starwars_data_by_name("Luke Skywalker")
#> # A tibble: 1 × 14
#>   name      height  mass hair_color skin_color eye_color birth_year sex   gender
#>   <chr>      <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> <chr> 
#> 1 Luke Sky…    172    77 blond      fair       blue              19 male  mascu…
#> # ℹ 5 more variables: homeworld <chr>, species <chr>, films <list>,
#> #   vehicles <list>, starships <list>

# Example of a non-matching name (will stop execution)
# \dontrun{
# get_starwars_data_by_name("Darth Vader")
# }
```

### get_starwars_data_by_starship()

Retrieve Characters Associated with a Specific Starship

Filters the ‘starwars’ dataset to find characters who have piloted a
specific starship.

This function is designed to search within the ‘starships’ list-column
of the ‘starwars’ dataset. It performs a case-insensitive search,
meaning “Millennium Falcon” and “millennium falcon” will yield the same
results. If no matching starship is found, or if no characters are
associated with it, the function stops with a clear error message.

``` r
# Find characters who have flown the Millennium Falcon
get_starwars_data_by_starship(starship_name = "Millennium Falcon")
#> # A tibble: 4 × 14
#>   name      height  mass hair_color skin_color eye_color birth_year sex   gender
#>   <chr>      <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> <chr> 
#> 1 Chewbacca    228   112 brown      unknown    blue             200 male  mascu…
#> 2 Han Solo     180    80 brown      fair       brown             29 male  mascu…
#> 3 Lando Ca…    177    79 black      dark       brown             31 male  mascu…
#> 4 Nien Nunb    160    68 none       grey       black             NA male  mascu…
#> # ℹ 5 more variables: homeworld <chr>, species <chr>, films <list>,
#> #   vehicles <list>, starships <list>

# Find characters associated with the X-wing (case-insensitive)
get_starwars_data_by_starship(starship_name = "x-wing")
#> # A tibble: 5 × 14
#>   name      height  mass hair_color skin_color eye_color birth_year sex   gender
#>   <chr>      <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> <chr> 
#> 1 Luke Sky…    172    77 blond      fair       blue              19 male  mascu…
#> 2 Biggs Da…    183    84 black      light      brown             24 male  mascu…
#> 3 Wedge An…    170    77 brown      fair       hazel             21 male  mascu…
#> 4 Jek Tono…    180   110 brown      fair       blue              NA <NA>  <NA>  
#> 5 Poe Dame…     NA    NA brown      light      brown             NA male  mascu…
#> # ℹ 5 more variables: homeworld <chr>, species <chr>, films <list>,
#> #   vehicles <list>, starships <list>

# Example of a non-matching ship (will stop execution)
# \dontrun{
# get_starwars_data_by_starship("Imperial Star Destroyer")
# }
```
