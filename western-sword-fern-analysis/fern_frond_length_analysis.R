# ---- Project information ----
# Western Sword Fern Analysis
# EVSC 445: Environmental Data Analysis
# Date: 2025-09-30

# Analyzing effects of tree type on fern frond length

# ---- 1. Load dataset ----

Fern_data <- read_excel("Fern Frond Length.xlsx")

names(fern_data)

# ---- 2. Data preparation ----
# Convert categorical variables to factors
fern_data$Tree_type <- as.factor(fern_data$Tree_type)
levels(fern_data$Tree_type)

# Convert response variable to numeric (if needed)
fern_data$Frond_length <- as.numeric(fern_data$Frond_length)

# ---- 3. Two-sample t-test ----
# Compare frond length between tree types
t_res <- t.test(Frond_length ~ Tree_type, data = fern_data)
t_res

# ---- 4. Basic summary ----
# Group means for interpretation
aggregate(Frond_length ~ Tree_type, data = fern_data, mean)
aggregate(Frond_length ~ Tree_type, data = fern_data, sd)
