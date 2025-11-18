# Productivity Perception Gap Analysis

Role: Junior Data Analyst — Portfolio project

Project summary
This is a compact case study exploring the gap between perceived productivity and measured productivity using event-level activity logs. The goal is to demonstrate the end-to-end data analysis process: data ingestion (SQL), cleaning & analysis (R), and storytelling & dashboards (Tableau).

Key skills demonstrated
- Data cleaning, transformation, and exploratory analysis (R, tidyverse)
- SQL for extraction and basic aggregation
- Visualization & dashboard design (Tableau)
- Statistical comparison and basic hypothesis thinking
- Reproducible analysis and documentation

Tools & technologies
- R (tidyverse, lubridate, DBI)
- SQL (any RDBMS; examples use SQLite for reproducibility)
- Tableau for dashboards
- Git & GitHub for version control and portfolio hosting

Highlights / Showcase
- Clear data pipeline: raw -> cleaned -> analysis -> visualization
- Simple reproducible scripts you can run locally (see R/01-data-prep.R and R/02-analysis.R)
- Small sample dataset included so reviewers can run the pipeline in minutes
- Screenshots of the Tableau dashboard are included under docs/figures (replace with your images)

One-line takeaway
In this sample analysis perceived productivity tends to be higher than measured productivity, with the biggest gaps in administrative work and meetings (see results and dashboards).

How to run (quick)
1. Clone:
   git clone https://github.com/jglenn2nd-L-ohist/Productivity_Percp_Gap_Analysis.git
   git checkout -b setup/jr-portfolio
2. Install R packages:
   install.packages(c("tidyverse", "lubridate", "DBI", "RSQLite"))
3. Run scripts:
   Rscript R/01-data-prep.R
   Rscript R/02-analysis.R
4. Open docs/figures for sample images, or open your Tableau workbook from tableau/ if provided.

Repository structure
- README.md                      : This file — project overview & quick start
- LICENSE                        : MIT license
- .gitignore                     : Ignore outputs and large data
- data/sample/                   : Small sample dataset to reproduce results
- R/                             : Reproducible R scripts (preparation + analysis)
- sql/                           : Example SQL queries (if applicable)
- tableau/                       : Tableau workbook or notes
- docs/figures/                  : Dashboard screenshots and static exports
- .github/                       : ISSUE & PR templates
- outputs/                       : Generated outputs (gitignored)

Contact / Author
Author: jglenn2nd-L-ohist — GitHub profile: https://github.com/jglenn2nd-L-ohist
