#' This dataset contains compositional data on the proximate composition and
#' some key minerals in the body of Atlantic salmon (Salmo salar) at the 
#' beginning and the end of a trial.
#' The original dataset ('BodyComposition_tank') was published by Liland et al. 
#' (2024) and is from the first out of two trials ('Trial A'). Alterations to 
#' the original data structure were done by 1) converting the double-row column 
#' names into single-row column names and 2) removing the 'sex' column.

library(dplyr)
library(tidyr)
library(stringr)
library(purrr)

# --- 1) Read the sheet without headers ---
df_raw <- readxl::read_excel(
  "data_prep/Trial_A_data.xlsx", 
  sheet = "BodyComposition_tank", 
  col_names = FALSE, 
  skip = 2,
  na = "NA"
)


# --- 2) Extract the first two header rows ---
hdr1 <- df_raw %>% slice(1) %>% as.character() %>% print()
hdr2 <- df_raw %>% slice(2) %>% as.character() %>% print()

hdr2 <- hdr2 %>% replace_na("-") %>% print()


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


bodycomp <- df %>%
  rename_with(~str_to_lower(.x)) %>%
  rename(tank = "tank/replicate") %>% 
  rename_with(~str_replace(.x, "%", "perc")) %>% 
  rename_with(~str_replace_all(.x, " ", "_")) %>%
  rename_with(~str_replace_all(.x, "/", "_per_")) %>%
  rename(dm = "dry_matter_g_per_100g") %>%
  rename_with(~str_remove_all(.x, "_.*")) %>%
  mutate(
    date = as.Date(as.numeric(date), origin = "1899-12-30"),
    treatment = str_remove(treatment, "%") %>% as.factor(),
    tank = as.factor(tank),
    across(.cols = 4:last_col(), ~as.numeric(.x))
    ) %>% 
  print()


save(
  object = bodycomp,
  file = here::here("data", "bodycomp.RData"),
  compress = TRUE
  )
