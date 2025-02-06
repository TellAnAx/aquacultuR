test_that("Absolute growth rate calcultion works", {
  expect_equal(rgr(m_start = 1,
                   m_end = 12,
                   duration = 3), 1.05847549)
})
