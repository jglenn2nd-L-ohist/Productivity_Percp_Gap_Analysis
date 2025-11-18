
The Productivity Perception Gap: Screen Time, Sleep, and Self-Assessment
1. Business Question
This project aimed to investigate the relationship between night-time habits (Screen Time before bed and total Sleep Hours) and the accuracy of self-assessed productivity. The core question was: Do poor sleep habits lead individuals to significantly over- or under-estimate their actual daily output?
2. Methodology: An End-to-End Analytical Workflow
This analysis was performed using a sequential, three-tool workflow, demonstrating proficiency across the standard data analyst stack:
SQL (Initial Cleaning & Structuring): The raw "Social Media vs. Productivity" dataset was imported, where initial data quality checks were conducted, and data types were standardized.
R Studio (Feature Engineering & Statistical Validation):
Feature Creation: The target variable, Productivity Gap (calculated as Perceived Productivity Score – Actual Productivity Score), was engineered. This variable quantified the self-perception bias (a positive value indicates over-estimation).
Multiple Linear Regression (MLR): An MLR model was run to test the statistical significance of categorized Screen Time and Sleep Hours on the Productivity Gap.
Tableau (Visualization & Communication): The final, validated results were visualized to communicate the core finding and the outcomes of the hypothesis test.
3. Key Findings
Finding 1: The Significant Baseline of Over-Estimation
The single most significant finding was the baseline level of self-perception bias.
Result: The model's (Intercept) was $0.609$ ($p < 2e-16$), meaning the average person in the dataset, regardless of their sleep or screen time habits, over-estimates their productivity by approximately $0.61$ points on a 10-point scale.
Insight: This suggests a universal bias in self-assessment, where human perception of productivity is generally inflated compared to objective output. This highly significant finding is the core takeaway of the analysis.
Finding 2: Screen Time and Sleep are Not Significant Drivers
The hypothesis that poor sleep habits predict the productivity gap was not supported by the data.
Result: All coefficients for the screen_time_category and sleep_hours_category variables had high $p$-values (ranging from $0.221$ to $0.931$).
Insight: This demonstrates that, for this population, the difference in the amount of screen time before bed or the duration of sleep does not statistically influence the degree to which a person over-estimates or under-estimates their productivity. The factor driving the gap lies outside of these variables.
4. Conclusion & Recommendations
While the independent variables of screen time and sleep did not prove to be statistically meaningful predictors of the Productivity Gap, the analysis successfully validated a strong, inherent bias toward over-estimation in the general population.
Recommendations for Next Steps:
Investigate Deeper Factors: The low Adjusted R-squared ($\approx 0.00004$) suggests that a vast majority of the variance in the Gap is driven by unmeasured variables. Further analysis should explore factors like Stress Level, Job Satisfaction, or Day of the Week to find a stronger predictor.
Focus on Intervention: Since the baseline bias is significant, any intervention aimed at improving self-assessment accuracy should address the psychological tendency to over-estimate, rather than exclusively focusing on habit correction.
