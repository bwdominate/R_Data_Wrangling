install.packages("tidyverse")
library(tidyverse)
?diamonds
View(diamonds)

#subset by row with filter() _______________

diamonds_sm <- filter(diamonds, 
                      cut == "Ideal", #and
                      price > 10000)
View(diamonds_sm)

diamonds_sm <- filter(diamonds, 
                      cut == "Ideal" |  #OR
                      price > 10000)
View(diamonds_sm)

# filter for missing values using is.na or !is.na




#subset by column with select() _____________________

diamonds_sm <- select(diamonds, color, cut)
View(diamonds_sm)

diamonds_sm <- select(diamonds, 1:4)
View(diamonds_sm)

diamonds_sm <- select(diamonds, starts_with("c"))
diamonds_sm <- select(diamonds, contains("c"))
View(diamonds_sm)

diamonds_sm <- select(diamonds, 
                      price, everything()) #data set starting with price then.
View(diamonds_sm)

diamonds_sm <- select(diamonds,-price) #data set without price column
View(diamonds_sm)
#rewrite using pipe subject, verb, object order- ctr-shift-m to get pipe

diamonds_sm <- diamonds %>%
  select(-price)
  
  
#reorder rows with arrange() rows in order____________________________
diamonds_arr <- diamonds
diamonds_arr <- diamonds %>% 
  arrange(color)
view(diamonds_arr)

diamonds_arr <- diamonds %>% 
  arrange(color,
          carat)
view(diamonds_arr)

diamonds_arr <- diamonds %>% 
  arrange(desc(color))
view(diamonds_arr)

glimpse(diamonds_arr)

#add or modify columns with mutate() ___________________

diamonds_new <- diamonds %>% 
  mutate(mass_g = .20 * carat)
glimpse(diamonds_new)

diamonds_new <- diamonds %>% 
  mutate(mass_g = .20 * carat,
         price_per_carat = price / carat)
glimpse(diamonds_new)

diamonds_new <- diamonds %>% 
  mutate(mass_g = .20 * carat,              #add new column mass_g
         price_per_carat = price / carat,   #add new col dividing price/carat
         cut = tolower(cut),                #make cut column lowercase
         expensive_TF = price > 10000)
glimpse(diamonds_new)

#other smaller verbs

?slice_max
?bind_rows
?left_join
?rename
?case_when

# grouped summaries with groupby() and summarize()

diamonds %>% 
  group_by(cut,
           color) %>% 
  summarize(avg_price = mean(price),
            sd_price = sd(price),
            count = n())

diamonds %>% 
  count(cut,
        color) #counts only

diamonds %>% 
  group_by(price > 10000) %>% 
             summarize(avg_price = mean(price),
                       sd_price = sd(price),
                       count = n())

diamonds %>% 
    group_by(expensive = price > 10000) %>% 
    summarize(avg_price = mean(price),
              sd_price = sd(price),
              count = n()) 






