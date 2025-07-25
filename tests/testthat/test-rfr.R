test_that("relative feeding rate",{
  
  expect_warning(rfr(m_feed=1, m_bio=0, duration=3))
  expect_warning(rfr(m_feed=0,m_bio=2,duration=3))
  expect_warning(rfr(m_feed=-1,m_bio=2,duration=3))
  expect_warning(rfr(m_feed=1,m_bio=-2,duration=3))
  expect_warning(rfr(m_feed=1,m_bio=2,duration=-3))
  expect_error(rfr(m_feed=1,m_bio=2,duration=0))
  expect_error(rfr(m_feed= 'test',m_bio=2,duration=3))
  expect_error(rfr(m_feed=1,m_bio= 'test',duration=3))
  expect_error(rfr(m_feed=1,m_bio=2,duration= 'test'))
  expect_error(rfr(m_feed=na,m_bio=2,duration=3))
  expect_error(rfr(m_feed=1,m_bio=na,duration=3))
  expect_error(rfr(m_feed=1,m_bio=2,duration=na))
})

