# Testing the Feed Conversion Ratio (FCR)

test_that("fcr() throws error when input is not numeric", {
  expect_error(fcr(
    ibw = "test",
    fbw = 3,
    feed = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = NULL,
    feed = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    feed = TRUE,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    feed = 4,
    dm = FALSE
  ))
})

test_that("fcr() works with vectors", {
  result <- fcr(
    ibw = c(1, 1, 1),
    fbw = c(5, 5, 5),
    feed = c(1, 10, 100),
    dm = c(1, 1, 1)
  )
  expect_length(result, 3)
  expect_equal(result, c(0.25, 2.5, 25))
})

test_that("fcr() throws error if inputs are of diferent length", {
  expect_error(fcr(
    ibw = c(1, 1),
    fbw = 3,
    feed = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = c(3, 3),
    feed = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    feed = c(4, 4),
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    feed = 4,
    dm = c(0.5, 0.5)
  ))
})

test_that("fcr() throws warning if input values are <= 0", {
  expect_warning(fcr(
    ibw = 0,
    fbw = 3,
    feed = 4,
    dm = 0.5
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = -1,
    feed = 4,
    dm = 0.5
  ))
  expect_error(fcr(
    ibw = 1,
    fbw = 3,
    feed = 0,
    dm = 0.5
  ))
  expect_warning(fcr(
    ibw = -0.5,
    fbw = 3,
    feed = 4,
    dm = 0.5
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = -0.5,
    feed = 4,
    dm = 0.5
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = 3,
    feed = -0.5,
    dm = 0.5
  ))
})

test_that("fcr() calculates correctly", {
  expect_equal(fcr(
    ibw = 1,
    fbw = 5,
    feed = 3
  ), 0.75)
})

test_that("fcr() throws warning if DM is outside of ]0, 1]", {
  expect_warning(fcr(
    ibw = 1,
    fbw = 3,
    feed = 4,
    dm = -0.5
  ))
  expect_warning(fcr(
    ibw = 1,
    fbw = 3,
    feed = 4,
    dm = 1.5
  ))
})

test_that("fcr() warns when FCR < 0", {
  expect_warning(expect_warning(
    fcr(ibw = 10, fbw = 5, feed = 5, dm = 1),
    "FCR is negative. The result may not be
            meaningful."
  ))
})


# Testing the Feed Conversion Efficiency (FCE)

test_that("fce() throws error if input is non-numeric.", {
  expect_error(fce(
    ibw = "test",
    fbw = 2,
    feed = 0.5,
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = NULL,
    feed = 0.5,
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 2,
    feed = NULL,
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 2,
    feed = 0.5,
    dm = "a"
  ))
})

test_that("fce() works with vectors", {
  result <- fce(
    ibw = c(1, 1, 1),
    fbw = c(5, 5, 5),
    feed = c(1, 10, 100),
    dm = c(1, 1, 1)
  )
  expect_length(result, 3)
  expect_equal(result, c(4, 0.4, 0.04))
})

test_that("fce() throws error if inputs are of diferent length", {
  expect_error(fce(
    ibw = c(1, 1),
    fbw = 3,
    feed = 4,
    dm = 0.5
  ))
  expect_error(fce(
    ibw = 1,
    fbw = c(3, 3),
    feed = 4,
    dm = 0.5
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 3,
    feed = c(4, 4),
    dm = 0.5
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 3,
    feed = 4,
    dm = c(0.5, 0.5)
  ))
})

test_that("fce() throws warning if input values are <= 0", {
  expect_warning(fce(
    ibw = 0,
    fbw = 3,
    feed = 4,
    dm = 0.5
  ))
  expect_warning(fce(
    ibw = 1,
    fbw = -1,
    feed = 4,
    dm = 0.5
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 3,
    feed = 0,
    dm = 0.5
  ))
  expect_warning(fce(
    ibw = -0.5,
    fbw = 3,
    feed = 4,
    dm = 0.5
  ))
  expect_warning(fce(
    ibw = 1,
    fbw = -0.5,
    feed = 4,
    dm = 0.5
  ))
  expect_warning(fce(
    ibw = 1,
    fbw = 3,
    feed = -0.5,
    dm = 0.5
  ))
})

test_that("fce() throws error if dm or feed are zero.", {
  expect_error(fce(
    ibw = 1,
    fbw = 2,
    feed = 0,
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 2,
    feed = 0.5,
    dm = 0
  ))
})

test_that("fce() throws warning if dm is outside ]0,1].", {
  expect_warning(fce(
    ibw = 1,
    fbw = 2,
    feed = 0.5,
    dm = -0.1
  ))
  expect_warning(fce(
    ibw = 1,
    fbw = 2,
    feed = 0.5,
    dm = 1.1
  ))
})

test_that("ibw is lower than fbw", {
  expect_warning(expect_warning(fce(
    ibw = 1,
    fbw = 0.01,
    feed = 10,
    dm = 0.9
  )))
})

test_that("fce() calculates correctly", {
  expect_equal(fce(
    ibw = 1,
    fbw = 3,
    feed = 2
  ), 1)
})
