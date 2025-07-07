test_that("Absolute growth calcultion works", {
  expect_equal(ag(m_start = 1, m_end = 2), 1)
  expect_error(ag(m_start = 1, m_end = "test"))
  expect_error(ag(m_start = "test", m_end = 2))
  expect_error(ag(m_start = NA, m_end = 2))
  expect_error(ag(m_start = 1, m_end = NA))
  expect_warning(ag(m_start = -1, m_end = 2))
  expect_warning(ag(m_start = 1, m_end = -2))
})
