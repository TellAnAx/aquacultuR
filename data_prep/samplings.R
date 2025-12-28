#' This dataset contains the fish weight, fork length, sex, liver weight, 
#' hepatosomatic index, heart weight, cardiosomatic index, gonad weight, 
#' gonadosomatic index, viscera weight, and viscerosomatic index from a 
#' feeding trial with Atlantic salmon (Salmo salar).
#' The original dataset ("FeedIntake") was published by Liland et al. (2024)
#' and is from the first out of two trials ("Trial A"). Alterations to the 
#' original data structure were done by 1) converting the double-row column 
#' names into single-row column names

library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(purrr)



# --- 1) Read the sheet without headers ---
df_raw <- read_excel(
  "data_prep/Trial_A_data.xlsx", 
  sheet = "Samplings", 
  col_names = FALSE, 
  skip = 2
)


# --- 2) Extract the first two header rows ---
hdr1 <- df_raw %>% slice(1) %>% as.character() %>% print()
hdr2 <- df_raw %>% slice(2) %>% as.character() %>% print()


hdr2 <- hdr2 %>% replace_na("-") %>% print()


# --- 4) Build final names by combining hdr1_filled and hdr2 ---
# For columns where hdr1_filled is NA/empty (like the date column),
# just use hdr2; otherwise combine with an underscore.
final_names <- hdr1 %>% 
  print()


# --- 5) Apply column names and drop the first two header rows ---
df <- df_raw %>%
  slice(-(1:2)) %>%            # remove header rows
  setNames(final_names)


samplings <- df %>%
  
  rename_with(~str_to_lower(.x)) %>% 
  rename_with(~str_replace(.x, " ", "_")) %>% 
  
  select(-sex) %>% 
  
  mutate(
    date = as.Date(as.numeric(date), origin = "1899-12-30"),
    across(.cols = c(tank, replicate, sample_type), as.factor),
    across(fish_weight:last_col(), as.numeric)
    ) %>%
  print()


save(
  object = samplings,
  file = here::here("data", "samplings.RData")
)
