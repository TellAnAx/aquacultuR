test_that("multiplication works", {
  expect_equal(adc_ingr(adc_test = 0.902,
                        adc_ref = 0.923,
                        nut_ref = 0.465,
                        nut_ingr = 0.945,
                        incl_ingr = 0.3), 
               0.8778889) # From Bureau and Hua, 2001
})
