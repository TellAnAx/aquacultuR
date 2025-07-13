test_that("Specific Growth Rate calculated correctly", {
  expect_equal(sgr(ibw = 1, fbw = 2, duration = log(2)), 100)
})

test_that("Logarithmus naturalis calculated correctly", {
  expect_equal(log(1), 0)
})
