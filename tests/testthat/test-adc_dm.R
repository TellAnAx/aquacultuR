test_that("Apparent Digestibility calculation of Dry Matter works", {
  expect_equal(adc_dm(es_diet = 0.01,
                      es_feces = 0.05), 
               0.8)
})
