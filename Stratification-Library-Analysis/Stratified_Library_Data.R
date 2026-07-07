# ---- Project information ----
# WAC Bennett Library Book Estimate Using Stratified Random Sampling
# EVSC 445: Environmental Data Analysis
# Date: 2025-09-25

# Estimating the total number of books in SFU's WAC Bennett Library using
# design-based stratified random sampling.

# ---- 1. Load dataset ----

# Sampled number of books per shelf row from each library floor
library_data <- data.frame(
  floor4 = c(38, 25, 27, 29, 42, 33, 11),
  floor5 = c(40, 40, 48, 41, 39, 34, 37),
  floor6 = c(14, 22, 42, 31, 41, 35, 17)
)

library_data


# ---- 2. Define sampling design ----

# Stratification:
# Each library floor represents one stratum
# Strata: Floor 4, Floor 5, Floor 6

# Sampling unit:
# Individual rows of bookshelves

# ni = sampled bookshelf rows per stratum
ni <- c(
  floor4 = 7,
  floor5 = 7,
  floor6 = 7
)

ni


# Total number of bookshelf rows within each stratum
# Calculated from:
# (number of bookshelf sides × rows per shelf - empty rows) × number of shelves

Ni <- c(
  floor4 = (2 * 7 * 7 - 2) * 149,
  floor5 = (2 * 7 * 7 - 2) * 136,
  floor6 = (2 * 10 * 6 - 2) * 119
)

Ni


# ---- 3. Sampling intensity ----

# Percentage of bookshelf rows sampled from each floor

sampling_fraction <- (ni / Ni) * 100

sampling_fraction


# ---- 4. Estimate stratum means ----

# Mean number of books per sampled shelf row

stratum_mean <- apply(
  library_data,
  2,
  mean
)

stratum_mean


# Standard deviation within each stratum

stratum_sd <- apply(
  library_data,
  2,
  sd
)

stratum_sd


# Standard error of mean using finite population correction

stratum_se <- stratum_sd / sqrt(ni) *
  sqrt(1 - ni / Ni)

stratum_se


# ---- 5. Estimate total number of books per stratum ----

# Estimated total books:
# Estimated mean × total bookshelf rows

stratum_total <- stratum_mean * Ni

stratum_total


# Standard error of estimated totals

stratum_total_se <- Ni * stratum_se

stratum_total_se


# ---- 6. Estimate grand total library books ----

# Sum estimated totals across all floors

grand_total <- sum(stratum_total)

grand_total


# Combined standard error across strata

grand_se <- sqrt(sum(stratum_total_se^2))

grand_se


# ---- 7. Calculate 95% confidence interval ----

# Degrees of freedom based on total sample size

df <- sum(ni - 1)

df


# t critical value

t_critical <- qt(
  0.975,
  df = df
)

t_critical


# Confidence interval

CI_lower <- grand_total - t_critical * grand_se

CI_upper <- grand_total + t_critical * grand_se


CI <- c(
  lower = CI_lower,
  upper = CI_upper
)

CI


# ---- 8. Summary results ----

results <- list(
  stratum_means = stratum_mean,
  stratum_SE = stratum_se,
  stratum_totals = stratum_total,
  stratum_total_SE = stratum_total_se,
  grand_total = grand_total,
  grand_SE = grand_se,
  confidence_interval = CI
)

results