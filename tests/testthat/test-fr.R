test_that("Feeding Rate error works", {
  expect_error(fr())
})

test_that("Feeding Rate calculation works", {
  expect_equal(fr(100, 10),
               10)
})
