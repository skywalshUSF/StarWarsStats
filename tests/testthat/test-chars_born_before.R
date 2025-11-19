test_that("chars_born_before handles invalid input correctly", {

  # 1. Test for non-numeric input
  expect_error(chars_born_before("ancient"),
               "Invalid input: The year threshold must be a number between 8 and 896 (BBY range).",
               fixed = TRUE)

  # 2. Test for input below the minimum valid threshold (8 BBY)
  expect_error(chars_born_before(5),
               "Invalid input: The year threshold must be a number between 8 and 896 (BBY range).",
               fixed = TRUE)

  # 3. Test for input above the maximum valid threshold (896 BBY)
  expect_error(chars_born_before(900),
               "Invalid input: The year threshold must be a number between 8 and 896 (BBY range).",
               fixed = TRUE)

  # 4. Test for missing input (R's built-in error)
  expect_error(chars_born_before(),
               "argument \"year_threshold_bby\" is missing, with no default",
               fixed = TRUE)
})


test_that("chars_born_before correctly filters and sorts for known oldest characters", {

  # Test 1: Threshold 80 BBY. Should include Yoda (896) and Palpatine (82).
  # 80 < birth_year.
  result_80 <- chars_born_before(year_threshold_bby = 80)

  # 1. Check if the output is a tibble/data frame
  expect_s3_class(result_80, "tbl_df")

  # 2. Check the number of rows
  expect_equal(nrow(result_80), 10)
})


test_that("chars_born_before handles small thresholds correctly", {

  # Test 2: Threshold 60 BBY. Should include Yoda (896), Palpatine (82), but NOT Obi-Wan (57).
  # 60 < birth_year.
  result_60 <- chars_born_before(year_threshold_bby = 60)

  # 1. Check the number of rows
  expect_equal(nrow(result_60), 16)
})

test_that("chars_born_before handles no matching data gracefully", {

  # Use an extreme threshold higher than the oldest character (896 BBY)
  result_900 <- chars_born_before(year_threshold_bby = 896)

  # Check that the result is still a tibble
  expect_s3_class(result_900, "tbl_df")

  # Check that the result has zero rows (since no one is older than Yoda)
  expect_equal(nrow(result_900), 0)
})
