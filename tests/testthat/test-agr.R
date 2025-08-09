test_that("agr() throws warning when 0 is provided", {
  expect_warning(agr(ibw = 0, fbw = 2, duration = 3))
  expect_warning(agr(ibw = 1, fbw = 0, duration = 3))
  expect_warning(agr(ibw = 1, fbw = 2, duration = 0))
})

test_that("agr() throws error when negative value is provided",{
  expect_error(agr(ibw = -1,fbw = 2,duration = 3))
  expect_error(agr(ibw = 1,fbw = -2,duration = 3))
  expect_error(agr(ibw = 1,fbw = 2,duration = -3))
})

test_that("agr() throws error when character is provided", {
  expect_error(agr(ibw =  "test", fbw = 2, duration = 3))
  expect_error(agr(ibw = 1, fbw =  "test" , duration = 3))
  expect_error(agr(ibw = 1, fbw = 2, duration =  "test"))
})

test_that("agr() throws error when NA is provided", {
  expect_error(agr(ibw = NA, fbw = 2, duration = 3))
  expect_error(agr(ibw = 1, fbw = NA, duration = 3))
  expect_error(agr(ibw = 1, fbw = 2, duration = NA))
})

test_that("agr() calculates absolute growth correctly", {
  expect_equal(agr(ibw = 1, fbw = 2, duration = 10), 1/10)
})

