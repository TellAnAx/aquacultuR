test_that("mbw() throws error if inputs are NA.", {
  expect_error(mbw(ibw = NA, fbw = 2))
  expect_error(mbw(ibw = 1, fbw = NA))
  expect_error(mbw(ibw = 1, fbw = 2, mb_exp = NA)) 
  })


test_that("mbw() throws error if input is non-numeric.", {
  expect_error(mbw(ibw = "test", fbw = 2))
  expect_error(mbw(ibw = 1, fbw = "test"))
  expect_warning(expect_error(mbw(ibw = 1, fbw = 2, mb_exp = "test")))
})


test_that("mbw() throws error if inputs < 0.", {
  expect_error(mbw(ibw = -1, fbw = 2))
  expect_error(mbw(ibw = 1, fbw = -2))
})


test_that("mbw() throws warning if ibw|fbw == 0.", {
  expect_warning(mbw(ibw = 0, fbw = 2))
  expect_warning(mbw(ibw = 1, fbw = 0))
})


test_that("mbw() throws warning if mb_exp > 1 | mb_exp < 0.", {
  expect_warning(mbw(ibw = 1, fbw = 2, mb_exp = -1))
  expect_warning(mbw(ibw = 1, fbw = 2, mb_exp = 1.1))
})


test_that("mbw() throws message if inputs are of differing length.", {
  expect_message(mbw(ibw = c(1,1), fbw = 2))
  expect_message(mbw(ibw = 1, fbw = c(2,2)))
  expect_message(mbw(ibw = 1, fbw = 2, mb_exp = c(0.8,0.8)))
})


test_that("mbw() calculates Metabolic Bodyweight correctly.", {
  expect_equal(mbw(ibw = 1, fbw = 2), 1.319507911)
  expect_message(expect_equal(mbw(ibw = c(1,1), fbw = 2), c(1.319507911,1.319507911)))
  expect_message(expect_equal(mbw(ibw = 1, fbw = c(2,2)), c(1.319507911,1.319507911)))
})
