
test_that("Apparent digestiblity coefficient", {
  expect_equal(adc(es_diet = 1, es_feaces = 2), 1)
  expect_equal(adc(es_diet=1, es_feaces=0))
  expect_error(adc(es_diet = 1, es_feaces = 'test'))
  expect_error(adc(es_diet = 'test', es_feaces = 2))
  expect_error(adc(es_diet = NA, es_feaces = 2))
  expect_error(adc(es_diet = 1, es_feaces = NA))
  expect_warning(adc(es_diet = -1, es_feaces = 2))
  expect_warning(adc(es_diet = 1, es_feaces= -2))
  expect_error (adc(es_diet>es_feaces))
  expect_error (adc(es_diet=0, es_feaces=2))
})