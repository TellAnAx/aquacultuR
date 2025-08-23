test_that("afr() throws error if duration == 0.", {
  expect_error(afr(m_feed = 1, duration = 0))
})

test_that("afr() throws error if input is non-numeric.", {
  expect_error(afr(m_feed = NA, duration = 2))
  expect_error(afr(m_feed = 1, duration = NA))
  expect_error(afr(m_feed = "test", duration = 2))
  expect_error(afr(m_feed = 1, duration = "test"))
  expect_error(afr(m_feed = TRUE, duration = 2))
  expect_error(afr(m_feed = 1, duration = FALSE))
})

test_that("afr() throws warning if input is negative.", {
  expect_warning(afr(m_feed = -1, duration = 2))
  expect_warning(afr(m_feed = 1, duration = -2))
})

test_that("afr() calculates Feeding Rate correctly.", {
  expect_equal(afr(m_feed = 1, duration = 10), 0.1)
  expect_equal(afr(m_feed = c(1, 2, 3), duration = 10), c(0.1, 0.2, 0.3))
  expect_equal(afr(m_feed = 1, duration = c(10, 20, 50)), c(0.1, 0.05, 0.02))
  expect_equal(afr(m_feed = c(1, 2), duration = c(10, 20)), c(0.1, 0.1))
})