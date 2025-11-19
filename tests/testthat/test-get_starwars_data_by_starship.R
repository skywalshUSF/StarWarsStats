test_that("get_starwars_data_by_starship handles valid input (case-insensitive) and structure", {

  # Use a known ship with mixed case
  ship_name <- "mIllENnium FALcoN"
  result_falcon <- get_starwars_data_by_starship(starship_name = ship_name)

  # 1. Check if the output is a tibble/data frame
  expect_s3_class(result_falcon, "tbl_df")

  # 2. Check for the correct dimensions
  expect_equal(nrow(result_falcon), 4)
  expect_equal(ncol(result_falcon), 14) # Should return all columns

  # 3. Check for the correct pilots (Han Solo and Chewbacca)
  expected_pilots <- c("Han Solo", "Chewbacca")
  expect_true(all(expected_pilots %in% result_falcon$name))

  # 4. Test with a different valid ship (case-sensitive input)
  result_xwing <- get_starwars_data_by_starship(starship_name = "X-wing")

  # The 'starwars' dataset lists 5 characters with an X-wing
  expect_equal(nrow(result_xwing), 5)
})


test_that("get_starwars_data_by_starship handles errors for non-existent ships", {

  # 1. Test for a ship name that does not exist
  non_existent_ship <- "Titanic"
  expected_error_message_1 <- sprintf(
    "Error: No character data found for the starship '%s'. That name may not be in the data set or may not have an associated pilot.",
    non_existent_ship
  )
  expect_error(get_starwars_data_by_starship(non_existent_ship),
               expected_error_message_1,
               fixed = TRUE)

  # 2. Test for a ship name that may exist but has no pilots associated (e.g., "Sentinel-class landing craft" is not in the ship list)
  # Using a character not present in the data for reliable zero-match test
  non_existent_ship_2 <- "Kessel Run Speeder"
  expected_error_message_2 <- sprintf(
    "Error: No character data found for the starship '%s'. That name may not be in the data set or may not have an associated pilot.",
    non_existent_ship_2
  )
  expect_error(get_starwars_data_by_starship(non_existent_ship_2),
               expected_error_message_2,
               fixed = TRUE)

  # 3. Test for missing input (R's built-in error)
  expect_error(get_starwars_data_by_starship(),
               "Function failed: Ensure the 'dplyr' package is installed and accessible.",
               fixed = TRUE)
})
