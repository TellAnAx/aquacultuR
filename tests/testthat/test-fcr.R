test_that("Feed Conversion Ratio calculation works", {
  expect_equal(fcr(m_start = 1,
                   m_end = 2,
                   fi = 2),
               2)
})
