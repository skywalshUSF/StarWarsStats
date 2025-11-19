test_that("char_height_by_planet returns correct structure and data", {

  # Use a known threshold (e.g., 200 cm)
  result <- char_height_by_planet(min_height = 200)

  # 1. Check if the output is a tibble/data frame
  expect_s3_class(result, "tbl_df")

  # 2. Check for the correct number of columns
  expect_equal(ncol(result), 3)

  # 3. Check for the correct column names
  expected_cols <- c("name", "height", "homeworld")
  expect_equal(names(result), expected_cols)

  # 4. Check the number of rows for a known threshold (200 cm)
  expect_equal(nrow(result), 11)

  # 5. Check if all heights meet the minimum threshold
  expect_true(all(result$height >= 200))

})

test_that("char_height_by_planet handles invalid and missing input correctly", {

  # 1. Test for non-numeric input
  expect_error(char_height_by_planet("tall"),
               "Please enter a valid positive numeric value for minimum height.",
               fixed = TRUE)

  # 2. Test for zero input
  expect_error(char_height_by_planet(0),
               "Please enter a valid positive numeric value for minimum height.",
               fixed = TRUE)

  # 3. Test for negative input
  expect_error(char_height_by_planet(-100),
               "Please enter a valid positive numeric value for minimum height.",
               fixed = TRUE)

  # 4. Test for missing input
  expect_error(char_height_by_planet(),
               "argument \"min_height\" is missing, with no default",
               fixed = TRUE)
})
