#' Return a tibble of Star Wars characters' names and heights, grouped by planet
#'
#' Filters the built-in 'starwars' data set to include only characters above a
#' specified height threshold, then returns their name, height, and homeworld
#'  (planet), grouped by planet. Includes input validation.
#'
#' @param min_height A numeric value (integer) representing the minimum height
#'  (in centimeters) for characters to be included in the output.
#'
#' @returns A grouped tibble (data frame) with columns 'name', 'height', and
#'  'homeworld', arranged by homeworld and descending height.
#'
#' @import dplyr
#' @importFrom rlang .data
#'
#' @export
#'
#' @examples
#'
#' # Requires the 'dplyr' package to run the function definition
#' if(requireNamespace("dplyr",quietly=TRUE)){
#'   char_height_by_planet(min_height=180)
#'   char_height_by_planet(100)
#' }
#'
char_height_by_planet <- function(min_height) {

  # Input validation:
  # Check if the input is valid (a positive numeric value)
  if (!is.numeric(min_height) || min_height <= 0) {
    stop("Please enter a valid positive numeric value for minimum height.")
  }

  # Load data
  starwars_data <- dplyr::starwars

  # Filter the data based on the user-provided height threshold
  filtered_data <- starwars_data %>%
    dplyr::filter(.data$height >= min_height)

  # Group the filtered data by homeworld (planet) and select relevant columns
  characters_by_planet <- filtered_data %>%
    dplyr::group_by(.data$homeworld) %>%
    dplyr::select(.data$name, .data$height, .data$homeworld) %>%
    dplyr::arrange(.data$homeworld, desc(.data$height))

  # Return the data table with names and heights
  return(characters_by_planet)
}
