#' This dataset contains daily feed intake data from a feeding trial with 
#' Atlantic salmon (Salmo salar).
#' The original dataset ("FeedIntake") was published by Liland et al. (2024) 
#' and is from the first out of two trials ("Trial A"). Alterations to the 
#' original data structure were done by 1) converting the double-row column 
#' names into single-row column names and 2) converting the table into long 
#' format by moving the tank IDs into a separate column. NA values have been
#' replaced by the recalculated feed intakes for the respective day.

library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(purrr)

# --- 1) Read the sheet without headers ---
df_raw <- read_excel(
  "data_prep/Trial_A_data.xlsx", 
  sheet = "FeedIntake", 
  col_names = FALSE, 
  skip = 2
)


# --- 2) Extract the first two header rows ---
hdr1 <- df_raw %>% slice(1) %>% as.character() %>% print()
hdr2 <- df_raw %>% slice(2) %>% as.character() %>% print()


# --- 3) Forward-fill group labels across NAs (e.g., "Water temperature (°C)" across T1..T11) ---
# Convert to tibble for fill, then back to vector
hdr1_filled <- tibble(hdr1 = hdr1) %>%
  tidyr::fill(hdr1, .direction = "down") %>%
  pull(hdr1) %>% 
  print()


# --- 4) Build final names by combining hdr1_filled and hdr2 ---
# For columns where hdr1_filled is NA/empty (like the date column),
# just use hdr2; otherwise combine with an underscore.
hdr1_filled[is.na(hdr1_filled)] <- ""
final_names <- ifelse(
  hdr1_filled == "",
  hdr2,
  paste0(hdr1_filled, "_", hdr2)
) %>% 
  print()


# --- 5) Apply column names and drop the first two header rows ---
df <- df_raw %>%
  slice(-(1:2)) %>%            # remove header rows
  setNames(final_names)

# --- 6) Convert date
feed_intake <- df %>%
  mutate(
    date = as.Date(as.numeric(date), origin = "1899-12-30"),
    across(where(is.character), ~as.numeric(.x))
    ) %>% 
  pivot_longer(
    cols = `Daily feed intake - individual level (g/fish)_T1`:last_col(),
    names_to = c("parameter", "tank"),
    names_pattern = "^(.*)_(.*)$",
    values_to = "value"
  ) %>% 
  pivot_wider(
    names_from = "parameter",
    values_from = "value"
  ) %>% 
  mutate(
    tank = as.factor(tank)
  ) %>% 
  rename_with(~str_to_lower(.x)) %>% 
  rename_with(~str_replace_all(.x, " ", "_")) %>% 
  rename_with(~str_remove_all(.x, "[()]")) %>%
  rename_with(~str_remove(.x, "_-_individual_level_g/fish")) %>%
  replace_na(replace = list(`daily feed intake - individual level (g/fish)` = 0)) %>%
  print()


save(
  object = feed_intake,
  file = here::here("data", "feed_intake.RData")
)
