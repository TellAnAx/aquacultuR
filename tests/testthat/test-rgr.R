test_that("rgr() throws error if input is non-numeric", {
  expect_error(rgr(m_start = "test", m_end = 2, duration = 3))
  expect_error(rgr(m_start = 1, m_end = "test", duration = 3))
  expect_error(rgr(m_start = 1, m_end = 2, duration = "test"))
  expect_error(rgr(m_start = NA, m_end = 2, duration = 3))
  expect_error(rgr(m_start = 1, m_end = NA, duration = 3))
  expect_error(rgr(m_start = 1, m_end = 2, duration = NA))
})

test_that("rgr() throws error if input == 0", {
  expect_error(rgr(m_start = 0, m_end = 2, duration = 3))
  expect_error(rgr(m_start = 1, m_end = 2, duration = 0))
})

  
test_that("rgr() throws warning if input < 0", {
  expect_warning(rgr(m_start = -1, m_end = 2, duration = 3))
  expect_warning(rgr(m_start = 1, m_end = -2, duration = 3))
  expect_warning(rgr(m_start = 1, m_end = 2, duration = -3))
})  

test_that("rgr() throws message if inputs are of different length", {
  expect_message(rgr(m_start = c(1,2), m_end = 2, duration = 3))
  expect_message(rgr(m_start = 1, m_end = c(2, 3), duration = 3))
  expect_message(rgr(m_start = 1, m_end = 2, duration = c(3,4)))
})
  
test_that("rgr() calculates Relative Growth Rate correctly",{
    expect_equal(rgr(m_start = 10, m_end = 20, duration = 10), 0.1)
    expect_equal(rgr(m_start = 10, m_end = c(20, 30, 40), duration = 100), c(0.01, 0.02, 0.03))
  })

