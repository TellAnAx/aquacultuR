test_that("Nutrient Efficiency Ratio calculation using initial and final weight 
          works", {
  expect_equal(ner(m_start = 1, 
                   m_end = 2, 
                   fi = 1,
                   dm = 1,
                   nut_f = 0.5), 
               2)
})

test_that("Nutrient Efficiency Ratio calculation using absolute growth works", {
            expect_equal(ner(ag = 1, 
                             fi = 1,
                             dm = 1,
                             nut_f = 0.5), 
                         2)
          })
