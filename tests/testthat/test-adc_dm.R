test_that("Apparent Digestibility calculation of Dry Matter works", {
  expect_equal(adc_dm(dm_diet = 1,
                      std_diet = 0.01,
                      std_feces = 0.05), 
               0.8)
})
