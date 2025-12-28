test_that("ner() throws error when the input is NA.", {
  expect_error(ner(
    ibw = NA,
    fbw = 2,
    fi = 4,
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = NA,
    fi = 4,
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = NA,
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 4,
    dm = NA,
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 4,
    nut_f = NA
  ))
})


test_that("ner() throws error if the values are non numerical.", {
  expect_error(ner(
    ibw = "test",
    fbw = 2,
    fi = 4,
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = "test",
    fi = 4,
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = "test",
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 4,
    dm = "test",
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 4,
    nut_f = "test"
  ))
})


test_that("ner() throws error if dm , fi, nut_f are zero.", {
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 0,
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 5,
    dm = 0,
    nut_f = 0.5
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 5,
    nut_f = 0
  ))
})


test_that("ner() throws warning if values are negative.", {
  expect_warning(ner(
    ibw = -1,
    fbw = 2,
    fi = 5,
    nut_f = 0.5
  ))
  expect_warning(ner(
    ibw = 1,
    fbw = 2,
    fi = -5,
    nut_f = 0.5
  ))
  expect_warning(ner(
    ibw = 1,
    fbw = 2,
    fi = 5,
    nut_f = 0.5,
    dm = -1
  ))
  expect_warning(ner(
    ibw = 1,
    fbw = 2,
    fi = 5,
    nut_f = -0.5
  ))
  expect_warning(expect_warning(ner(
    ibw = 1,
    fbw = -2,
    fi = 5,
    nut_f = 0.5
  )))
})


test_that("ner() throws warning if dm | nut_f > 1.", {
  expect_warning(ner(
    ibw = 1,
    fbw = 2,
    fi = 5,
    dm = 1.1,
    nut_f = 0.1
  ))
  expect_warning(ner(
    ibw = 1,
    fbw = 2,
    fi = 5,
    nut_f = 1.1
  ))
})


test_that("ner() throws warning if fbw < ibw.", {
  expect_warning(ner(
    ibw = 3,
    fbw = 2,
    fi = 5,
    nut_f = 0.5
  ))
})


test_that("ner() throws message if inputs differ in length.", {
  expect_message(ner(
    ibw = c(1, 1),
    fbw = 2,
    fi = 5,
    nut_f = 0.5
  ))
  expect_message(ner(
    ibw = 1,
    fbw = c(2, 2),
    fi = 5,
    nut_f = 0.5
  ))
  expect_message(ner(
    ibw = 1,
    fbw = 2,
    fi = c(5, 5),
    nut_f = 0.5
  ))
  expect_message(ner(
    ibw = 1,
    fbw = 2,
    fi = 5,
    nut_f = c(0.5, 0.5)
  ))
})


test_that("ner() calculates Nutrient Efficiency Ratio correctly.", {
  expect_equal(ner(
    ibw = 1,
    fbw = 2,
    fi = 10,
    nut_f = 0.1
  ), 1)
  expect_equal(ner(
    ibw = 1,
    fbw = c(2, 3, 4),
    fi = 10,
    nut_f = 0.1
  ), c(1, 2, 3))
  expect_equal(ner(
    ibw = 1,
    fbw = c(2, 3, 4),
    fi = c(10, 20, 30),
    nut_f = 0.1
  ), c(1, 1, 1))
  expect_equal(ner(
    ibw = 1,
    dm = 0.5,
    fbw = 2,
    fi = 10,
    nut_f = 0.1
  ), 2)
})