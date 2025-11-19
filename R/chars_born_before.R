#' Filter Characters Born Before a BBY Threshold
#'
#' Returns a subset of Star Wars characters who were born earlier
#' than (or "before") a specified year threshold (BBY).
#'
#' @details This function is designed for chronological analysis. In the 'starwars'
#' dataset, the 'birth_year' is given in BBY (Before Battle of Yavin). Therefore,
#' a higher number indicates the character was born *earlier* in the timeline.
#' The function filters for characters where 'birth_year' is *greater* than
#' 'year_threshold_bby', effectively finding the older individuals.
#' The input range is validated to be between 8 and 896.
#'
#' @param year_threshold_bby A positive numeric value representing the minimum BBY
#'   year. Characters with a birth year greater than this value will be included.
#'   (e.g., entering 50 finds those born before 50 BBY).
#'
#' @returns A tibble (data frame) containing all columns of the filtered 'starwars'
#'   dataset, arranged in descending order by 'birth_year' (oldest first).
#'
#' @import dplyr
#'
#' @export
#'
#' @examples
#' # Find characters born before 80 BBY (e.g., Yoda, Palpatine)
#' chars_born_before(year_threshold_bby = 80)
#'
#' # Find characters born before 40 BBY
#' chars_born_before(year_threshold_bby = 40)
#'
chars_born_before <- function(year_threshold_bby) {

  # Input Validation: Check if the input is numeric and within the range [8, 896]
  if (!is.numeric(year_threshold_bby) ||
      year_threshold_bby < 8 ||
      year_threshold_bby > 896) {
    stop(paste("Invalid input: The year threshold must be a number between 8 and 896 (BBY range)."), call. = FALSE)
  }

  # Dependency check
  filtered_results <- tryCatch({

    starwars_data <- dplyr::starwars

    # Filter the data for characters born *before* the specified year
    # (Higher BBY number means earlier in time)
    filtered_chars <- starwars_data %>%
      dplyr::filter(birth_year > year_threshold_bby) %>%
      dplyr::arrange(desc(birth_year)) # Arrange by year to show oldest first

    # Return the filtered data
    return(filtered_chars)

  }, error = function(e) {
    # Handle the dependency error
    stop(
      "Function failed: Ensure the 'dplyr' package is installed and accessible.",
      call. = FALSE
    )
  })
}
