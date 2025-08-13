test_that("fce() throws error if input is NA.", {
  expect_error(fce(ibw = NA, fbw = 2, fi = 0.5, dm = 1))
  expect_error(fce(ibw = 1, fbw = NA, fi = 0.5, dm = 1))
  expect_error(fce(ibw = 1, fbw = 2, fi = NA, dm = 1))
  expect_error(fce(ibw = 1, fbw = 2, fi = 0.5, dm = NA))
  })


test_that("fce() throws error if input is non-numeric.", {
  expect_error(fce(ibw = "test", fbw = 2, fi = 0.5, dm = 1))
  expect_error(fce(ibw = 1, fbw = "test", fi = 0.5, dm = 1))
  expect_error(fce(ibw = 1, fbw = 2, fi = "test", dm = 1))
  expect_error(fce(ibw = 1, fbw = 2, fi = 0.5, dm = "test"))
  }) 


test_that("fce() throws error if dm or fi are zero.", {
  expect_error(fce(ibw = 1, fbw = 2, fi = 0, dm = 1))
  expect_error(fce(ibw = 1, fbw = 2, fi = 0.5, dm = 0))
  })


test_that("fce() throws warning if ibw or fbw are <= 0 and fi < 0.", {
  expect_warning(fce(ibw = -1, fbw = 2, fi = 0.5, dm = 1))
  expect_warning(fce(ibw = 1, fbw = -2, fi = 0.5, dm = 1))
  expect_warning(fce(ibw = 1, fbw = 2, fi = -0.5, dm = 1))
  })


test_that("fce() throws warning if dm is outside ]0,1].", {
  expect_warning(fce(ibw = 1, fbw = 2, fi = 0.5, dm = -0.1))
  expect_warning(fce(ibw = 1, fbw = 2, fi = 0.5, dm = 1.1))
  })


test_that("fce() throws message if inputs are not of same length.", {
  expect_message(fce(ibw = c(1,1), fbw = 2, fi = 0.5, dm = 1))
  expect_message(fce(ibw = 1, fbw = c(2,2), fi = 0.5, dm = 1))
  expect_message(fce(ibw = 1, fbw = 2, fi = c(0.5,0.5), dm = 1))
  expect_message(fce(ibw = 1, fbw = 2, fi = 0.5, dm = c(1,1)))
  })


test_that("fce() calculates Feed Conversion Efficiency correctly.", {
  expect_equal(fce(ibw = 1, fbw = 2, fi = 0.5, dm = 1), 2)
  expect_equal(fce(ibw = 1, fbw = 2, fi = 0.5), 2)
  expect_message(expect_equal(fce(ibw = c(1,1), fbw = 2, fi = 0.5, dm = 1), c(2, 2)))
  expect_message(expect_equal(fce(ibw = 1, fbw = c(2,2), fi = 0.5, dm = 1), c(2,2)))
  expect_message(expect_equal(fce(ibw = 1, fbw = 2, fi = c(0.5,0.5), dm = 1), c(2,2)))
  expect_message(expect_equal(fce(ibw = 1, fbw = 2, fi = 0.5, dm = c(1,1)), c(2,2)))
  })