## code to prepare `starwars` dataset goes here

# Load 'dplyr'
library(dplyr)

# Use data() to load 'starwars' data set
data(starwars, package = "dplyr")

# Use use_data()
usethis::use_data(starwars, overwrite = TRUE)
