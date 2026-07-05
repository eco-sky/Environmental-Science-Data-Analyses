<img width="1280" height="1023" alt="image" src="https://github.com/user-attachments/assets/b8010e0a-937e-4735-bd61-f546601ec699" />

# GLM Nest Cavity Poisson Regression Analysis

This project analyzes how environmental, structural, and biological factors influence bird nest counts in tree cavities using generalized linear models (GLMs) with a Poisson distribution.

This analysis was completed as part of EVSC 445: Environmental Data Analysis.

## Overview

Tree cavities provide critical nesting habitat for many bird species in forest ecosystems, particularly where natural hollows are limited. Many cavities are created by woodpeckers and later reused by secondary cavity-nesting species, making them an important component of forest biodiversity.

The goal of this analysis is to quantify how cavity structure, tree characteristics, excavator identity, and landscape context influence nest counts, while accounting for exposure time using an offset term.

A Poisson GLM is used because the response variable represents count data.

## Research Question

How do cavity structure, host tree characteristics, excavator species, and landscape position influence the number of bird nests in tree cavities?

## Data Description

Variables include:

- n_nests: number of nests recorded in each cavity (response variable)
- entrance_size_cm: diameter of cavity entrance (cm)
- cavity_depth_cm: internal cavity depth (cm)
- cavity_height_m: height above ground (m)
- tree_diameter_cm: diameter at breast height (DBH) of host tree (cm)
- dist_forest_edge_m: distance to forest edge (m)
- tree_species: species of tree containing the cavity (categorical)
- origin_species: species that originally excavated the cavity (categorical)
- log_years_avail: log transformed number of years the cavity has been available (used as an offset)

## Data Preparation

Categorical variables were re leveled to ensure ecologically meaningful reference categories. Trembling Aspen was used as the reference category for tree species due to its ecological prevalence. Northern Flicker was used as a reference excavator species for interpretation consistency.

## Analytical Approach

The analysis follows a generalized linear modeling framework appropriate for count data. The model was built using a Poisson GLM with a log link function, allowing the expected number of nests to be modeled as a function of ecological and structural predictors.

Key steps included:

- Data exploration using summary statistics and frequency tables  
- Factor releveling for categorical predictors  
- GLM fitting using Poisson family  
- Inclusion of an offset term to account for exposure time  
- Interpretation of coefficients on log and exponentiated scales  
- Prediction of expected nest counts for new cavity conditions  
- Evaluation of non linear effects using quadratic terms  
- Model comparison using AIC  

## Model Specification and Parameter Interpretation

The response variable represents the number of nests observed in a cavity:

n_nests ~ Poisson(λ)

The model assumes that the logarithm of the expected nest count is a linear function of predictors:

log(λ) = β0
        + β1(entrance_size_cm)
        + β2(cavity_depth_cm)
        + β3(cavity_height_m)
        + β4(tree_diameter_cm)
        + β5(dist_forest_edge_m)
        + β6(tree_species)
        + β7(origin_species)
        + offset(log_years_avail)

Where:

- β0 represents the intercept, corresponding to the expected log number of nests when all continuous predictors are zero, and when the cavity has been available for one year (since log(1) = 0)
- β1 through β5 represent the change in log expected nest count associated with a one unit increase in each continuous predictor, holding all other variables constant
- Categorical coefficients (tree_species and origin_species) represent differences relative to their respective reference categories
- The offset term is included with a fixed coefficient of 1 and accounts for differences in exposure time among cavities

In this formulation, the model estimates nest occurrence as a rate rather than a raw count, allowing cavities with different availability durations to be directly compared.

## Key Results

The model showed moderate explanatory power for nest counts, with a residual deviance of 1199.5 on 1183 degrees of freedom and an AIC of 4794.3.

Several significant predictors emerged:

- Distance to forest edge had a statistically significant negative effect (p = 0.0012), indicating lower nest abundance farther from forest edges
- Cavity depth was also significant (p = 0.033), suggesting deeper cavities support slightly higher nest counts
- Cavity height showed a marginal positive effect (p = 0.053)
- Several tree species and origin species significantly influenced nest counts, indicating strong biological structuring of cavity use

Tree diameter and its quadratic term were not significant, suggesting no detectable non linear relationship in this dataset.

## Model Comparison

A quadratic model including tree diameter squared was compared against the linear model:

| Model | df | AIC |
|------|----|------|
| Linear GLM | 16 | 4792.31 |
| Quadratic GLM | 17 | 4794.30 |

The quadratic model performed worse, with higher AIC and a non significant quadratic term (p = 0.93), indicating that added complexity did not improve model fit.

## Interpretation of Distance to Forest Edge

Distance from forest edge had a small but statistically significant negative effect on nest counts.

This suggests that cavities closer to forest edges tend to be used more frequently, potentially due to increased resource availability, habitat heterogeneity, or differences in bird activity patterns near edge environments.

## Prediction Example

A cavity with the following characteristics:

- Trembling Aspen tree  
- Excavated by Pileated Woodpecker  
- Entrance size: 8 cm  
- Depth: 50 cm  
- Height: 5 m  
- Tree diameter: 30 cm  
- Distance to forest edge: 10 m  
- Available for 1 year  

was predicted to contain approximately 0.40 nests per year under the fitted model.

## Non linearity Assessment

Tree diameter was evaluated for potential non linear effects using a quadratic term. Although ecological theory suggests that cavity suitability may increase and then plateau with tree size, the quadratic term was not statistically significant and did not improve model fit.

This indicates that a linear effect of tree diameter is sufficient for describing nest abundance in this dataset.

## Ecological Interpretation

Nest occupancy in tree cavities is influenced by a combination of structural and biological factors:

- Larger cavities may provide greater nesting space and protection  
- Edge proximity may influence food availability and habitat diversity  
- Tree species and excavator identity strongly influence cavity quality and reuse potential  
- Structural variables generally show linear effects within observed ranges  

Overall, cavity use reflects both habitat structure and ecological context rather than a single dominant driver.

## Model Limitations

- Poisson models assume equal mean and variance, which may not fully hold in ecological count data  
- Overdispersion was not explicitly tested  
- Unmeasured ecological variables such as predation or competition may influence nest counts  
- Results are correlational and do not imply causation  

## Data and Code Availability

The dataset (nest_data_bc.csv) was provided as part of EVSC 445: Environmental Data Analysis and represents a combined class dataset collected through structured field sampling. The data were used for instructional purposes only.

All R code used for analysis, modeling, and prediction is included in this repository for reproducibility.
