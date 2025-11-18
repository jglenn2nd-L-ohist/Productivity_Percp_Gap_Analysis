# R/01-data-prep.R -- sample data prep for the portfolio
# Purpose: read sample CSV, clean timestamps and identifiers, write a cleaned CSV to outputs/

library(tidyverse)
library(lubridate)

dir.create("outputs", showWarnings = FALSE, recursive = TRUE)

sample_path <- "data/sample/sample_productivity.csv"
if (!file.exists(sample_path)) {
  stop("Sample data not found: ", sample_path)
}

df <- readr::read_csv(sample_path, show_col_types = FALSE)

df_clean <- df %>%
  mutate(timestamp = lubridate::ymd_hms(timestamp),
         date = as_date(timestamp),
         user_id = as.character(user_id)) %>%
  filter(!is.na(user_id))

readr::write_csv(df_clean, "outputs/sample_productivity_clean.csv")
message("Wrote outputs/sample_productivity_clean.csv")
