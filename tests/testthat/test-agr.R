test_that("agr() throws error when input is NA.", {
  expect_error(agr(
    ibw = NA,
    fbw = 2,
    duration = 3
  ))
  expect_error(agr(
    ibw = 1,
    fbw = NA,
    duration = 3
  ))
  expect_error(agr(
    ibw = 1,
    fbw = 2,
    duration = NA
  ))
})


test_that("agr() throws error when input is non-numeric.", {
  expect_error(agr(
    ibw =  "test",
    fbw = 2,
    duration = 3
  ))
  expect_error(agr(
    ibw = 1,
    fbw =  "test" ,
    duration = 3
  ))
  expect_error(agr(
    ibw = 1,
    fbw = 2,
    duration =  "test"
  ))
})


test_that("agr() throws error when duration == 0.", {
  expect_error(agr(
    ibw = 1,
    fbw = 2,
    duration = 0
  ))
})


test_that("agr() throws warning if input is negative.", {
  expect_warning(agr(
    ibw = -1,
    fbw = 2,
    duration = 3
  ))
  expect_warning(agr(
    ibw = 1,
    fbw = -2,
    duration = 3
  ))
  expect_warning(agr(
    ibw = 1,
    fbw = 2,
    duration = -3
  ))
})


test_that("agr() calculates result correctly.", {
  expect_equal(agr(
    ibw = 1,
    fbw = 2,
    duration = 10
  ), 1 / 10)
})
