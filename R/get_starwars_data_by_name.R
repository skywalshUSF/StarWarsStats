#' Retrieve Star Wars Data for a Specific Character
#'
#' Filters the entire 'starwars' dataset to return all available
#' information for a single, named character.
#'
#' @details This function is case-sensitive! You must enter the character's name
#' exactly as it appears in the 'name' column of the 'starwars' dataset
#' (e.g., "Luke Skywalker" works, but "luke skywalker" will cause an error).
#' It provides robust error handling if the specified name is not found.
#'
#' @param character_name A character string representing the exact, case-sensitive
#'   name of the Star Wars character to retrieve.
#'
#' @returns A tibble (data frame) containing all 14 columns, with a single row
#'   of data for the matching character.
#'
#' @import dplyr
#'
#' @export
#'
#' @examples
#' # Correct way to find Luke Skywalker
#' get_starwars_data_by_name("Luke Skywalker")
#'
#' # Example of a non-matching name (will stop execution)
#' # \dontrun{
#' # get_starwars_data_by_name("Darth Vader")
#' # }
#'
get_starwars_data_by_name <- function(character_name) {

  # Dependency check (using tryCatch for robustness)
  match <- tryCatch({
    starwars_data <- dplyr::starwars

    # Filter the data to find the matching name
    # Note: The 'name' column in the starwars data is case-sensitive.
    starwars_data %>%
      dplyr::filter(name == character_name)

  }, error = function(e) {
    # If dplyr or data loading fails, catch it here
    stop(
      "Function failed: Ensure the 'dplyr' package is installed and accessible.",
      call. = FALSE
    )
  })

  # Input Validation and Error Handling
  if (nrow(match) == 0) {
    # If the resulting data frame has 0 rows, the name wasn't found.
    stop(paste("Error: The name '", character_name, "' is not in the data set."), call. = FALSE)
  } else {
    # If a match is found, return the data
    return(match)
  }
}
