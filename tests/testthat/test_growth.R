# Testing the Absolute Growth (AG)
test_that("ag() throws error when input is not numeric", {
  expect_error(ag(
    ibw = NULL, 
    fbw = 2))
  expect_error(ag(
    ibw = 1, 
    fbw = "test"))
})

test_that("ag() works with vectors", {
  result <- ag(
    ibw = c(10, 20, 30),
    fbw = c(1, 1, 1)
  )
  expect_length(result, 3)
  expect_equal(result, c(-9, -19, -29))
})

test_that("ag() throws message if inputs differ in length.", {
  expect_message(ag(
    ibw = c(1, 1),
    fbw = 2))
  expect_message(ag(
    ibw = 1, 
    fbw = c(2, 2)
    ))
})

test_that("ag() throws warning if inputs are <= 0.", {
  expect_warning(ag(
    ibw = -1, 
    fbw = 2
    ))
  expect_warning(ag(
    ibw = 1,
    fbw = -2
    ))
  expect_warning(ag(
    ibw = 0, 
    fbw = 2
  ))
  expect_warning(ag(
    ibw = 1,
    fbw = 0
  ))
})

test_that("ag() corrects result correctly.", {
  expect_equal(ag(
    ibw = 1,
    fbw = 2)
    , 1)
  expect_message(
    expect_equal(ag(
      ibw = 1,
      fbw = c(2, 2)),
      c(1, 1)
      ))
})

# Testing the Relative Growth (RG)
test_that("rg() throws error when input is not numeric", {
  expect_error(rg(
    ibw = NULL, 
    fbw = 2))
  expect_error(rg(
    ibw = 1, 
    fbw = "test"))
})

test_that("rg() works with vectors", {
  result <- rg(
    ibw = c(1, 2, 3),
    fbw = c(10, 20, 30)
  )
  expect_length(result, 3)
  expect_equal(result, c(9, 9, 9))
})

test_that("rg() throws message if inputs differ in length.", {
  expect_message(rg(
    ibw = c(1, 1),
    fbw = 2))
  expect_message(rg(
    ibw = 1, 
    fbw = c(2, 2)
  ))
})

test_that("rg() throws warning if inputs are <= 0.", {
  expect_warning(rg(
    ibw = -1, 
    fbw = 2
  ))
  expect_warning(rg(
    ibw = 1,
    fbw = -2
  ))
  expect_warning(rg(
    ibw = 0, 
    fbw = 2
  ))
  expect_warning(rg(
    ibw = 1,
    fbw = 0
  ))
})

test_that("rg() corrects result correctly.", {
  expect_equal(rg(
    ibw = 1,
    fbw = 2)
    , 1)
  expect_equal(rg(
    ibw = c(1, 2),
    fbw = c(3,3)),
    c(2, 0.5))
  expect_equal(rg(
    ibw = c(1,1),
    fbw = c(2, 3)),
    c(1, 2))
})

