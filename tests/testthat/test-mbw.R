test_that("Metabolic Bodyweight calculation works", {
  expect_equal(mbw(m_start = 1,
                   m_end = 2), 
               1.319507911)
})
