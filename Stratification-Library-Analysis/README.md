<img width="650" height="238" alt="image" src="https://github.com/user-attachments/assets/6c9c1019-250d-4508-9488-3aef28b31256" />


# WAC Bennett Library Book Estimate Using Stratified Random Sampling

A design-based R analysis estimating the total number of books in Simon Fraser University's WAC Bennett Library using stratified random sampling.

## Assignment Description

Libraries contain millions of books, making complete enumeration of all books impractical. This assignment estimates the total number of books located on the accessible floors of SFU's WAC Bennett Library using a probability-based sampling design.

A stratified random sampling approach was implemented, where each library floor was treated as a separate stratum. The number of books per bookshelf row was sampled within each floor and used to estimate stratum-level and library-wide totals.

## Purpose of Stratified Sampling

The primary objective of this assignment was to understand the importance of stratification as a sampling methodology. Stratified sampling improves estimates by dividing a heterogeneous population into smaller, more similar groups (strata) before sampling.

In this study, each library floor was treated as a separate stratum because differences in bookshelf layout, density, and configuration could influence the number of books per shelf row. By sampling within each floor independently, variation between floors was accounted for rather than treating the entire library as one uniform population.

This approach demonstrates how selecting an appropriate sampling design can improve the accuracy and interpretation of population estimates. Stratification is commonly used in environmental research, ecological surveys, and other large-scale sampling studies where populations contain distinct groups with different characteristics.

## Research Question

How many books are estimated to be present on floors 4, 5, and 6 of the WAC Bennett Library?

## Sampling Design

### Stratification

The library was divided into three strata:

- Floor 4
- Floor 5
- Floor 6

Each floor was analyzed separately because bookshelf density and configuration differed among floors.

### Sampling Unit

The sampling unit was an individual row of books on a bookshelf.

### Sampling Frame

The sampling frame consisted of all bookshelf rows available on each floor.

Estimated population sizes were:

| Stratum | Population size (Nᵢ) |
|---|---:|
| Floor 4 | 14,304 bookshelf rows |
| Floor 5 | 13,056 bookshelf rows |
| Floor 6 | 14,042 bookshelf rows |

### Sampling Method

Seven bookshelf rows were sampled from each floor.

The sample sizes were:

| Stratum | Sample size (nᵢ) |
|---|---:|
| Floor 4 | 7 |
| Floor 5 | 7 |
| Floor 6 | 7 |

Finite population correction was applied when calculating standard errors.

## Analytical Approach

Estimated stratum means using sampled bookshelf rows  
Calculated standard errors using finite population correction  
Expanded stratum means to estimate total books per floor  
Combined stratum estimates to calculate total library books  
Calculated a 95% confidence interval using a t-distribution  

All analyses were completed in R.

## Key Results

### Estimated Mean Books per Shelf Row

| Floor | Mean books per row | SE |
|---|---:|---:|
| Floor 4 | 29.29 | 3.81 |
| Floor 5 | 39.86 | 1.62 |
| Floor 6 | 28.86 | 4.28 |

### Estimated Number of Books by Floor

| Floor | Estimated total books | SE |
|---|---:|---:|
| Floor 4 | 418,903 | 54,474 |
| Floor 5 | 520,375 | 21,206 |
| Floor 6 | 405,212 | 60,143 |

## Estimated Library Total

The estimated total number of books across floors 4, 5, and 6 was:

**1,344,490 books**

The estimated standard error was:

**135,822 books**

The 95% confidence interval was:

**1,059,138 – 1,629,841 books**

This suggests that the true number of books on these floors is likely within this range based on the sampling design.

## Sources of Bias and Limitations

Several sources of bias may influence the accuracy and precision of this estimate.

The most obvious source of bias is that books are regularly checked out of the library. Since only books physically present on shelves were counted, the estimate likely underestimates the total collection size.

The sample size was also very small, with only seven bookshelf rows sampled per floor. Although stratification accounted for differences among floors, the sample may not fully represent variation in bookshelf density throughout the library. This primarily reduces precision because fewer samples provide a less reliable estimate of variability.

Another limitation was that bookshelf rows were not selected using a completely random procedure. Rows were selected manually rather than through a random selection process, which may introduce selection bias and affect both accuracy and precision.

The calculation also assumed consistent bookshelf structure, including two bookshelf sides and a constant number of empty rows. However, empty spaces varied among shelves, potentially causing overestimation or underestimation.

Finally, Floor 6 had a different bookshelf configuration compared with Floors 4 and 5, requiring different assumptions about shelf height and row counts. This difference may contribute additional uncertainty to the estimate.

## Data and Code Availability

The full R script used for this analysis is available in this repository.

The dataset (`library_data`) contains bookshelf row counts collected during the EVSC 445 sampling exercise.
