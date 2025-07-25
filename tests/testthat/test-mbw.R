test_that("metabolic body weight", {
  
  # Expect errors for questionable but not fatal inputs
  expect_error(mbw(m_start = 1, m_end = 0))   # final weight zero
  expect_error(mbw(m_start = -1, m_end = 2))  # negative initial weight
  expect_error(mbw(m_start = 1, m_end = -2))  # negative final weight
  expect_error(mbw(gbw = -1))                 # negative gain body weight
  
  # Expect errors for invalid inputs
  expect_error(mbw(m_start = NA, m_end = 2))    # NA initial weight
  expect_error(mbw(m_start = 1, m_end = NA))    # NA final weight
  expect_error(mbw(gbw = NA))                   # NA gain body weight
  expect_error(mbw(m_start = "test", m_end = 2)) # non-numeric initial weight
  expect_error(mbw(m_start = 1, m_end = "test")) # non-numeric final weight
  expect_error(mbw(gbw = "test"))                # non-numeric gain body weight
  expect_error(mbw(m_start = 0, m_end = 2))      # zero initial weight
  expect_error(mbw(m_start = 5, m_end = 2))      # start > end
  
})
