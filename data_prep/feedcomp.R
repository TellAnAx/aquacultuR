#' This dataset contains compositional data of Skretting Protec, a commercial
#' fish feed. The data comprises the proximate composition, phosphorus, and
#' some essential amino acids. 

library(dplyr)
library(tidyr)
library(stringr)
library(purrr)

# --- 1) Read the sheet without headers ---
df_raw <- readxl::read_excel(
  "data_prep/Trial_A_data.xlsx", 
  sheet = "DietComposition", 
  col_names = FALSE, 
  skip = 2,
  na = "NA"
)


# --- 2) Extract the first two header rows ---
hdr1 <- df_raw %>% slice(1) %>% as.character() %>% print()
hdr2 <- df_raw %>% slice(2) %>% as.character() %>% print()


# --- 4) Build final names by combining hdr1_filled and hdr2 ---
# For columns where hdr1_filled is NA/empty (like the date column),
# just use hdr2; otherwise combine with an underscore.
final_names <- ifelse(
  hdr2 == "-",
  hdr1,
  paste0(hdr1, "_", hdr2)
  ) %>% 
  print()


# --- 5) Apply column names and drop the first two header rows ---
df <- df_raw %>%
  slice(-(1:2)) %>%            # remove header rows
  setNames(final_names)


feedcomp <- df %>%
  rename_with(~str_to_lower(.x)) %>%
  rename_with(~str_replace(.x, "%", "perc")) %>% 
  rename_with(~str_replace_all(.x, " ", "_")) %>% 
  rename_with(~str_replace_all(.x, "/", "_per_")) %>%
  rename_with(~str_remove(.x, "_perc_as_fed")) %>%
  rename_with(~str_remove(.x, "_mj_per_kg_as_fed")) %>%
  mutate(
    across(.cols = 2:last_col(), ~as.numeric(.x))
  ) %>% 
  print()


save(
  object = feedcomp,
  file = here::here("data", "feedcomp.RData"),
  compress = TRUE
)
