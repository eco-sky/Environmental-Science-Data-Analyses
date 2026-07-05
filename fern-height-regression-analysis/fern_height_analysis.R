# ---- Project information ----
# Fern Height Regression Analysis
# EVSC 445: Environmental Data Analysis
# Date: 2025-10-26

# Analyzing environmental factors influencing fern height on Burnaby Mountain

# ---- 0. Setup ----
# Load required package
if (!require(readxl)) install.packages("readxl")
library(readxl)


# ---- 1. Load dataset ----

Fern_data <- read_excel("data/Fert Height.xlsx")

# ---- 2. Data preparation ----
# Convert categorical variables to factors
Fern_data$nearest_tree <- as.factor(Fern_data$nearest_tree)
Fern_data$mushrooms_01 <- as.factor(Fern_data$mushrooms_01)

# ---- 3. Multiple Linear Regression ----
full_model <- lm(
  fern_height_cm ~ dist_from_path_cm +
    dist_from_fern_cm +
    light_lumens +
    pH +
    mushrooms_01 +
    nearest_tree,
  data = Fern_data
)

summary(full_model)

# ---- 4. Analysis of Variance ----
anova(full_model)

# ---- 5. Residual diagnostics ----
residuals_model <- resid(full_model)

# Residuals vs distance from path (X1)
plot(
  Fern_data$dist_from_path_cm,
  residuals_model,
  xlab = "Distance from Path (cm)",
  ylab = "Residuals",
  main = "Residuals vs Distance from Path"
)
abline(h = 0, col = "purple")

# Residuals vs distance from nearest fern (X2)
plot(
  Fern_data$dist_from_fern_cm,
  residuals_model,
  xlab = "Distance from Nearest Fern (cm)",
  ylab = "Residuals",
  main = "Residuals vs Distance from Nearest Fern"
)
abline(h = 0, col = "orange")

# Residuals vs light (X3)
plot(
  Fern_data$light_lumens,
  residuals_model,
  xlab = "Light (lumens)",
  ylab = "Residuals",
  main = "Residuals vs Light"
)
abline(h = 0, col = "green")

# ---- 6. Correlation analysis ----
continuous_vars <- Fern_data[, c(
  "dist_from_path_cm",
  "dist_from_fern_cm",
  "light_lumens"
)]

cor(continuous_vars)

# Pairwise scatterplots
pairs(continuous_vars)

# ---- 7. Null model ----
null_model <- lm(
  fern_height_cm ~ 1,
  data = Fern_data
)

# ---- 8. Forward stepwise selection ----
forward_model <- step(
  null_model,
  scope = list(
    lower = ~1,
    upper = formula(full_model)
  ),
  direction = "forward"
)

summary(forward_model)

# ---- 9. Model comparison ----
AIC(full_model, forward_model)
