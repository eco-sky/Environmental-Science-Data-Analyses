<img width="4032" height="3024" alt="vecteezy_ripe-blackberries-in-a-garden-close-up_3432624" src="https://github.com/user-attachments/assets/4e40ca41-804a-486a-a697-11c04add1210" />

# European Dewberry (*Rubus caesius*) Correlation Analysis

Simple R analysis exploring correlations between plant growth traits and environmental variables in European dewberry populations.

This analysis was completed as part of EVSC 445: Environmental Data Analysis.

## Project Description

European dewberry (*Rubus caesius*) is an invasive plant species used to study relationships between plant growth traits and environmental conditions. This analysis investigates correlations between flowering characteristics, leaf area, and environmental variables such as soil moisture, canopy cover, and dewberry density.

## Research Question

Which plant traits and environmental variables are significantly correlated in European dewberry populations?

## Analytical approach

Summary statistics using `summary()`  
Pairwise visualization using `pairs()`  
Correlation testing using `cor.test()`  
Pairwise correlation matrix using `cor()`  
Coefficient of determination calculated from correlation values  
99% confidence interval estimation for key correlations  

## Assumptions

Relationships between variables are approximately linear  
Observations are independent  
Pearson correlation is appropriate for continuous variables  

## Key Findings

A moderate to strong positive correlation was observed between flowering branches and flowers per branch.  
Some environmental variables showed weak to moderate relationships with plant traits.  
Not all variable pairs were statistically significant.  
Approximately 37.5% of variation in flower production was explained by flowering branch number.  

The figure below shows the pairwise relationships among dewberry traits and environmental variables.

<img width="1536" height="736" alt="image" src="https://github.com/user-attachments/assets/8d245b0f-ef70-4513-b6c5-08e295e35c5a" />

## Ecological Interpretation and Hypotheses

Prior to examining the dataset, several causal relationships were hypothesized based on ecological principles of plant growth and invasive species dynamics.

It was hypothesized that European dewberry growth would be causally influenced by reproductive and vegetative traits, including the number of flowers per branch, the number of flowering branches, and leaf area. These traits are directly related to plant fitness and reproductive output, and increases in these variables are expected to contribute to greater growth, spread, and invasiveness.

Soil moisture was also expected to have a positive effect on plant growth due to its role in supporting water availability, nutrient uptake, and physiological performance. In addition, higher dewberry abundance was expected to be associated with greater local density, reflecting successful establishment and competitive dominance in suitable habitats.

## Exploratory Pattern Identification

After examining the pairwise scatterplot matrix, the strongest observed relationship was between flowering branches and flowers per branch. This relationship appears strongly positive and approximately linear, indicating a strong association between reproductive structure and reproductive output.

A second, weaker positive relationship was observed between flowering branches and dewberry cover. However, this relationship shows greater scatter and variability, suggesting a weaker correlation compared to the primary reproductive relationship.

These patterns suggest that reproductive traits tend to increase together, while relationships involving spatial coverage are more variable.

## Statistical Interpretation of Correlation Results

The correlation between flowering branches and flowers per branch was statistically significant (p < 0.05), indicating that the observed relationship is unlikely to have occurred by random chance.

The correlation coefficient (r = 0.613) indicates a moderate to strong positive linear relationship, meaning that plants with more flowering branches also tend to produce more flowers per branch.

The coefficient of determination (R² = 0.375) indicates that approximately 37.5% of the variation in flowers per branch can be explained by variation in flowering branch number.

This relationship is biologically plausible because plants with greater reproductive investment often exhibit higher floral production and branching capacity.

However, this does not imply causation. The relationship may be influenced by underlying factors such as plant size, nutrient availability, genetic variation, or environmental conditions.

## Confidence Interval Interpretation

The 99% confidence interval for the correlation between flowering branches and flowers per branch was (0.442, 0.740). This indicates that we are 99% confident that the true population correlation lies within this range.

This interval confirms that the relationship is consistently positive and moderately strong under a conservative confidence level.

## Additional Correlation Findings

A statistically significant relationship was observed between flowering branches and dewberry cover. This was determined using `cor.test` in R, where p < 0.05 and r = 0.43, indicating a moderate positive relationship.

Biologically, this relationship is expected because areas with more reproductively active plants tend to have higher overall plant density and greater ground coverage, reflecting successful establishment and spread.

In contrast, no statistically significant relationship was found between canopy cover and dewberry cover. This was determined using `cor.test`, where r = 0.009 and p = 0.921.

Ecologically, this suggests that canopy cover is not a strong limiting factor for dewberry distribution in this dataset. Dewberry plants grow at ground level and can tolerate a wide range of light conditions, meaning that their abundance is more strongly influenced by other environmental drivers such as soil moisture, disturbance, or competition.

## Data and Code Availability

The full R script used for this analysis is included in this repository.

The dataset (`dewberries.csv`) was provided as part of the EVSC 445: Environmental Data Analysis course and was distributed to all students for instructional purposes. I did not create or collect this dataset. I acknowledge its use as a shared class resource for this assignment.

## Notes

This is an exploratory statistical analysis completed for coursework.  
All analyses were conducted in R.  
Results are based on a single dataset and should be interpreted within the limitations of sampling and correlation-based methods.
