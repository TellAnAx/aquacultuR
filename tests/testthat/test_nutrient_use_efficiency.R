# Testing the Nutrient retention (NR)
test_that("nr() throws error when input is not numeric", {
  expect_error(nr(
    ibw = "test",
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = NULL,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = TRUE,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = FALSE,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = "a",
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = "b",
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = "c",
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = "d",
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = "e"
  ))
  expect_error(nr(
    ibw = NA,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = NA,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = NA,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = NA,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = NA,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = NA,
    dm = 1,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = NA,
    dm_ib = 1,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = NA,
    dm_fb = 1
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 2,
    ibn = 0.1,
    fbn = 0.2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1,
    dm_ib = 1,
    dm_fb = NA
  ))
})

test_that("nr() works with vectors", {
  result <- nr(
    ibw = c(1, 2, 3),
    fbw = c(10, 10, 10),
    ibn = c(0.1, 0.5, 0.9),
    fbn = c(0.1, 0.5, 0.9),
    fi = c(1, 1, 1),
    nut_f = c(0.1, 0.5, 0.9),
    dm = c(1, 1, 1),
    dm_ib = c(1, 1, 1),
    dm_fb = c(1, 1, 1)
  )
  expect_length(result, 3)
  expect_equal(result, c(9, 8, 7))
})

test_that("nr() throws error when inputs have different lengths", {
  expect_message(nr(
    ibw = c(1, 2),
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_message(nr(
    ibw = 1,
    fbw = c(2, 3),
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = c(0.1, 0.9),
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = c(0.1, 0.9),
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = c(10, 20),
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = c(0.1, 0.9),
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = c(0.1, 0.9),
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = c(0.1, 0.9),
    dm_fb = 0.05
  ))
  expect_message(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = c(0.1, 0.9)
  ))
})

test_that("nr() throws warning or error when input is <= 0", {
  expect_warning(nr(
    ibw = 0,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0,
    dm_fb = 0.05
  ))
  expect_error(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0
  ))
  expect_warning(nr(
    ibw = -1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = -1,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = -1,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = -1,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = -1,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = -1,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = -1,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = -1,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = -1
  ))
})

test_that("nr() throws warning when input is out of bounds", {
  expect_warning(nr(
    ibw = 1,
    fbw = 10,
    ibn = 2,
    fbn = 0.1,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 10,
    ibn = 0.05,
    fbn = 2,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 10,
    ibn = 0.5,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 2,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 11,
    ibn = 0.05,
    fbn = 0.1,
    fi = 0.05,
    nut_f = 0.01,
    dm = 2,
    dm_ib = 0.01,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 10,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 2,
    dm_fb = 0.05
  ))
  expect_warning(nr(
    ibw = 1,
    fbw = 10,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.1,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 2
  ))
})

test_that("nr() calculates correctly", {
  expect_equal(nr(
    ibw = 1,
    fbw = 0.01,
    ibn = 0.05,
    fbn = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05,
    dm_ib = 0.01,
    dm_fb = 0.9
  ), -16.4)
})

# Testing the Nutrient Efficiency Ratio (NER)
test_that("ner() throws error when input is not numeric", {
  expect_error(ner(
    ibw = "test",
    fbw = 2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1
  ))
  expect_error(ner(
    ibw = 1,
    fbw = NULL,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = TRUE,
    nut_f = 0.1,
    dm = 1
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 0.5,
    nut_f = FALSE,
    dm = 1
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 0.5,
    nut_f = 0.1,
    dm = FALSE
  ))
  expect_error(ner(
    ibw = NA,
    fbw = 2,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1
  ))
  expect_error(ner(
    ibw = 1,
    fbw = NA,
    fi = 0.5,
    nut_f = 0.1,
    dm = 1
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = NA,
    nut_f = 0.1,
    dm = 1
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 0.5,
    nut_f = NA,
    dm = 1
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2,
    fi = 0.5,
    nut_f = 0.1,
    dm = NA
  ))
})

test_that("ner() works with vectors", {
  result <- ner(
    ibw = c(1, 2, 3),
    fbw = c(10, 10, 10),
    fi = c(1, 1, 1),
    nut_f = c(0.1, 0.5, 0.9),
    dm = c(1, 1, 1)
  )
  expect_length(result, 3)
  expect_equal(result, c(90, 16, 7.777), 
               tolerance = 0.01)
})

test_that("ner() throws error when inputs have different lengths", {
  expect_message(ner(
    ibw = c(1, 2),
    fbw = 3,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05
  ))
  expect_message(ner(
    ibw = 1,
    fbw = c(2, 3),
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05
  ))
  expect_message(ner(
    ibw = 1,
    fbw = 3,
    fi = c(20, 30),
    nut_f = 0.01,
    dm = 0.05
  ))
  expect_message(ner(
    ibw = 1,
    fbw = 3,
    fi = 0.05,
    nut_f = c(0.1, 0.9),
    dm = 0.05
  ))
  expect_message(ner(
    ibw = 1,
    fbw = 3,
    fi = 10,
    nut_f = 0.01,
    dm = c(0.1, 0.9)
  ))
})

test_that("ner() throws warning or error when input is <= 0", {
  expect_warning(expect_warning(ner(
    ibw = 0,
    fbw = 0.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05
  )))
  expect_warning(expect_warning(expect_warning(ner(
    ibw = 1,
    fbw = 0,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05
  ))))
  expect_error(ner(
    ibw = 1,
    fbw = 2.01,
    fi = 0,
    nut_f = 0.01,
    dm = 0.05
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2.01,
    fi = 0.05,
    nut_f = 0,
    dm = 0.05
  ))
  expect_error(ner(
    ibw = 1,
    fbw = 2.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0
  ))
  expect_warning(expect_warning(ner(
    ibw = -1,
    fbw = 2.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05
  )))
  expect_warning(expect_warning(expect_warning(ner(
    ibw = 1,
    fbw = -1,
    fi = 0.05,
    nut_f = 0.01,
    dm = 0.05
  ))))
  expect_warning(ner(
    ibw = 1,
    fbw = 2.01,
    fi = -1,
    nut_f = 0.01,
    dm = 0.05
  ))
  expect_warning(ner(
    ibw = 1,
    fbw = 2.01,
    fi = 0.05,
    nut_f = -1,
    dm = 0.05
  ))
  expect_warning(ner(
    ibw = 1,
    fbw = 2.01,
    fi = 0.05,
    nut_f = 0.01,
    dm = -1
  ))
})

test_that("ner() throws warning when input is out of bounds", {
  expect_warning(ner(
    ibw = 1,
    fbw = 10,
    fi = 0.05,
    nut_f = 2,
    dm = 0.05
  ))
  expect_warning(ner(
    ibw = 1,
    fbw = 10,
    fi = 0.05,
    nut_f = 0.01,
    dm = 2
  ))
})

test_that("ner() calculates correctly", {
  expect_equal(ner(
    ibw = 1,
    fbw = 10,
    fi = 15,
    nut_f = 0.9,
    dm = 0.9
  ), 0.741,
  tolerance = 0.01)
})

