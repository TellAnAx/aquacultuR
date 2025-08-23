test_that("fcr() throws error when input is not numeric", {
  expect_error(fcr(
    ibw = "test",
    fbw = 3,
    ff = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = "test",
    ff = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    ff = "test",
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    ff = 4,
    dm = "test"
  ))
})

test_that("fcr() throws error when input is NA", {
  expect_error(fcr(
    ibw = NA,
    fbw = 3,
    ff = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = NA,
    ff = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    ff = NA,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    ff = 4,
    dm = NA
  ))
})

test_that("fcr() throws error if inputs are of different length", {
  expect_error(fcr(
    ibw = c(1, 1),
    fbw = 3,
    ff = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = c(3, 3),
    ff = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    ff = c(4, 4),
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    ff = 4,
    dm = c(0.5, 0.5)
  ))
})

test_that("fcr() throws warning if input values are <= 0", {
  expect_warning(fcr(
    ibw = 0,
    fbw = 3,
    ff = 4,
    dm = 0.5
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = 0,
    ff = 4,
    dm = 0.5
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = 3,
    ff = 0,
    dm = 0.5
  ))
  expect_warning(fcr(
    ibw = -0.5,
    fbw = 3,
    ff = 4,
    dm = 0.5
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = -0.5,
    ff = 4,
    dm = 0.5
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = 3,
    ff = -0.5,
    dm = 0.5
  ))
})

test_that("fcr() throws warning if DM is outside of ]0, 1]", {
  expect_warning(fcr(
    ibw = 1,
    fbw = 3,
    ff = 4,
    dm = -0.5
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = 3,
    ff = 4,
    dm = 0
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = 3,
    ff = 4,
    dm = 1.5
  ))
})

test_that("fcr() calculates FCR correctly", {
  expect_equal(fcr(
    ibw = 1,
    fbw = 3,
    ff = 4,
    dm = 0.5
  ), 1)
})
