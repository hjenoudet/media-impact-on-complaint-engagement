# Media Impact on Complaint Engagement
# Author: Henri Jenoudet
# Date: 2025-03-05
#
# This script analyzes how visual media influences customer complaint engagement.
# It employs correlation analysis, OLS regressions, and IV regressions in R to assess if videos yield higher engagement than pictures, and whether posts featuring customers differ from those featuring offenders.
# Load required packages
library(ggplot2)
library(ivreg)

# Load the data from the data folder
load("data/media-impact-on-complaint-engagement.RData")

# Inspect the data structure and summary
str(IGdata)
summary(IGdata)

# ---------------------------
# Correlation Analysis: SelfPct vs. FeatureSelf
# ---------------------------

# Plot FeatureSelf vs. SelfPct
plot1 <- ggplot(data = IGdata, aes(x = SelfPct, y = FeatureSelf)) +
  geom_point() +
  geom_smooth(method = "loess") +
  labs(title = "Figure 1. FeatureSelf vs SelfPct", x = "SelfPct", y = "FeatureSelf")
print(plot1)

# Calculate and print correlation
corr1 <- cor(IGdata$SelfPct, IGdata$FeatureSelf)
cat("Correlation (SelfPct, FeatureSelf):", corr1, "\n")

# Run linear regression and display summary
Table1 <- lm(FeatureSelf ~ SelfPct, data = IGdata)
cat("Linear Model: FeatureSelf ~ SelfPct\n")
print(summary(Table1))

# ---------------------------
# Correlation Analysis: Photography vs. Video
# ---------------------------

# Plot Video vs. Photography
plot2 <- ggplot(data = IGdata, aes(x = Photography, y = Video)) +
  geom_point() +
  geom_smooth(method = "loess") +
  labs(title = "Figure 2. Video vs Photography", x = "Photography", y = "Video")
print(plot2)

# Calculate and print correlation
corr2 <- cor(IGdata$Photography, IGdata$Video)
cat("Correlation (Photography, Video):", corr2, "\n")

# Run linear regression and display summary
Table2 <- lm(Video ~ Photography, data = IGdata)
cat("Linear Model: Video ~ Photography\n")
print(summary(Table2))

# ---------------------------
# OLS Regressions
# ---------------------------

# OLS regression for IGLikes
Table3 <- lm(IGLikes ~ Followers + LengthChar + Video + FeatureSelf + Photography + SelfPct, data = IGdata)
cat("OLS Regression for IGLikes:\n")
print(summary(Table3))

# OLS regression for IGComments
Table4 <- lm(IGComments ~ Followers + LengthChar + Video + FeatureSelf + Photography + SelfPct, data = IGdata)
cat("OLS Regression for IGComments:\n")
print(summary(Table4))

# ---------------------------
# Instrumental Variable Regressions
# ---------------------------

# IV regression for IGLikes
Table5 <- ivreg(IGLikes ~ Followers + LengthChar | Video + FeatureSelf | Photography + SelfPct, data = IGdata)
cat("IV Regression for IGLikes:\n")
print(summary(Table5))

# IV regression for IGComments
Table6 <- ivreg(IGComments ~ Followers + LengthChar | Video + FeatureSelf | Photography + SelfPct, data = IGdata)
cat("IV Regression for IGComments:\n")
print(summary(Table6))

# End of analysis.