# Testing the Absolute Growth Rate (AGR)
test_that("agr() throws error when input is not numeric", {
  expect_error(agr(
      ibw = "test",
      fbw = 2,
      duration = 3
    )
  )
  expect_error(agr(
      ibw = 1,
      fbw = NULL,
      duration = 3
    )
  )
  expect_error(agr(
      ibw = 1,
      fbw = 2,
      duration = FALSE
    )
  )
  expect_error(agr(
      ibw = NA,
      fbw = 2,
      duration = 3
    )
  )
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

test_that("agr() works with vectors", {
  result <- agr(
    ibw = c(1, 2, 3),
    fbw = c(10, 20, 30),
    duration = c(10, 10, 10)
  )
  expect_length(result, 3)
  expect_equal(result, c(0.9, 1.8, 2.7))
})

test_that("agr() throws message if inputs differ in length.", {
  expect_message(agr(
    ibw = c(1, 1),
    fbw = 2,
    duration = 10))
  expect_message(agr(
    ibw = 1, 
    fbw = c(2, 2),
    duration = 10))
  expect_message(agr(
    ibw = 1,
    fbw = 2,
    duration = c(10,10))
  )
})

test_that("agr() throws warning if inputs are <= 0.", {
  expect_warning(agr(
    ibw = -1, 
    fbw = 2,
    duration = 10
  ))
  expect_warning(agr(
    ibw = 1,
    fbw = -2,
    duration = 10
  ))
  expect_warning(agr(
    ibw = 0,
    fbw = 2,
    duration = 10
  ))
  expect_warning(agr(
    ibw = 1,
    fbw = 0,
    duration = 10
  ))
})

test_that("agr() throws error if duration is <= 0.", {
 expect_error(agr(
    ibw = 1, 
    fbw = 2,
    duration = -10
  ))
  expect_error(agr(
    ibw = 1,
    fbw = 2,
    duration = 0
  ))
})

test_that("agr() calculates result correctly.", {
  expect_equal(agr(
    ibw = 1,
    fbw = 2,
    duration = 10
  ), 0.1)
  expect_equal(agr(
    ibw = c(1,2),
    fbw = c(2,4),
    duration = c(10,20)
  ), c(0.1,0.1))
})

# Testing the Specific Growth Rate (SGR)

test_that("sgr() throws error when input is not numeric", {
  expect_error(sgr(
    ibw = "test",
    fbw = 2,
    duration = 3
  )
  )
  expect_error(sgr(
    ibw = 1,
    fbw = NULL,
    duration = 3
  )
  )
  expect_error(sgr(
    ibw = 1,
    fbw = 2,
    duration = FALSE
  )
  )
  expect_error(sgr(
    ibw = NA,
    fbw = 2,
    duration = 3
  )
  )
  expect_error(sgr(
    ibw = 1,
    fbw = NA,
    duration = 3
  ))
  expect_error(sgr(
    ibw = 1,
    fbw = 2,
    duration = NA
  ))
})

test_that("sgr() works with vectors", {
  result <- sgr(
    ibw = c(1, 2, 3),
    fbw = c(4, 8, 12),
    duration = c(2, 2, 2)
  )
  expect_length(result, 3)
  expect_equal(result, c(100, 100, 100))
})

test_that("sgr() throws message if inputs differ in length.", {
  expect_message(sgr(
    ibw = c(1, 1),
    fbw = 2,
    duration = 10))
  expect_message(sgr(
    ibw = 1, 
    fbw = c(2, 2),
    duration = 10))
  expect_message(sgr(
    ibw = 1,
    fbw = 2,
    duration = c(10,10))
  )
})

test_that("sgr() throws warning or errors if inputs are <= 0.", {
  expect_error(sgr(
    ibw = -1, 
    fbw = 2,
    duration = 10
  ))
  expect_error(sgr(
    ibw = 1,
    fbw = -2,
    duration = 10
  ))
  expect_warning(sgr(
    ibw = 0,
    fbw = 2,
    duration = 10
  ))
  expect_warning(sgr(
    ibw = 1,
    fbw = 0,
    duration = 10
  ))
  expect_warning(sgr(
    ibw = 1, 
    fbw = 2,
    duration = -10
  ))
  expect_error(sgr(
    ibw = 1,
    fbw = 2,
    duration = 0
  ))
})

test_that("sgr() calculates result correctly.", {
  expect_equal(sgr(
    ibw = 1,
    fbw = 5,
    duration = 11),
    15.76, 
  tolerance = 0.01
  )
  expect_equal(sgr(
    ibw = c(1,2),
    fbw = c(2,4),
    duration = c(10,20)),
    c(7.18,3.53), 
    tolerance = 0.01
    )
})

# Testing the Thermal Growth Coefficient (TGC)
test_that("tgc() throws error when input is not numeric", {
  expect_error(tgc(
    ibw = "test",
    fbw = 2,
    duration = 3,
    temp = 4
  ))
  expect_error(tgc(
    ibw = 1,
    fbw = NULL,
    duration = 3,
    temp = 4
  ))
  expect_error(tgc(
    ibw = 1,
    fbw = 2,
    duration = FALSE,
    temp = 4
  ))
  expect_error(tgc(
    ibw = 1,
    fbw = 2,
    duration = 3,
    temp = TRUE
  ))
  expect_error(tgc(
    ibw = NA,
    fbw = 2,
    duration = 3,
    temp = 4
  ))
  expect_error(tgc(
    ibw = 1,
    fbw = NA,
    duration = 3,
    temp = 4
  ))
  expect_error(tgc(
    ibw = 1,
    fbw = 2,
    duration = NA,
    temp = 4
  ))
  expect_error(tgc(
    ibw = 1,
    fbw = 2,
    duration = 3,
    temp = NA
  ))
})

test_that("tgc() works with vectors", {
  result <- tgc(
    ibw = c(1, 2, 3),
    fbw = c(4, 8, 12),
    duration = c(2, 2, 2),
    temp = c(15,20,25)
  )
  expect_length(result, 3)
  expect_equal(result, c(19.58, 18.50, 16.9),
               tolerance = 0.01)
})

test_that("tgc() throws message if inputs differ in length.", {
  expect_message(tgc(
    ibw = c(1, 1),
    fbw = 2,
    duration = 10,
    temp = 15
    ))
  expect_message(tgc(
    ibw = 1, 
    fbw = c(2, 2),
    duration = 10,
    temp = 20
    ))
  expect_message(tgc(
    ibw = 1,
    fbw = 2,
    duration = c(10,10),
    temp = c(25,30)
    ))
  expect_message(tgc(
    ibw = 1,
    fbw = 2,
    duration = 10,
    temp = c(25,30)
    )
  )
})

test_that("tgc() throws warning or errors if inputs are <= 0.", {
  expect_warning(tgc(
    ibw = -1, 
    fbw = 2,
    duration = 10,
    temp = 15
  ))
  expect_warning(tgc(
    ibw = 1,
    fbw = -2,
    duration = 10,
    temp = 15
  ))
  expect_warning(tgc(
    ibw = 0,
    fbw = 2,
    duration = 10,
    temp = 15
  ))
  expect_warning(tgc(
    ibw = 1,
    fbw = 0,
    duration = 10,
    temp = 15
  ))
  expect_warning(tgc(
    ibw = 1, 
    fbw = 2,
    duration = -10,
    temp = 15
  ))
  expect_error(tgc(
    ibw = 1,
    fbw = 2,
    duration = 0,
    temp = 15
  ))
  expect_warning(tgc(
    ibw = 1, 
    fbw = 2,
    duration = 10,
    temp = -15
  ))
  expect_error(tgc(
    ibw = 1,
    fbw = 2,
    duration = 10,
    temp = 0
  ))
})

test_that("tgc() calculates result correctly.", {
  expect_equal(tgc(
    ibw = 1,
    fbw = 5,
    duration = 11,
    temp = 20),
    3.23, 
    tolerance = 0.01
  )
  expect_equal(tgc(
    ibw = c(1,2),
    fbw = c(2,4),
    duration = c(10,20),
    temp = c(20,25)),
    c(1.30,0.655), 
    tolerance = 0.01
  )
})

# Testing the Geometric Mean Bodyweight (GMBW)
test_that("gbw() throws error when input is not numeric", {
  expect_error(gbw(
    ibw = "test",
    fbw = 2
  ))
  expect_error(gbw(
    ibw = 1,
    fbw = NULL
  ))
  expect_error(gbw(
    ibw = 1,
    fbw = 2,
  ))
  expect_error(gbw(
    ibw = NA,
    fbw = 2,
  ))
  expect_error(gbw(
    ibw = 1,
    fbw = NA,
  ))
})

test_that("gbw() works with vectors", {
  result <- gbw(
    ibw = c(1, 2, 3),
    fbw = c(4, 8, 12)
  )
  expect_length(result, 3)
  expect_equal(result, c(2, 4, 6),
               tolerance = 0.01)
})

test_that("gbw() throws message if inputs differ in length.", {
  expect_message(gbw(
    ibw = c(1, 1),
    fbw = 2
  ))
  expect_message(gbw(
    ibw = 1, 
    fbw = c(2, 2)
  ))
})

test_that("gbw() throws warning or errors if inputs are <= 0.", {
  expect_error(gbw(
    ibw = -1, 
    fbw = 2,
  ))
  expect_error(gbw(
    ibw = 1,
    fbw = -2,
  ))
  expect_error(gbw(
    ibw = 0,
    fbw = 2,
  ))
  expect_error(gbw(
    ibw = 1,
    fbw = 0,
  ))
})

test_that("gbw() calculates result correctly.", {
  expect_equal(gbw(
    ibw = 1,
    fbw = 5),
    2.236, 
    tolerance = 0.01
  )
  expect_equal(gbw(
    ibw = c(1,2),
    fbw = c(2,4)),
    c(1.414,2.828), 
    tolerance = 0.01
  )
})

# Testing the Relative Growth Rate (RGR)
test_that("rgr() throws error when input is not numeric", {
  expect_error(rgr(
    ibw = "test",
    fbw = 2,
    duration = 3
  ))
  expect_error(rgr(
    ibw = 1,
    fbw = NULL,
    duration = 3
  ))
  expect_error(rgr(
    ibw = 1,
    fbw = 2,
    duration = FALSE
  ))
  expect_error(rgr(
    ibw = NA,
    fbw = 2,
    duration = 3
  ))
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

test_that("rgr() works with vectors", {
  result <- rgr(
    ibw = c(1, 2, 3),
    fbw = c(4, 8, 12),
    duration = c(2, 2, 2)
  )
  expect_length(result, 3)
  expect_equal(result, c(0.75, 0.75, 0.75),
               tolerance = 0.01)
})

test_that("rgr() throws message if inputs differ in length.", {
  expect_message(rgr(
    ibw = c(1, 1),
    fbw = 2,
    duration = 10
    ))
  expect_message(rgr(
    ibw = 1, 
    fbw = c(2, 2),
    duration = 10
    ))
  expect_message(rgr(
    ibw = 1,
    fbw = 2,
    duration = c(10,10)
    )
  )
})

test_that("rgr() throws warning or errors if inputs are <= 0.", {
  expect_error(rgr(
    ibw = -1, 
    fbw = 2,
    duration = 10
  ))
  expect_error(rgr(
    ibw = 1,
    fbw = -2,
    duration = 10
  ))
  expect_error(rgr(
    ibw = 0,
    fbw = 2,
    duration = 10
  ))
  expect_error(rgr(
    ibw = 1,
    fbw = 0,
    duration = 10
  ))
  expect_warning(rgr(
    ibw = 1, 
    fbw = 2,
    duration = -10
  ))
  expect_error(rgr(
    ibw = 1,
    fbw = 2,
    duration = 0
  ))
})

test_that("rgr() calculates result correctly.", {
  expect_equal(rgr(
    ibw = 1,
    fbw = 5,
    duration = 11),
    0.163, 
    tolerance = 0.01
  )
  expect_equal(rgr(
    ibw = c(1,2),
    fbw = c(2,4),
    duration = c(10,20)),
    c(0.071,0.035), 
    tolerance = 0.01
  )
})

# Testing the Metabolic bodyweight (MBW)
test_that("mbw() throws error when input is not numeric", {
  expect_error(mbw(
    ibw = "test",
    fbw = 2,
    mb_exp = 0.9
  ))
  expect_error(mbw(
    ibw = 1,
    fbw = NULL,
    mb_exp = 0.9
  ))
  expect_error(mbw(
    ibw = 1,
    fbw = 2,
    mb_exp = FALSE
  ))
  expect_error(mbw(
    ibw = NA,
    fbw = 2,
    mb_exp = 0.9
  ))
  expect_error(mbw(
    ibw = 1,
    fbw = NA,
    mb_exp = 0.9
  ))
  expect_error(mbw(
    ibw = 1,
    fbw = 2,
    mb_exp = NA
  ))
})

test_that("mbw() works with vectors", {
  result <- mbw(
    ibw = c(1, 2, 3),
    fbw = c(4, 8, 12),
    mb_exp = c(0.1, 0.5, 0.8)
  )
  expect_length(result, 3)
  expect_equal(result, c(1.07, 2.00, 4.19),
               tolerance = 0.01)
})

test_that("mbw() throws message if inputs differ in length.", {
  expect_message(mbw(
    ibw = c(1, 1),
    fbw = 2,
    mb_exp = 0.9
  ))
  expect_message(mbw(
    ibw = 1, 
    fbw = c(2, 2),
    mb_exp = 0.9
  ))
  expect_message(mbw(
    ibw = 1,
    fbw = 2,
    mb_exp = c(0.2,0.9)
  )
  )
})

test_that("mbw() throws warning or errors if inputs are <= 0.", {
  expect_error(mbw(
    ibw = -1, 
    fbw = 2,
    mb_exp = 0.9
  ))
  expect_error(mbw(
    ibw = 1,
    fbw = -2,
    mb_exp = 0.9
  ))
  expect_warning(mbw(
    ibw = 0,
    fbw = 2,
    mb_exp = 0.9
  ))
  expect_warning(mbw(
    ibw = 1,
    fbw = 0,
    mb_exp = 0.9
  ))
})

test_that("mbw() throws warning if mb_exp is [0,1]", {
expect_warning(mbw(
  ibw = 1, 
  fbw = 2,
  mb_exp = -0.9
))
expect_warning(mbw(
  ibw = 1,
  fbw = 2,
  mb_exp = 1.5
))
})

test_that("mbw() calculates result correctly.", {
  expect_equal(mbw(
    ibw = 1,
    fbw = 5,
    mb_exp = 0.9),
    2.063, 
    tolerance = 0.01
  )
  expect_equal(mbw(
    ibw = c(1,2),
    fbw = c(2,4),
    mb_exp = c(0.2,0.9)),
    c(1.072,2.549), 
    tolerance = 0.01
  )
})
