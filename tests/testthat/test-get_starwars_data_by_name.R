test_that("get_starwars_data_by_name handles valid input correctly", {

  # Use a known character name (case-sensitive)
  result_luke <- get_starwars_data_by_name("Luke Skywalker")

  # 1. Check if the output is a tibble/data frame
  expect_s3_class(result_luke, "tbl_df")

  # 2. Check for the correct dimensions (1 row, 14 columns)
  expect_equal(nrow(result_luke), 1)
  expect_equal(ncol(result_luke), 14)

  # 3. Check that the returned character name is correct
  expect_equal(result_luke$name, "Luke Skywalker")

  # 4. Spot check a known attribute (Luke's height is 172 cm)
  expect_equal(result_luke$height, 172)

  # 5. Check another known character
  result_r2d2 <- get_starwars_data_by_name("R2-D2")
  expect_equal(result_r2d2$name, "R2-D2")
  expect_equal(result_r2d2$species, "Droid")
})


test_that("get_starwars_data_by_name handles errors for non-existent or case-mismatched names", {

  # 1. Test for a character not in the dataset
  expect_error(get_starwars_data_by_name("Billy Bob"),
               "Error: The name ' Billy Bob ' is not in the data set.",
               fixed = TRUE)

  # 2. Test for case-sensitivity failure (incorrect case)
  expect_error(get_starwars_data_by_name("luke skywalker"),
               "Error: The name ' luke skywalker ' is not in the data set.",
               fixed = TRUE)

  # 3. Test for missing input
  expect_error(get_starwars_data_by_name(),
               "Function failed: Ensure the 'dplyr' package is installed and accessible.",
               fixed = TRUE)
})
