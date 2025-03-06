# Media Impact on Complaint Engagement

**Project Description:**  
This R project investigates how visual media influences customer complaint engagement. It analyzes whether videos generate higher engagement than pictures and if posts featuring customers differ from those featuring offenders.

## Overview

This repository includes:
- **data/media-impact-on-complaint-engagement.RData:** The data file used in the analysis.
- **scripts/media-impact-on-complaint-engagement.R:** A plain R script with the analysis code.
- **README.md**
- **requirements.txt**

## How to Use

1. **Clone the Repository:**  
   ```bash
   git clone https://github.com/hjenoudet/media-impact-on-complaint-engagement.git
   ```
2. **Open the Project:**
Open the folder in RStudio or your preferred R environment.

3. **Install Required Packages:**
```{r}
install.packages(c("ggplot2", "ivreg"))
```
4. **Run the Analysis:**
Execute the script `scripts/media-impact-on-complaint-engagement.R` to perform the analysis.

## Project Details
**Data:**
The `media-impact-on-complaint-engagement.RData` file is loaded in the script, which contains engagement metrics for customer complaints, including media type indicators (Video, Photography) and content features (SelfPct, FeatureSelf).

**Core Analysis:**
The script performs correlation analysis, OLS regressions, and IV regressions to assess how visual media type influences engagement levels.

**Results:**
The analysis outputs regression summaries and correlation statistics, revealing whether video posts drive higher engagement than picture posts and if posts featuring customers differ from those featuring offenders.

## Contributing
If you’d like to contribute or report any issues, please open a Pull Request or file an Issue on this repository.

## Acknowledgments
I would like to thank Professor Mike Palazzolo (Assistant Professor of Marketing, UC Davis Graduate School of Management, Research Affiliate, Center for Poverty & Inequality Research) for their guidance and for allowing me to share this project. Their insights and support were invaluable in completing this analysis.
