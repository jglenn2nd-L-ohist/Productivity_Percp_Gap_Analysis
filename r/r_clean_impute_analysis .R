# 1. Load Libraries
install.packages("tidtverse")
library(tidyverse) # Includes dplyr and ggplot2 for data manipulation and visualization

# NOTE: The data 'productivity_analysis_sql_clean.csv' is assumed to be 
# a smaller, cleaned subset exported from the SQL database phase.
df_raw <- read_csv("productivity_analysis_sql_clean.csv")

# 2. Feature Engineering & Categorization
df_final_analysis <- df_raw %>%
  
  # --- 2.1 Categorize Screen Time Before Bed ---
  mutate(
    screen_time_category = case_when(
      screen_time_before_sleep <= 0.5 ~ "Low Screen Time (<= 30 min)",
      screen_time_before_sleep > 0.5 & screen_time_before_sleep <= 1.5 ~ "Moderate Screen Time (0.5 to 1.5 hrs)",
      screen_time_before_sleep > 1.5 ~ "High Screen Time (> 1.5 hrs)",
      TRUE ~ "Unknown" # Ensure all data is covered
    )
  ) %>%
  
  # --- 2.2 Categorize Sleep Hours ---
  mutate(
    sleep_hours_category = case_when(
      sleep_hours < 6 ~ "Short Sleep (< 6 hrs)",
      sleep_hours >= 6 & sleep_hours <= 9 ~ "Adequate Sleep (6-9 hrs)",
      sleep_hours > 9 ~ "Long Sleep (> 9 hrs)",
      TRUE ~ "Unknown"
    )
  ) %>%
  
  # Convert New Features to Factors for the model
  mutate(
    screen_time_category = factor(screen_time_category, 
                                  levels = c("Low Screen Time (<= 30 min)", 
                                             "Moderate Screen Time (0.5 to 1.5 hrs)", 
                                             "High Screen Time (> 1.5 hrs)")),
    sleep_hours_category = factor(sleep_hours_category, 
                                  levels = c("Short Sleep (< 6 hrs)", 
                                             "Adequate Sleep (6-9 hrs)", 
                                             "Long Sleep (> 9 hrs)"))
  )


# --- 3. Exploratory Data Analysis (EDA) ---
# Create the histogram plot (visualizing the intercept/mean bias)
ggplot(df_final_analysis, aes(x = productivity_gap)) +
  geom_histogram(binwidth = 1, fill = "#0072B2", color = "white") +
  geom_vline(aes(xintercept = mean(productivity_gap, na.rm = TRUE)), 
             color = "red", linetype = "dashed", size = 1) +
  labs(title = "Distribution of the Productivity Gap (Perceived - Actual)") +
  theme_minimal()

# Create the box plot (visualizing the non-significant relationship)
ggplot(df_final_analysis, aes(x = screen_time_category, y = productivity_gap, fill = screen_time_category)) +
  geom_boxplot() +
  labs(title = "Productivity Gap by Screen Time Before Sleep") +
  theme_minimal()

# --- 4. Multiple Linear Regression (MLR) ---
# Goal: Test if Screen Time and Sleep Hours are statistically significant predictors of the Gap.
model_mlr <- lm(
  productivity_gap ~ screen_time_category + sleep_hours_category + sleep_hours, 
  data = df_final_analysis
)
# --- 3. Exploratory Data Analysis (EDA) ---
# Create the histogram plot (visualizing the intercept/mean bias)
ggplot(df_final_analysis, aes(x = productivity_gap)) +
  geom_histogram(binwidth = 1, fill = "#0072B2", color = "white") +
  geom_vline(aes(xintercept = mean(productivity_gap, na.rm = TRUE)), 
             color = "red", linetype = "dashed", size = 1) +
  labs(title = "Distribution of the Productivity Gap (Perceived - Actual)") +
  theme_minimal()

# Create the box plot (visualizing the non-significant relationship)
ggplot(df_final_analysis, aes(x = screen_time_category, y = productivity_gap, fill = screen_time_category)) +
  geom_boxplot() +
  labs(title = "Productivity Gap by Screen Time Before Sleep") +
  theme_minimal()

# --- 4. Multiple Linear Regression (MLR) ---
# Goal: Test if Screen Time and Sleep Hours are statistically significant predictors of the Gap.
model_mlr <- lm(
  productivity_gap ~ screen_time_category + sleep_hours_category + sleep_hours, 
  data = df_final_analysis
)

# Output the summary for interpretation
print(summary(model_mlr))

# Final check: Save the analysis data frame for Tableau consumption
write_csv(df_final_analysis, "data_for_tableau.csv")
