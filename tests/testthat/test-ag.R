test_that("ag() throws error if inputs are NA.", {
  expect_error(ag(ibw = NA, fbw = 2))
  expect_error(ag(ibw = 1, fb = NA))
})

test_that("ag() throws error if inputs are non-numeric.", {
  expect_error(ag(ibw = "test", fbw = 2))
  expect_error(ag(ibw = 1, fbw = "test"))
})

test_that("ag() throws warning if inputs are <= 0.", {
  expect_warning(ag(ibw = -1, fbw = 2))
  expect_warning(ag(ibw = 1, fbw = -2))
})

test_that("ag() throws message if inputs differ in length.", {
  expect_message(ag(ibw = c(1,1), fbw = 2))
  expect_message(ag(ibw = 1, fbw = c(2,2)))
})

test_that("ag() corrects result correctly.", {
  expect_equal(ag(ibw = 1, fbw = 2), 1)
  expect_message(expect_equal(ag(ibw = 1, fbw = c(2,2)), c(1,1)))
})