#' Retrieve Characters Associated with a Specific Starship
#'
#' Filters the 'starwars' dataset to find characters who have
#' piloted a specific starship.
#'
#' @details This function is designed to search within the 'starships' list-column
#' of the 'starwars' dataset. It performs a case-insensitive search, meaning
#' "Millennium Falcon" and "millennium falcon" will yield the same results.
#' If no matching starship is found, or if no characters are associated with it,
#' the function stops with a clear error message.
#'
#' @param starship_name A character string representing the name of the starship
#'   to search for. The search is case-insensitive.
#'
#' @returns A tibble (data frame) containing all 14 columns, showing all characters
#'   who have the specified starship listed in their 'starships' column.
#'
#' @import dplyr
#'
#' @export
#'
#' @examples
#' # Find characters who have flown the Millennium Falcon
#' get_starwars_data_by_starship(starship_name = "Millennium Falcon")
#'
#' # Find characters associated with the X-wing (case-insensitive)
#' get_starwars_data_by_starship(starship_name = "x-wing")
#'
#' # Example of a non-matching ship (will stop execution)
#' # \dontrun{
#' # get_starwars_data_by_starship("Imperial Star Destroyer")
#' # }
#'
get_starwars_data_by_starship <- function(starship_name) {

  # Dependency check (using tryCatch for robustness)
  matched_chars <- tryCatch({
    starwars_data <- dplyr::starwars

    # Normalize the user input to lowercase
    input_lower <- tolower(starship_name)

    # Check which rows have the input starship name in their list of starships
    # by converting every name in every list to lowercase before comparison.
    matches <- sapply(starwars_data$starships, function(ships) {
      # If the list 'ships' is empty (character has no starships), the expression fails.
      # We use an if check to ensure we only apply tolower() to non-empty lists.
      if (length(ships) > 0) {
        input_lower %in% tolower(ships)
      } else {
        FALSE # No matches in an empty list
      }
    })

    # Filter the original data using the logical vector
    starwars_data[matches, ]

  }, error = function(e) {
    # Handle dependency or general data processing error gracefully
    stop(
      "Function failed: Ensure the 'dplyr' package is installed and accessible.",
      call. = FALSE
    )
  })

  # Input Validation and Error Handling
  if (nrow(matched_chars) == 0) {
    # Using sprintf for cleaner error message construction
    stop(sprintf(
      "Error: No character data found for the starship '%s'. That name may not be in the data set or may not have an associated pilot.",
      starship_name
    ), call. = FALSE)
  } else {
    # If matches are found, return the data
    return(matched_chars)
  }
}
