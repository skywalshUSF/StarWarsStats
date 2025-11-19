# This file is used to suppress the "no visible binding for global variable"
# NOTE during R CMD check for unquoted column names used inside dplyr verbs.
# It now includes all columns from the starwars dataset for future use.

utils::globalVariables(c("name", "height", "mass", "hair_color", "skin_color",
                         "eye_color", "birth_year", "sex", "gender",
                         "homeworld", "species", "films", "vehicles", "starships"))
