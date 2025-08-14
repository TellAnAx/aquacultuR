test_that("tgc() throws error if input is NA.", {
  expect_error(tgc(ibw = NA, fbw = 2, duration = 3, temp = 4))
  expect_error(tgc(ibw = 1, fbw = NA, duration = 3, temp = 4))
  expect_error(tgc(ibw = 1, fbw = 2, duration = NA, temp = 4))
  expect_error(tgc(ibw = 1, fbw = 2, duration = 3, temp = NA))
})


test_that("tgc() throws error if input is non-numeric.", {
  expect_error(tgc(ibw = 'test', fbw = 2, duration = 3, temp = 4))
  expect_error(tgc(ibw = 1, fbw = 'test', duration = 3, temp = 4))
  expect_error(tgc(ibw = 1, fbw = 2, duration = 'test', temp = 4))
  expect_error(tgc(ibw = 1, fbw = 2, duration = 3, temp = 'test'))
})
  

test_that("tgc() throws error if duration or temp == 0.", {
  expect_error(tgc(ibw = 1, fbw = 2, duration = 0, temp = 4))
  expect_error(tgc(ibw = 1, fbw = 2, duration = 3, temp = 0))
})


test_that("tgc() throws warning if inputs are < 0.", {
  expect_warning(tgc(ibw = -1, fbw = 2, duration = 3, temp = 4))
  expect_warning(tgc(ibw = 1, fbw = -2, duration = 3, temp = 4))
  expect_warning(tgc(ibw = 1, fbw = 2, duration = -3, temp = 4))
  expect_warning(tgc(ibw = 1, fbw = 2, duration = 3, temp = -4))
})


test_that("tgc() throws message if inputs are not of same length.", {
  expect_message(tgc(ibw = c(1,1), fbw = 2, duration = 3, temp = 4))
  expect_message(tgc(ibw = 1, fbw = c(2,2), duration = 3, temp = 4))
  expect_message(tgc(ibw = 1, fbw = 2, duration = c(3,3), temp = 4))
  expect_message(tgc(ibw = 1, fbw = 2, duration = 3, temp = c(4,4)))
})


test_that("tgc() calculates result correctly.", {
  expect_equal(tgc(1,2,3,4), 21.6600875)
  expect_message(expect_equal(tgc(1,c(2,3),3,4), c(21.6600875, 36.85413)))
})

