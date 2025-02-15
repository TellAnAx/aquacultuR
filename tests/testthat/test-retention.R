test_that("Nutrient retention calculation works", {
  expect_equal(retention(m_start = 1, 
                         nut_start = 0.1, 
                         m_end = 2, 
                         nut_end = 0.2), 
               0.3)
})
