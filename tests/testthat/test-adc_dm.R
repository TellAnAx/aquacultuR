test_that("adc_dm() throws error when input is not numeric", {
  expect_error(adc_dm(dm_diet = "a", std_diet = 0.01, std_feces = 0.05))
  expect_error(adc_dm(dm_diet = 1, std_diet = "b", std_feces = 0.05))
  expect_error(adc_dm(dm_diet = 1, std_diet = 0.01, std_feces = "c"))
})

test_that("adc_dm() throws error when inputs have different lengths", {
  expect_error(adc_dm(dm_diet = c(1,1), std_diet = 0.01, std_feces = 0.05))
  expect_error(adc_dm(dm_diet = 1, std_diet = c(0.01, 0.01), std_feces = 0.05))
  expect_error(adc_dm(dm_diet = 1, std_diet = 0.01, std_feces = c(0.05, 0.05)))
})

test_that("adc_dm() throws warning when input is < 0", {
  expect_warning(adc_dm(dm_diet = -1, std_diet = 0.01, std_feces = 0.05))
  expect_warning(adc_dm(dm_diet = 1, std_diet = -0.01, std_feces = 0.05))
  expect_warning(adc_dm(dm_diet = 1, std_diet = 0.01, std_feces = -0.05))
})

test_that("adc_dm() calculates ADC correctly", {
  expect_equal(adc_dm(dm_diet = 1, std_diet = 0.01, std_feces = 0.05), 0.8)
})
