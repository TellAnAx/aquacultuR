test_that("adc_nut() throws error when input is not numeric", {
  expect_error(adc_nut(std_diet = "a", std_feces = 0.05, nut_diet = 0.8, nut_feces = 0.1))
  expect_error(adc_nut(std_diet = 0.01, std_feces = "b", nut_diet = 0.8, nut_feces = 0.1))
  expect_error(adc_nut(std_diet = 0.01, std_feces = 0.05, nut_diet = "c", nut_feces = 0.1))
  expect_error(adc_nut(std_diet = 0.01, std_feces = 0.05, nut_diet = 0.8, nut_feces = "d"))
})

test_that("adc_nut() throws error when inputs are of different length", {
  expect_error(adc_nut(std_diet = c(0.01, 0.01), std_feces = 0.05, nut_diet = 0.8, nut_feces = 0.1))
  expect_error(adc_nut(std_diet = 0.01, std_feces = c(0.05, 0.05), nut_diet = 0.8, nut_feces = 0.1))
  expect_error(adc_nut(std_diet = 0.01, std_feces = 0.05, nut_diet = c(0.8, 0.8), nut_feces = 0.1))
  expect_error(adc_nut(std_diet = 0.01, std_feces = 0.05, nut_diet = 0.8, nut_feces = c(0.1, 0.1)))
})

test_that("adc_nut() throws warning when input is < 0", {
  expect_warning(expect_warning(adc_nut(std_diet = -0.01, std_feces = 0.05, nut_diet = 0.8, nut_feces = 0.1)))
  expect_warning(expect_warning(adc_nut(std_diet = 0.01, std_feces = -0.05, nut_diet = 0.8, nut_feces = 0.1)))
  expect_warning(expect_warning(adc_nut(std_diet = 0.01, std_feces = 0.05, nut_diet = -0.8, nut_feces = 0.1)))
  expect_warning(expect_warning(adc_nut(std_diet = 0.01, std_feces = 0.05, nut_diet = 0.8, nut_feces = -0.1)))
})

test_that("adc_nut() calculates ADC correctly", {
  expect_equal(adc_nut(std_diet = 0.01, std_feces = 0.05, nut_diet = 0.8, nut_feces = 0.1), 0.975)
})
