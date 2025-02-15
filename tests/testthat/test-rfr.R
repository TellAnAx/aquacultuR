test_that("Relative Feeding Rate error works", {
  expect_error(rfr())
})

test_that("Relative Feeding Rate calculation works", {
  expect_equal(rfr(200, 500, 20),
               0.02)
})
