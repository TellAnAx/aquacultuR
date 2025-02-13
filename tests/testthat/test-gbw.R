test_that("Geometric Bodyweight calculation works", {
  expect_equal(gbw(m_start = 1,
                   m_end = 4), 
               2)
})
