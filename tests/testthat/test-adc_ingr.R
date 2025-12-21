# Example data from Bureau and Hua, 2001

test_that("adc_ingr() throws error when input is not numeric", {
  expect_error(
    adc_ingr(
      adc_test = "a",
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945
    )
  )
  expect_error(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = "b",
      nut_ref = 0.465,
      nut_ingr = 0.945
    )
  )
  expect_error(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = "c",
      nut_ingr = 0.945
    )
  )
  expect_error(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = "d"
    )
  )
  expect_error(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ref = "e",
      dm_ingr = 1,
      incl_ingr = 0.3
    )
  )
  expect_error(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ref = 1,
      dm_ingr = "f",
      incl_ingr = 0.3
    )
  )
  expect_error(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ref = 1,
      dm_ingr = 1,
      incl_ingr = "g"
    )
  )
})

test_that("adc_ingr() throws warning when inputs are of different length", {
  expect_warning(
    adc_ingr(
      adc_test = c(0.902, 0.902),
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ref = 1,
      dm_ingr = 1,
      incl_ingr = 0.3
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = c(0.923, 0.923),
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ref = 1,
      dm_ingr = 1,
      incl_ingr = 0.3
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = c(0.465, 0.465),
      nut_ingr = 0.945,
      dm_ref = 1,
      dm_ingr = 1,
      incl_ingr = 0.3
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = c(0.945, 0.945),
      dm_ref = 1,
      dm_ingr = 1,
      incl_ingr = 0.3
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ref = c(1,1),
      dm_ingr = 1,
      incl_ingr = 0.3
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ref = 1,
      dm_ingr = c(1,1),
      incl_ingr = 0.3
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ref = 1,
      dm_ingr = 1,
      incl_ingr = c(0.3, 0.3)
    )
  )
})

test_that("adc_ingr() throws warning when input is < 0", {
  expect_warning(
    adc_ingr(
      adc_test = -0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945
    )
  )
  expect_warning(expect_warning( # throws two warnings
    adc_ingr(
      adc_test = 0.902,
      adc_ref = -0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945
    )
  )) 
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = -0.465,
      nut_ingr = 0.945
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = -0.945
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ref = -1
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      dm_ingr = -1
    )
  )
  expect_warning(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945,
      incl_ingr = -0.3
    )
  )
})

test_that("adc_ingr() calculates ADC correctly", {
  expect_equal(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = 0.945
    ),
    0.8778889
  )
})
