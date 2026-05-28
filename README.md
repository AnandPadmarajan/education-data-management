# education-data-management

A reproducible R pipeline for cleaning, reshaping, and analyzing World Bank Education Statistics (EdStats).  
This project demonstrates data wrangling, tidyverse workflows, and exporting results to multiple formats (CSV, Stata).

---

## 📂 Project Structure
```
education-data-management/
├── data/
│   ├── EdStatsData.csv              # raw dataset (not included because it is large. A sample data with 100 rows are added)
│   ├── cleaned_data.csv             # cleaned output
│   ├── cleaned_data.dta             # Stata format output
│   └── summary_stats.csv            # descriptive statistics output
├── scripts/
│   ├── clean_data.R                 # cleaning + reshaping pipeline
│   └── descriptive_stats.R          # frequency tables + summaries
└── README.md
```

---

## Usage

### 1. Run Cleaning Script
```bash
Rscript scripts/clean_data.R
```
- Cleans messy column names  
- Reshapes wide → long format  
- Handles missing values  
- Exports cleaned dataset to CSV and Stata

### 2. Run Statistics Script
```bash
Rscript scripts/descriptive_stats.R
```
- Frequency table of indicators  
- Summary statistics for selected indicators  
- Exports results to `summary_stats.csv`

---

## 📊 Example Output
- **Cleaned dataset**: 1000 rows × 70 columns reshaped into tidy format  
- **Frequency table**: counts of indicators  
- **Summary stats**: mean, min, max for Primary Enrollment Rate (`SE.PRM.TENR`)

---

## 🛠 Dependencies
Install required R packages:
```r
install.packages(c("readr", "dplyr", "tidyr", "haven", "janitor"))
```

---

## 🌍 Data Source
World Bank Education Statistics (EdStats) — World Bank Data Catalog [https://datacatalog.worldbank.org/search/dataset/0038480/education-statistics]

---

## ✅ Project Highlights
- Data cleaning with `janitor::clean_names()`  
- Reshaping using `tidyr::pivot_longer()`  
- Descriptive statistics with `dplyr`  
- Export to CSV and Stata formats  


