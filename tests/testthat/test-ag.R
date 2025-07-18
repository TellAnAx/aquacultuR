test_that( "absolute growth", {
  expect_equal( ag(m_start=1, m_end=2),1)
  expect_equal(ag(m_start=1, m_end=0))
  expect_warning(ag(m_start=0, m_end=2))
  expect_warning( ag(m_start=-1, m_end=2))
  expect_warning (ag(m_start=1, m_end=-2))
  expect_error(ag(m_start>m_end))
  expect_error(ag(m_start= 'test',m_end=0))
  expect_error(ag(m_start=1, m_end= 'test'))
  expect_error(ag(m_start=na, m_end=2))
  expect_error(ag(m_start=1, m_end=na))
})
  
  