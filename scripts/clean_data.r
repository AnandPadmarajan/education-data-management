# Load libraries
library(readr)
library(dplyr)
library(tidyr)
library(haven)
library(janitor)

# Step 1: Import raw CSV, Taking only the first 1000 rows for testing
raw <- read_csv("data/EdStatsData.csv", n_max = 1000)

# Clean column names to be safe
raw <- janitor::clean_names(raw)
print(dim(raw))   # Check rows and columns
print(head(raw, 10))  # Preview first 10 rows

# Step 2: Reshape wide → long format
long_data <- raw %>%
  pivot_longer(
    cols = starts_with("x19") | starts_with("x20"),
    names_to = "year",
    values_to = "value"
  )

# Step 3: Convert Year to integer (strip 'x' first)
long_data$year <- as.integer(sub("x", "", long_data$year))

# Step 4: Handle missing values
long_data <- long_data %>%
  mutate(value = ifelse(is.na(value), NA, value))

# Step 5: Example recoding (region from Country Code)
long_data$region_code <- ifelse(long_data$country_code == "ARB", 1, NA)

# Step 6: Export cleaned dataset
write.csv(long_data, "data/cleaned_data.csv", row.names = FALSE)
write_dta(long_data, "data/cleaned_data.dta")

print("✅ Cleaning complete!")
