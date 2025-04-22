library(readxl) #packages like app giving access to functions
Scooby <- read_excel("C:/R Data/scoobydoo.xlsx") #good

View(Scooby)

install.packages("tidyverse") #good
library(tidyverse) #good
#── Attaching core tidyverse packages ───────────────────────────────────────────────────────── tidyverse 2.0.0 ──
#* ✔ dplyr     1.1.4     ✔ readr     2.1.5
#✔ forcats   1.0.0     ✔ stringr   1.5.1
#* ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
#✔ lubridate 1.9.4     ✔ tidyr     1.3.1
#✔ purrr     1.0.4  
#* is common R standards




mean(scoobydoo$run_time)

mean(scoobydoo$imdb, na.rm = TRUE)    #take the data points of 0 out of calc

glimpse(scoobydoo)

data()

view(mpg)
?mpg
?mean

glimpse(mpg)

filter(mpg, cty >= 20)

mpg_efficient <- filter(mpg, cty >=20)
View(mpg_efficient)

mpg_ford <- filter(mpg, manufacturer == "ford")
view(mpg_ford)


mpg_metric <- mutate(mpg, cty_metric = 0.425144 * cty)
glimpse(mpg_metric)

#%>% or pipe uses the value/dataset passes to the next arg. as the first 
mpg_metric <- mpg %>%
  mutate(cty_metric = 0.425144 * cty)
view(mpg)

mpg %>% #take data and group by column: class, provide mean and median
  group_by(class) %>% 
  summarise(mean(cty),
            median(cty))

#grammar of graphics - Data vis with ggplot
ggplot(mpg, aes(x=cty)) + 
  geom_histogram() + 
  geom_freqpoly() +
  #geom_point() +
  labs(x= 'City Mileage')

ggplot(mpg, aes(x=cty, 
       y = hwy)) + 
  geom_point() +
  labs(x= 'City Mileage')
