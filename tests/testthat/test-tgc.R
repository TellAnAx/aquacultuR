test_that("Thermal Growth Coefficient calculation works", {
  expect_equal(tgc(m_start = 27,
                   m_end = 19683,
                   duration = 6,
                   temp = 1), 
               4000)
})
