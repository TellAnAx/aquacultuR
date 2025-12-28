test_that("rgr() throws error if input is non-numeric", {
  expect_error(
    rgr(
    ibw = "test",
    fbw = 2,
    duration = 3
    )
  )
  expect_error(
    rgr(
    ibw = 1,
    fbw = "test",
    duration = 3
    )
  )
  expect_error(
    rgr(
    ibw = 1,
    fbw = 2,
    duration = "test"
    )
  )
  expect_error(
    rgr(
    ibw = NA,
    fbw = 2,
    duration = 3
    )
  )
  expect_error(rgr(
    ibw = 1,
    fbw = NA,
    duration = 3
  ))
  expect_error(rgr(
    ibw = 1,
    fbw = 2,
    duration = NA
  ))
})

test_that("rgr() throws error if input == 0", {
  expect_error(rgr(
    ibw = 0,
    fbw = 2,
    duration = 3
  ))
  expect_error(rgr(
    ibw = 1,
    fbw = 2,
    duration = 0
  ))
})


test_that("rgr() throws warning if input < 0", {
  expect_error(
    rgr(
    ibw = -1,
    fbw = 2,
    duration = 3
  )
  )
  expect_error(rgr(
    ibw = 1,
    fbw = -2,
    duration = 3
  ))
})

test_that("rgr() throws message if inputs are of different length", {
  expect_message(rgr(
    ibw = c(1, 2),
    fbw = 2,
    duration = 3
  ))
  expect_message(rgr(
    ibw = 1,
    fbw = c(2, 3),
    duration = 3
  ))
  expect_message(rgr(
    ibw = 1,
    fbw = 2,
    duration = c(3, 4)
  ))
})

test_that("rgr() calculates Relative Growth Rate correctly", {
  expect_equal(
    rgr(
    ibw = 1,
    fbw = 4,
    duration = 1
  ), 1.5)
})
