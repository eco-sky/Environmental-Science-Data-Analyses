#  **Western Sword Fern Frond Length Analysis**

Simple R analysis of fern growth on Burnaby Mountain, BC examining whether tree type (deciduous vs coniferous) influences frond length.

This assignment was completed as part of EVSC 445: Environmental Data Analysis.

## **Assignment Description**

Ferns are effective indicators of micro-environmental conditions due to their sensitivity to light, moisture, soil properties, and temperature. This assignment investigates whether fern frond length differs between two habitat types: ferns growing under deciduous trees and ferns growing under coniferous trees.

Field data were collected on Burnaby Mountain, British Columbia, using simple random sampling of individual ferns.

## **Research Question**

Does tree type (deciduous vs coniferous) influence the mean frond length of ferns?

## **Hypotheses**

**Population parameter of interest:**

μdeciduous − μconiferous (mean difference in frond length)

**Null hypothesis (H₀):**

There is no difference in mean frond length between the two tree types.
H₀: μdeciduous = μconiferous

**Alternative hypothesis (Hₐ):**

There is a difference in mean frond length between the two tree types.
Hₐ: μdeciduous ≠ μconiferous

A two-sided test was used to evaluate whether any difference exists between groups.

## **Methods**

  **Data collection:** Fern frond lengths measured in the field on Burnaby Mountain, BC
  
  **Sampling design:** Simple random sampling of individual ferns within each tree type
  
  **Response variable:** Frond length
  
  **Predictor variable:** Tree type (deciduous vs coniferous)
  
  **Statistical analysis:** Two-sample t-test assuming independence and approximate normality within groups

## **Assumptions**

Observations were collected using simple random sampling
Each fern measurement is independent of others
Frond length within each group is approximately normally distributed

## **Results**

Test statistic: t = 0.447
Degrees of freedom: 17.53
Significance level: α = 0.05
p-value: 0.6603

Since the p-value is greater than α, there is insufficient evidence to reject the null hypothesis.

## **Interpretation**

The results indicate no statistically significant difference in mean fern frond length between deciduous and coniferous tree environments in this dataset.

This suggests that, within the limitations of the sample and assumptions of the test, tree type does not appear to influence fern frond length at the study site.

## **Conclusion**

This study examined whether forest type affects fern growth on Burnaby Mountain. Based on a two-sample t-test, no significant difference in mean frond length was observed between ferns growing under deciduous versus coniferous trees.

These findings are limited to the sample collected and assume independence and approximate normality of the data.

## **Data and Code Availability**

The R script used for the statistical analysis is included in this repository. Please refer to the file for the full analysis workflow.

## **Notes**

This is a simple exploratory statistical analysis completed for coursework
Data were collected in Burnaby Mountain, BC
Part of EVSC 445: Environmental Data Analysis
