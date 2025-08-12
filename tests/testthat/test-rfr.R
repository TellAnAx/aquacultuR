test_that("rfr() throws error if input is non-numeric", {
  expect_error(rfr(m_feed = "test", m_bio = 2, duration = 3))
  expect_error(rfr(m_feed = 1, m_bio = "test", duration = 3))
  expect_error(rfr(m_feed = 1, m_bio = 2, duration = "test"))
})

test_that("rfr() throws error if input is NA", {
  expect_error(rfr(m_feed = NA, m_bio = 2, duration = 3))
  expect_error(rfr(m_feed = 1, m_bio = NA, duration = 3))
  expect_error(rfr(m_feed = 1, m_bio = 2, duration = NA))
})

test_that("rfr() throws error if m_bio|duration == 0", {
  expect_error(rfr(m_feed = 1, m_bio = 0, duration = 3))
  expect_error(rfr(m_feed = 1, m_bio = 2, duration = 0))
})

test_that("rfr() throws warning if inputs are < 0", {
  expect_warning(rfr(m_feed = -1, m_bio = 2, duration = 3))
  expect_warning(rfr(m_feed = 1, m_bio = -2, duration = 3))
  expect_warning(rfr(m_feed = 1, m_bio = 2, duration = -3))
})

test_that("rfr() calculates Relative Feeding Rate correctly",{
  expect_equal(rfr(m_feed = 4, m_bio = 2, duration = 2), 1)
})