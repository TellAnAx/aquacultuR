test_that("fce() throws error if input is NA.", {
  expect_error(fce(
    ibw = NA,
    fbw = 2,
    feed = 0.5,
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = NA,
    feed = 0.5,
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 2,
    feed = NA,
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 2,
    feed = 0.5,
    dm = NA
  ))
})


test_that("fce() throws error if input is non-numeric.", {
  expect_error(fce(
    ibw = "test",
    fbw = 2,
    feed = 0.5,
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = "test",
    feed = 0.5,
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 2,
    feed = "test",
    dm = 1
  ))
  expect_error(fce(
    ibw = 1,
    fbw = 2,
    feed = 0.5,
    dm = "test"
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


test_that("fce() throws warning if ibw or fbw are <= 0 and feed < 0.", {
  expect_warning(fce(
    ibw = -1,
    fbw = 2,
    feed = 0.5,
    dm = 1
  ))
  expect_warning(fce(
    ibw = 1,
    fbw = -2,
    feed = 0.5,
    dm = 1
  ))
  expect_warning(fce(
    ibw = 1,
    fbw = 2,
    feed = -0.5,
    dm = 1
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


test_that("fce() throws message if inputs are not of same length.", {
  expect_message(fce(
    ibw = c(1, 1),
    fbw = 2,
    feed = 0.5,
    dm = 1
  ))
  expect_message(fce(
    ibw = 1,
    fbw = c(2, 2),
    feed = 0.5,
    dm = 1
  ))
  expect_message(fce(
    ibw = 1,
    fbw = 2,
    feed = c(0.5, 0.5),
    dm = 1
  ))
  expect_message(fce(
    ibw = 1,
    fbw = 2,
    feed = 0.5,
    dm = c(1, 1)
  ))
})


test_that("fce() calculates Feed Conversion Effeedciency correctly.", {
  expect_equal(fce(
    ibw = 1,
    fbw = 2,
    feed = 0.5,
    dm = 1
  ), 2)
  expect_equal(fce(ibw = 1, fbw = 2, feed = 0.5), 2)
  expect_message(expect_equal(fce(
    ibw = c(1, 1),
    fbw = 2,
    feed = 0.5,
    dm = 1
  ), c(2, 2)))
  expect_message(expect_equal(fce(
    ibw = 1,
    fbw = c(2, 2),
    feed = 0.5,
    dm = 1
  ), c(2, 2)))
  expect_message(expect_equal(fce(
    ibw = 1,
    fbw = 2,
    feed = c(0.5, 0.5),
    dm = 1
  ), c(2, 2)))
  expect_message(expect_equal(fce(
    ibw = 1,
    fbw = 2,
    feed = 0.5,
    dm = c(1, 1)
  ), c(2, 2)))
})