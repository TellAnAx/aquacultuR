#' This dataset contains the rearing tank and respective treatment

treatments <- tibble::tribble(
  ~tank, ~treatment,
  "T1",  "DO50perc",
  "T2",  "DO50perc",
  "T3",  "DO50perc",
  "T6",  "DO60perc",
  "T7",  "DO60perc",
  "T8",  "DO60perc",
  "T9",  "DO95perc",
  "T10", "DO95perc",
  "T11", "DO95perc"
) %>% 
  mutate(across(everything(), ~as.factor(.x)))


save(
  objects = treatments,
  file = here::here("data", "treatments.RData")
)
