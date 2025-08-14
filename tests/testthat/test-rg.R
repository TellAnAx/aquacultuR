test_that("rg() throws error if inputs are non-numeric", {
  expect_error(rg(ibw = "test", fbw = 2))
  expect_error(rg(ibw = 1, fbw = "test"))
  expect_error(rg(ibw = NA, fbw = 2))
  expect_error(rg(ibw = 1, fbw = NA))
  expect_error(rg(ibw = TRUE, fbw = 2))
  expect_error(rg(ibw = 1, fbw = FALSE))
  })


test_that("rg() throws error if ibw == 0", {
  expect_error(rg(ibw = 0, fbw = 1))
  })


test_that("rg() throws warning if inputs are < 0", {
  expect_warning(rg(ibw = -1, fbw = 2))
  expect_warning(rg(ibw = 1, fbw = -2))
  })


test_that("rg() throws message if inputs have different lengths", {
  expect_message(rg(ibw = c(1, 2), fbw = 3))
  expect_message(rg(ibw = 1, fbw = c(2, 3)))
  })


test_that("rg() calculates Relative growth correctly", {
  expect_equal(rg(ibw = 1, fbw = 2), 1)
  expect_equal(rg(ibw = c(1, 2), fbw = 3), c(2, 0.5))
  expect_equal(rg(ibw = 1, fbw = c(2, 3)), c(1, 2))
  })
