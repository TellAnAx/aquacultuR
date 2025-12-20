
digestdm <- tibble::tribble(
  ~diet, ~dm, ~std_feed, ~std_feces,
  "diet1", 0.9  , 0.01, 0.045,
  "diet2", 0.95 , 0.01, 0.04
)

save(
  digestdm,
  file = here::here("data", "digestdm.RData")
)



digestnut <- tibble::tribble(
  ~diet, ~dm, ~N_feed, ~std_feed, ~N_feces, ~std_feces,
  "diet1", 0.9, 0.064, 0.01, 0.016, 0.045,
  "diet2", 0.95, 0.06, 0.01, 0.016, 0.04 
)

save(
  digestnut,
  file = here::here("data", "digestnut.RData")
)


#' # Example from Bureau et al. (1999) - Blood meal 2
#' 
#' # reference feed dry matter: 0.928 (92.8%)
#' # reference feed nutrient mass frac.: 0.45 (45%)
#' # reference feed apparent digestibility coef.: 0.923 (92.3%)
#' # test feed apparent digestibility coef.: 0.902 (90.2%)
#' # test ingredient dry matter: 0.895 (89.5%)
#' # test ingredient nutrient mass frac.: 0.846 (84.6%)

digestingr <- tibble::tribble(
  ~diet_reference, ~ingredient, ~adc_reference, ~adc_test, ~dm_ref, ~dm_ingr, ~N_reference, ~N_ingr,
  "reference diet b", "blood meal 2", 0.923, 0.902, 0.928, 0.895, 0.45, 0.846
)

save(
  digestingr, 
  file = here::here("data", "digestingr.RData")
  )
