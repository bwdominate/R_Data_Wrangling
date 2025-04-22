install.packages("tidyverse")

data()

view(mpg)
?mpg
?mean

glimpse(mpg)

filter(mpg, cty >= 20)

mpg_efficient <- filter(mpg, cty >=20)
View(mpg_efficient)
