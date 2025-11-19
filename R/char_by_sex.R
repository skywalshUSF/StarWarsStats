#' Filter Characters by Sex (Male or Female)
#'
#' Subsets the Star Wars characters based on a user-specified sex input ('M' or 'F').
#'
#' @details This function validates the input, converts 'M' to "male" and 'F' to "female"
#' to match the values in the 'starwars' dataset, and then filters the data.
#' The function returns a focused table including the character's name, sex, and homeworld,
#' grouped by sex and sorted alphabetically by name.
#'
#' @param sex_input A character string specifying the sex to filter by. Must be 'M' (for male)
#'   or 'F' (for female), case-insensitive.
#'
#' @returns A grouped tibble (data frame) containing the 'name', 'sex', and
#'   'homeworld' of the filtered characters, arranged alphabetically by name.
#'
#' @import dplyr
#'
#' @export
#'
#' @examples
#' # Find all female characters
#' char_by_sex(sex_input = "F")
#'
#' # Find all male characters (case-insensitive check)
#' char_by_sex(sex_input = "m")
#'
#' # Example of a common error (will stop execution)
#' # \dontrun{
#' # char_by_sex(sex_input = "alien")
#' # }
#'
char_by_sex <- function(sex_input) {
  valid_sex <- c("M", "F")
  input_upper <- toupper(sex_input)

  # Input Validation Check
  if (!(input_upper %in% valid_sex)) {
    stop(paste("Invalid input: '", sex_input, "'. Please enter 'M' or 'F'.", sep = ""), call. = FALSE)
  }

  # IF statement to map input to full word from data set sex variable
  target_sex <- ""
  if (input_upper == "M") {
    target_sex <- "male"
  } else if (input_upper == "F") {
    target_sex <- "female"
  }

  # Load data
  starwars_data <- dplyr::starwars

  # Filter using the full word & select required columns
  filtered_chars <- tryCatch({
    starwars_data %>%
      dplyr::filter(sex == target_sex) %>%
      # Select only name, sex, and homeworld
      dplyr::select(name, sex, homeworld) %>%
      dplyr::group_by(sex) %>%
      dplyr::arrange(name)
  }, error = function(e) {
    # Handle potential dependency errors
    stop(
      "Function failed: Ensure the 'dplyr' package is installed and accessible.",
      call. = FALSE
    )
  })

  return(filtered_chars)
}
