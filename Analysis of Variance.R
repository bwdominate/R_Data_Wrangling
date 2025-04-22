#Analysis of Variance ANOVA
#Is weight independent from feed?

library(tidyverse)
view(chickwts)
?chickwts

ggplot(chickwts, aes(x = feed,
                     y = weight)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter() +
  theme_minimal()

model <- aov(chickwts$weight ~ chickwts$feed)
summary(model)
