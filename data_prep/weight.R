library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(purrr)

# --- 1) Read the sheet without headers ---
df_raw <- read_excel(
  "data/Trial_A_data.xlsx", 
  sheet = "Samplings", 
  col_names = FALSE, 
  skip = 1
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

