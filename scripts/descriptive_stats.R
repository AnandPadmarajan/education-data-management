library(dplyr)
library(readr)

# Load cleaned data
cleaned <- read_csv("data/cleaned_data.csv")

# Frequency table: indicators
table(cleaned$indicator_name)

# Summary statistics for one indicator (e.g., Primary Enrollment Rate)
primary <- cleaned %>% filter(indicator_code == "SE.PRM.TENR")
primary_summary <- summary(primary$value)
# Convert named vector to data frame
primary_summary_df <- data.frame(statistic = names(primary_summary),
                                 value = as.numeric(primary_summary))
write.csv(primary_summary_df, "data/primary_summary.csv", row.names = FALSE)
print("Stats complete and saved to primary_summary.csv")
