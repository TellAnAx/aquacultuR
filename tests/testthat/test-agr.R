test_that("Absolute growth rate calcultion works", {
  expect_equal(agr(m_start = 1, 
                   m_end = 10, 
                   duration = 3), 
               3)
})
