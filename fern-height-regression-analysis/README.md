<img width="971" height="792" alt="image" src="https://github.com/user-attachments/assets/373dbb03-739a-4f8c-9178-2dc764bf954e" />

# Fern Height Regression Analysis

This analysis investigates how environmental conditions and local biotic factors influence fern height using multiple linear regression and stepwise model selection.

This analysis was completed as part of EVSC 445: Environmental Data Analysis.

## Overview

Ferns growing on Burnaby Mountain were measured to evaluate how environmental gradients and local ecological interactions affect plant height. The goal of this analysis is to build and interpret a predictive model of fern height using both continuous and categorical environmental variables.

## Research Question

How do distance from paths, distance from other ferns, light availability, soil pH, mushroom presence, and surrounding tree species influence fern height?

## Field Data Collection

Data were collected during an outdoor field laboratory on Burnaby Mountain. Students worked in groups of 3 to 5 and used standardized sampling methods to measure fern height and environmental characteristics at randomly selected fern locations.

Measurements included:

- Fern height using tape measures
- Distance to nearest path using tape measures
- Distance to nearest neighbouring fern using tape measures
- Light intensity using smartphone lux meter applications
- Soil pH measurements
- Presence or absence of mushrooms within 5 metres
- Identification of the nearest tree species

Data collected by all groups were combined into a single class dataset that was subsequently used for statistical analysis.

## Data Description

The final dataset contains 57 observations collected by multiple student groups during a field laboratory exercise on Burnaby Mountain and later combined into a single class dataset for analysis.

Variables include:

- Fern height (response variable)
- Distance from nearest path
- Distance from nearest fern
- Light intensity (lumens)
- Soil pH
- Presence of mushrooms within 5 m (0/1)
- Nearest tree species (categorical)

## Analytical Approach

- Summary statistics using `summary()`
- Multiple linear regression using `lm()`
- Model significance testing using `anova()`z
- Residual diagnostics to evaluate assumptions
- Multicollinearity assessment using `cor()` and `pairs()`
- Forward stepwise model selection using AIC (`step()`)

## Assumptions

- Linear relationships between predictors and response
- Independent observations
- Approximately constant variance of residuals
- Normally distributed residuals (evaluated visually)

## Key Findings

- The full model explains approximately **21.6% of variation** in fern height (adjusted R² ≈ 0.216).
- The overall regression model is statistically significant (p ≈ 0.012 at α = 0.10).
- Distance from path shows a weak positive relationship with fern height, but is not strongly significant in the full model.
- Tree species (especially Red Alder) shows a noticeable positive association with fern height.
- Light intensity showed non-constant variance in residuals, suggesting heteroscedasticity.
- Predictor correlations were generally low (maximum r ≈ 0.36), indicating no serious multicollinearity.

## Model Performance

The full regression model contained 56 total degrees of freedom (dfT = 56), consisting of 9 model degrees of freedom and 47 residual degrees of freedom.

The full multiple linear regression model had an adjusted R² of 0.216, indicating that approximately 21.6% of the variation in fern height was explained by the measured environmental variables.

An overall F-test indicated that the regression model was statistically significant (p = 0.012), suggesting that at least one predictor variable contributed meaningfully to explaining variation in fern height.

## Interpretation of Distance from Path

Distance from the nearest path showed a positive coefficient estimate of approximately 0.0405 cm per centimetre.

This indicates that, according to the model, fern height is predicted to increase by approximately 0.0405 cm for every additional centimetre away from a path, while holding all other variables constant.

However, this relationship was not statistically significant in the full model (p = 0.125), meaning there is insufficient evidence to conclude that distance from paths has a strong effect on fern height within this dataset.

## Stepwise Model Selection Results

Forward stepwise model selection using Akaike Information Criterion (AIC) was performed to identify a more parsimonious model.

The reduced model retained distance from path and nearest tree species while removing several weaker predictors. Coefficient estimates remained generally consistent between the full and reduced models, suggesting that the retained predictors captured most of the explanatory information present in the original model.

Several retained variables showed improved statistical support after model simplification. For example, the estimated effect of Red Alder increased and became more statistically significant in the reduced model.

The stepwise model demonstrated that some variables may contribute useful explanatory information even when individual coefficient p-values are not strongly significant.

### Full vs Forward Model Comparison

The coefficients for variables included in both the full and forward models showed consistent direction and similar magnitudes. The effect of distance from path remained positive and increased slightly from 0.0405 in the full model to 0.0408 in the forward model, while its p-value decreased from 0.125 to 0.075, suggesting a stronger relationship after removing weaker predictors.

