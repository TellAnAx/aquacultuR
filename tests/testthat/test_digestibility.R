# Testing the Apparent Digestibility Coefficient of 
# the dry matter fraction of a compound diet (ADC DM)
test_that("adc_dm() throws error when input is not numeric", {
  expect_error(adc_dm(
    dm_diet = "a",
    std_diet = 0.01,
    std_feces = 0.05
  ))
  expect_error(adc_dm(
    dm_diet = 1,
    std_diet = NULL,
    std_feces = 0.05
  ))
  expect_error(adc_dm(
    dm_diet = 1,
    std_diet = 0.01,
    std_feces = TRUE
  ))
})

test_that("adc_dm() works with vectors", {
  result <- adc_dm(
    std_diet = c(10, 20, 30),
    dm_diet = c(1, 1, 1),
    std_feces = c(5, 10, 15)
  )
  expect_length(result, 3)
  expect_equal(result, c(-1, -1, -1))
})

test_that("adc_dm() throws error when inputs have different lengths", {
  expect_error(adc_dm(
    dm_diet = c(1, 1),
    std_diet = 0.01,
    std_feces = 0.05
  ))
  expect_error(adc_dm(
    dm_diet = 1,
    std_diet = c(0.01, 0.01),
    std_feces = 0.05
  ))
  expect_error(adc_dm(
    dm_diet = 1,
    std_diet = 0.01,
    std_feces = c(0.05, 0.05)
  ))
})

test_that("adc_dm() throws warning when input is < 0", {
  expect_warning(expect_warning(adc_dm(
    dm_diet = -1,
    std_diet = 0.01,
    std_feces = 0.05
  )))
  expect_warning(expect_warning(adc_dm(
    dm_diet = 1,
    std_diet = -0.01,
    std_feces = 0.05
  )))
  expect_warning(expect_warning(adc_dm(
    dm_diet = 1,
    std_diet = 0.01,
    std_feces = -0.05
  )))
})

test_that("adc_dm() calculates ADC correctly", {
  expect_equal(adc_dm(
    dm_diet = 1,
    std_diet = 0.01,
    std_feces = 0.05
  ), 0.8)
})

test_that("adc_dm warns when ADC < 0", {
  expect_warning(adc_dm(
    std_diet = 10,
    dm_diet = 1,
    std_feces = 5),
    "ADC < 0"
  )
})

#This requires negative inputs that already give errors
#test_that("adc_dm warns when ADC > 1", {
#  expect_warning(
#    adc_dm(std_diet = 5, dm_diet = 1, std_feces = 10),
#    "ADC > 1"
#  )
#})

# Testing the Apparent Digestibility Coefficient of a nutrient 
# in the dry matter fraction of a compound diet (ADCnut)

test_that("adc_nut() throws error when input is not numeric", {
  expect_error(adc_nut(
    std_diet = "a",
    std_feces = 0.05,
    nut_diet = 0.8,
    nut_feces = 0.1
  ))
  expect_error(adc_nut(
    std_diet = 0.01,
    std_feces = NULL,
    nut_diet = 0.8,
    nut_feces = 0.1
  ))
  expect_error(adc_nut(
    std_diet = 0.01,
    std_feces = 0.05,
    nut_diet = TRUE,
    nut_feces = 0.1
  ))
  expect_error(adc_nut(
    std_diet = 0.01,
    std_feces = 0.05,
    nut_diet = 0.8,
    nut_feces = FALSE
  ))
})

test_that("adc_nut() works with vectors", {
  result <- adc_nut(
    std_diet = c(10, 20, 30),
    std_feces = c(1, 1, 1),
    nut_diet = c(5, 10, 15),
    nut_feces = c(1,2,3)
  )
  expect_length(result, 3)
  expect_equal(result, c(-1, -3, -5))
})

