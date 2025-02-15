test_that("Feed Conversion Efficiency calculation works", {
  expect_equal(1/fcr(m_start = 1,
                     m_end = 2,
                     fi = 2),
               0.5)
})