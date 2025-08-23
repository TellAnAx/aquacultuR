test_that("nr() throws error when input is NA.", {
  expect_error(nr(
    ibw = NA,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = NA,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = NA,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = NA,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = NA,
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = NA
  ))
})


test_that("nr() throws an error when input is non-numeric.", {
  expect_error(nr(
    ibw = "test",
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = "test",
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = "test",
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = "test",
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = "test",
    nut_diet = 0.1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = "test"
  ))
})


test_that("nr() throws error if fi or nut_diet are == 0.", {
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0,
    nut_diet = 0.1
  ))
})


test_that("nr() throws warning when inputs are out of range.", {
  expect_warning(nr(
    ibw = 0,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 2,
    ibn = -0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 1.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = -0.5,
    nut_diet = 0.1
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 1.1
  ))
})


test_that("nr() throws message when inputs differ in length.", {
  expect_message(nr(
    ibw = c(1, 1),
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_message(nr(
    ibw = 1,
    fbw = c(2, 2),
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 2,
    ibn = c(0.1, 0.1),
    fbn = 0.2,
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = c(0.2, 0.2),
    fi = 0.5,
    nut_diet = 0.1
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = c(0.5, 0.5),
    nut_diet = 0.1
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_diet = c(0.1, 0.1)
  ))
})


test_that("nr() calculates result correctly.", {
  expect_equal(nr(
    ibw = 1,
    fbw = 3,
    ibn = 0.1,
    fbn = 0.4,
    fi = 100,
    nut_diet = 0.02
  ),
  0.55)
  expect_message(expect_equal(
    nr(
      ibw = 1,
      fbw = c(3, 5),
      ibn = 0.1,
      fbn = c(0.3, 0.4),
      fi = 100,
      nut_diet = 0.02
    ),
    c(0.4, 0.95)
  ))
})