For tree species, similar patterns were observed. Ferns near Red Alder remained taller, with the estimate increasing from 24.09 to 26.16 and the p-value improving from 0.061 to 0.026 in the forward model. Vine maple continued to show a small, non-significant positive effect, decreasing from 11.90 to 7.07. Western Hemlock and Western Red Cedar both maintained negative effects, with Hemlock changing from -13.66 to -18.84 and Cedar shifting from -18.89 to -19.82.

Overall, the forward model produced slightly more stable coefficient estimates and improved statistical support for key predictors, suggesting that removing weaker variables such as light, pH, and mushrooms helped clarify underlying relationships.

### Interpretation of Retained Non-Significant Predictors

In some cases, stepwise selection retained variables that were not statistically significant in the forward model. For example, distance from path (p = 0.075) and Western Hemlock as a tree category (p = 0.058) remained in the model despite marginal p-values.

This occurs because AIC-based selection evaluates overall model fit and predictive performance rather than individual coefficient significance. As a result, variables that are weak individually may still improve overall model performance when considered jointly with other predictors.

## Tree Species Effects

Nearest tree species emerged as one of the most influential predictor groups in the analysis.

Ferns located near Red Alder tended to be taller than those associated with the reference tree category, suggesting that local vegetation composition may influence growing conditions such as nutrient availability, competition, or light environments.

Western Hemlock and Western Red Cedar generally showed negative coefficient estimates relative to the reference category, indicating potential differences in habitat conditions associated with those species.

## Ecological Interpretation

Fern height appears to be influenced by a combination of environmental gradients and local biotic interactions.

- Increased distance from paths may reflect reduced disturbance, potentially allowing slightly taller ferns.
- Tree species composition may influence light competition and soil conditions.
- Light availability alone does not fully explain variation in height, suggesting other ecological factors are important.

Overall, fern height is likely controlled by multiple interacting environmental factors rather than a single dominant variable.

## Residual Diagnostics

- Residuals vs distance from path: approximately unbiased and homoscedastic
- Residuals vs distance from fern: no clear pattern, constant variance
- Residuals vs light: increasing variance suggests heteroscedasticity

These results indicate that the model assumptions are partially met, but variance instability exists for some predictors.

## Predictor Correlation Assessment

Correlations among the continuous predictor variables were assessed using `cor()` and visualized using `pairs()`.

The strongest observed correlation was between distance from path and distance from nearest fern (r = 0.359).

This correlation is considered weak to moderate and is not large enough to raise concerns about multicollinearity. Highly correlated predictors can provide overlapping information and inflate coefficient uncertainty, but the observed relationship was well below commonly used concern thresholds (e.g., |r| > 0.7).

The scatterplot matrix also showed substantial dispersion around the trend rather than a near-linear pattern, further supporting the conclusion that multicollinearity was not a major issue in this analysis.

<img width="1920" height="975" alt="image" src="https://github.com/user-attachments/assets/55d87392-ea16-448a-aa12-dc89123ddcbd" />


## Conclusion

This analysis demonstrates that fern height is influenced by a combination of environmental and ecological factors, but the overall predictive power of the model is moderate.

While some variables show statistically significant effects, a large portion of variation in fern height remains unexplained, suggesting additional ecological complexity.

## Data and Code Availability

This work was completed as part of an outdoor field laboratory for EVSC 445: Environmental Data Analysis on Burnaby Mountain, British Columbia.

As part of the lab, students worked in small groups to collect field measurements from randomly selected ferns using standardized sampling protocols. Measurements included fern height, distance from the nearest path, distance from the nearest fern, sunlight intensity measured using a mobile light meter application, presence or absence of nearby mushrooms or fungi, soil pH, and identification of the nearest tree species. Fern height and distance measurements were collected using tape measures, while light intensity was recorded using smartphone-based lux meter applications.

Each student group collected approximately 20 observations during the field exercise. After field sampling was completed, data from all groups were combined into a single standardized class dataset and distributed to all students for analysis.

The dataset used in this repository was derived from this combined class dataset. Therefore, while I participated in collecting a portion of the original field measurements, I did not individually collect all observations contained in the final dataset. The complete dataset represents the collaborative effort of multiple student groups participating in the course laboratory exercise.

The file used for analysis in this repository is `Fern Height.xlsx`.

All R code used for data analysis, model fitting, model selection, residual diagnostics, and correlation assessment is included in this repository to support transparency and reproducibility.

## Notes

This is an exploratory ecological modelling assignment conducted for coursework.

Results should be interpreted as correlational rather than causal.
