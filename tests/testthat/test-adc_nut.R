test_that("Apparent Digestibility Coefficient calculation for a nutrient works", {
  expect_equal(adc_nut(es_diet = 0.01, 
                       es_feces = 0.05, 
                       nut_diet = 0.8, 
                       nut_feces = 0.1), 
               0.975)
})
