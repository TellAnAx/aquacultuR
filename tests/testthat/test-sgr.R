test_that("Specific Growth Rate calculated correctly", {
  expect_equal(sgr(m_start = 1, 
                   m_end = 2, 
                   duration = log(2)),
               100)
})

test_that("Logarithmus naturalis calculated correctly", {
  expect_equal(log(1),
               0)
})
