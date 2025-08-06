test_that("gbw() throws an error if inputs are negative",{
  expect_error(gbw(ibw  = -1, fbw = 2))
  expect_error(gbw(ibw = 1, fbw = -2))
})

test_that("gbw() throws an error if inputs are NA", {
  expect_error(gbw(ibw = NA,fbw = 2))
  expect_error(gbw(ibw = 1, fbw = NA))
})

test_that("gbw() throws an error if inputs are non-numeric", {
  expect_error(gbw(ibw =  "test", fbw = 2))
  expect_error(gbw(ibw = 1, fbw = "test"))
})

test_that("gbw() throws an error if inputs are not of the same length", {
  expect_error(gbw(ibw =  c(1,2), fbw = 2))
  expect_error(gbw(ibw = 1, fbw = c(1,2)))
})

test_that("gbw() calculates the Geometric Bodyweight correctly", {
  expect_equal(gbw(ibw = 1, fbw = 4), 2)
})
