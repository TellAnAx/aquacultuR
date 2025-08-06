test_that("metabolic body weight", {
  
  # Expect errors for questionable but not fatal inputs
  expect_error(mbw(ibw = 1, fbw = 0))   # final weight zero
  expect_error(mbw(ibw = -1, fbw = 2))  # negative initial weight
  expect_error(mbw(ibw = 1, fbw = -2))  # negative final weight
  expect_error(mbw(gbw = -1))                 # negative gain body weight
  
  # Expect errors for invalid inputs
  expect_error(mbw(ibw = NA, fbw = 2))    # NA initial weight
  expect_error(mbw(ibw = 1, fbw = NA))    # NA final weight
  expect_error(mbw(gbw = NA))                   # NA gain body weight
  expect_error(mbw(ibw = "test", fbw = 2)) # non-numeric initial weight
  expect_error(mbw(ibw = 1, fbw = "test")) # non-numeric final weight
  expect_error(mbw(gbw = "test"))                # non-numeric gain body weight
  expect_error(mbw(ibw = 0, fbw = 2))      # zero initial weight
  expect_error(mbw(ibw = 5, fbw = 2))      # start > end
  
})
