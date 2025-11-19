#' Filter Characters Taller Than a Minimum Height by Planet
#'
#' Subsets the Star Wars characters who meet or exceed a specified minimum height
#' and groups the results by their homeworld. Includes input validation.
#'
#' @details This function is useful for identifying the tallest individuals and analyzing
#' their distribution across different planets. The resulting data frame includes
#' all 14 columns from the original 'starwars' dataset, but is grouped by
#' 'homeworld' and then sorted by height in descending order within each group.
#'
#' @param min_height A positive numeric value representing the minimum height
#'  (in centimeters) for characters to be included in the output.
#'
#' @returns A grouped tibble (data frame) with columns 'name', 'height', and
#'  'homeworld', arranged by homeworld and descending height.
#'
#' @import dplyr
#'
#' @export
#'
#' @examples
#'
#' # Find all characters who are 200 cm (6'7") or taller
#' char_height_by_planet(min_height = 200)
#'
#' # Find the giants of the galaxy (e.g., taller than 225 cm)
#' char_height_by_planet(min_height = 225)
#'
char_height_by_planet <- function(min_height) {

  # Input validation:
  # Check if the input is valid (a positive numeric value)
  if (!is.numeric(min_height) || min_height <= 0) {
    # If the user provides bad input, we stop with a clear message.
    stop("Please enter a valid positive numeric value for minimum height.", call. = FALSE)
  }

  # Dependency check (using tryCatch for robustness)
  filtered_results <- tryCatch({

    # Load data
    starwars_data <- dplyr::starwars

    # Filter the data based on the user-provided height threshold
    filtered_data <- starwars_data %>%
      dplyr::filter(height >= min_height)

    # Group the filtered data by homeworld (planet)
    characters_by_planet <- filtered_data %>%
      dplyr::group_by(homeworld) %>%
      dplyr::select(name,height,homeworld) %>%
      dplyr::arrange(homeworld, desc(height))

    # Return the data table with all columns
    return(characters_by_planet)

  }, error = function(e) {
    # Handle the dependency error
    stop(
      "Function failed: Ensure the 'dplyr' package is installed and accessible.",
      call. = FALSE
    )
  })
}