test_that("adc_nut() throws error when inputs are of different length", {
  expect_error(adc_nut(
    std_diet = c(0.01, 0.01),
    std_feces = 0.05,
    nut_diet = 0.8,
    nut_feces = 0.1
  ))
  expect_error(adc_nut(
    std_diet = 0.01,
    std_feces = c(0.05, 0.05),
    nut_diet = 0.8,
    nut_feces = 0.1
  ))
  expect_error(adc_nut(
    std_diet = 0.01,
    std_feces = 0.05,
    nut_diet = c(0.8, 0.8),
    nut_feces = 0.1
  ))
  expect_error(adc_nut(
    std_diet = 0.01,
    std_feces = 0.05,
    nut_diet = 0.8,
    nut_feces = c(0.1, 0.1)
  ))
})

test_that("adc_nut() throws warning when input is < 0", {
  expect_warning(expect_warning(
    adc_nut(
      std_diet = -0.01,
      std_feces = 0.05,
      nut_diet = 0.8,
      nut_feces = 0.1
    )
  ))
  expect_warning(expect_warning(
    adc_nut(
      std_diet = 0.01,
      std_feces = -0.05,
      nut_diet = 0.8,
      nut_feces = 0.1
    )
  ))
  expect_warning(expect_warning(
    adc_nut(
      std_diet = 0.01,
      std_feces = 0.05,
      nut_diet = -0.8,
      nut_feces = 0.1
    )
  ))
  expect_warning(expect_warning(
    adc_nut(
      std_diet = 0.01,
      std_feces = 0.05,
      nut_diet = 0.8,
      nut_feces = -0.1
    )
  ))
})

test_that("adc_nut() calculates ADC correctly", {
  expect_equal(adc_nut(
    std_diet = 0.01,
    std_feces = 0.05,
    nut_diet = 0.8,
    nut_feces = 0.1
  ),
  0.975)
})

test_that("adc_nut warns when ADC < 0", {
  expect_warning(adc_nut(
    std_diet = 10,
    std_feces = 5,
    nut_diet = 5,
    nut_feces = 10),
    "ADC < 0"
  )
})

#This requires negative inputs that already give errors
#test_that("adc_dm warns when ADC > 1", {
#  expect_warning(
#    adc_dm(std_diet = 5, dm_diet = 1, std_feces = 10),
#    "ADC > 1"
#  )
#})


# Testing the Apparent Digestibility Coefficient of a nutrient
# contained in a feed ingredient of a compound diet (ADCingr)

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
      adc_ref = NULL,
      nut_ref = 0.465,
      nut_ingr = 0.945
    )
  )
  expect_error(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = TRUE,
      nut_ingr = 0.945
    )
  )
  expect_error(
    adc_ingr(
      adc_test = 0.902,
      adc_ref = 0.923,
      nut_ref = 0.465,
      nut_ingr = FALSE
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

test_that("adc_ingr() works with vectors", {
  result <- adc_ingr(
    adc_test = c(1, 1, 1),
    adc_ref = c(1, 1, 1),
    nut_ref = c(0.5, 0.1, 0.01),
    nut_ingr = c(1,1,1),
    dm_ref = c(1,1,1),
    dm_ingr = c(1,1,1),
    incl_ingr = c(1,1,1)
  )
  expect_length(result, 3)
  expect_equal(result, c(1, 1, 1))
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
  expect_warning(expect_warning( # also throws ADC > 1 warning
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

#This requires negative inputs that already give errors
#test_that("adc_ingr warns when ADC < 0", {
#  expect_warning(
#    adc_ingr(adc_test = 1, adc_ref = 0.1, nut_ref = 1, dm_ref = 1, dm_ingr = 0.1, incl_ingr = 0.1, nut_ingr = 0.1),
#    "ADC < 0"
#  )
#})


test_that("adc_ingr warns when ADC > 1", {
  expect_warning(adc_ingr(
    adc_test = 1,
    adc_ref = 0.1,
    nut_ref = 1,
    dm_ref = 1,
    dm_ingr = 0.1,
    incl_ingr = 0.1,
    nut_ingr = 0.1),
    "ADC > 1"
  )
})
