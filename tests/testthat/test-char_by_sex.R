test_that("char_by_sex handles invalid input correctly", {

  # 1. Test for invalid character input (not M or F)
  expect_error(char_by_sex("Other"),
               "Invalid input: 'Other'. Please enter 'M' or 'F'.",
               fixed = TRUE)

  # 2. Test for non-character input (e.g., a number)
  # The toupper() conversion will usually fail on non-characters, but testing robustness is good.
  expect_error(char_by_sex(123),
               "Invalid input: '123'. Please enter 'M' or 'F'.", # The error message will contain the input as a string
               fixed = TRUE)

  # 3. Test for missing input (R's built-in error)
  expect_error(char_by_sex(),
               "argument \"sex_input\" is missing, with no default",
               fixed = TRUE)
})


test_that("char_by_sex correctly filters and structures data for 'Female'", {

  # Use a valid input (lowercase f)
  result_f <- char_by_sex("f")

  # 1. Check if the output is a tibble/data frame
  expect_s3_class(result_f, "tbl_df")

  # 2. Check for the correct number of columns (name, sex, homeworld)
  expected_cols <- c("name", "sex", "homeworld")
  expect_equal(names(result_f), expected_cols)
  expect_equal(ncol(result_f), 3)

  # 3. Check the number of rows
  expect_equal(nrow(result_f), 16)

  # 4. Check if the filtering was correct (all sex values should be "female")
  expect_true(all(result_f$sex == "female"))
})

test_that("char_by_sex correctly filters and structures data for 'Male'", {

  # Use a valid input (uppercase M)
  result_m <- char_by_sex("M")

  # 1. Check the number of rows
  expect_equal(nrow(result_m), 60)

  # 2. Check if the filtering was correct (all sex values should be "male")
  expect_true(all(result_m$sex == "male"))

  # 3. Check sorting (alphabetical by name)
  # The first entry should be the lowest alphabetically
  expect_equal(result_m$name[1], "Ackbar")
})
