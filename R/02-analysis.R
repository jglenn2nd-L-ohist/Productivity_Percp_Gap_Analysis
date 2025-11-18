# R/02-analysis.R -- example analysis: compare perceived vs measured productivity
library(tidyverse)

clean_path <- "outputs/sample_productivity_clean.csv"
if (!file.exists(clean_path)) stop("Run R/01-data-prep.R first")

df <- readr::read_csv(clean_path, show_col_types = FALSE)

summary_tbl <- df %>%
  group_by(activity_type) %>%
  summarize(
    n = n(),
    mean_perceived = mean(perceived_productivity, na.rm = TRUE),
    mean_measured = mean(measured_productivity, na.rm = TRUE),
    mean_gap = mean(perceived_productivity - measured_productivity, na.rm = TRUE)
  ) %>%
  arrange(desc(mean_gap))

print(summary_tbl)

# Save a simple CSV of results for quick sharing
dir.create("outputs", showWarnings = FALSE)
readr::write_csv(summary_tbl, "outputs/summary_activity_gap.csv")
message("Wrote outputs/summary_activity_gap.csv")
