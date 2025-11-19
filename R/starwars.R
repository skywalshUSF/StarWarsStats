#' Star Wars Characters
#'
#' A dataset containing the characteristics of 87 Star Wars characters.
#'
#' @format A data frame with 87 rows and 13 variables:
#' \describe{
#'   \item{name}{Character name.}
#'   \item{height}{Height (cm).}
#'   \item{mass}{Mass (kg).}
#'   \item{hair_color}{Hair color (e.g., "blond", "brown", "black", "none").}
#'   \item{skin_color}{Skin color (e.g., "fair", "gold", "white", "light").}
#'   \item{eye_color}{Eye color (e.g., "blue", "yellow", "brown", "black").}
#'   \item{birth_year}{Birth year (BBY = Before the Battle of Yavin).}
#'   \item{sex}{The biological sex of the character (e.g., "male", "female", "hermaphroditic", "none").}
#'   \item{gender}{The gender role or identity of the character (e.g., "masculine", "feminine", "none").}
#'   \item{homeworld}{Name of the home planet, a character vector.}
#'   \item{species}{Name of the species, a character vector.}
#'   \item{films}{List of films the character appeared in, a list of character vectors.}
#'   \item{vehicles}{List of vehicles the character used, a list of character vectors.}
#'   \item{starships}{List of starships the character used, a list of character vectors.}
#' }
#' @source The original data was obtained from the (now defunct) Star Wars API,
#' \url{https://swapi.py4e.com/}. It has been revised to include additional
#' research into gender and sex determinations of characters.
#' @examples
#' data(starwars)
#' head(starwars)
#' summary(starwars$height)
"starwars"
