test_that("sgr() throws error if input value is NA", {
  expect_error(sgr(
    ibw = NA,
    fbw = 2,
    duration = 3
  ))
  expect_error(sgr(
    ibw = 1,
    fbw = NA,
    duration = 3
  ))
  expect_error(sgr(
    ibw = 1,
    fbw = 2,
    duration = NA
  ))
})


test_that("sgr() throws error if input value is non-numeric", {
  expect_error(sgr(
    ibw =  "test",
    fbw = 2,
    duration = 3
  ))
  expect_error(sgr(
    ibw = 1,
    fbw =  "test",
    duration = 3
  ))
  expect_error(sgr(
    ibw = 1,
    fbw = 2,
    duration =  "test"
  ))
})


test_that("sgr() throws error if input value is = 0", {
  expect_error(sgr(
    ibw = 1,
    fbw = 2,
    duration = 0
  ))
  expect_error(sgr(
    ibw = 0,
    fbw = 2,
    duration = 10
  ))
})


test_that("sgr() throws error if input value is < 0", {
  expect_error(sgr(
    ibw = -1,
    fbw = 2,
    duration = 3
  ))
  expect_error(sgr(
    ibw = 1,
    fbw = -2,
    duration = 3
  ))
})


test_that("sgr() throws warning if input value is < 0", {
  expect_warning(sgr(
    ibw = 1,
    fbw = 2,
    duration = -3
  ))
})


test_that("sgr() calculates result correctly", {
  expect_equal(sgr(
    ibw = 1,
    fbw = 1,
    duration = 10
  ), 0)
  expect_message(expect_equal(sgr(
    ibw = 1,
    fbw = c(2, 2),
    duration = 100
  ), c(0.6955550, 0.6955550)))
})
