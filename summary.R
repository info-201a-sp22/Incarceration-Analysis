library(dplyr)
library(ggplot2)


prison_jail_small_wa <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-prison-jail-rates-1990-WA.csv", stringsAsFactors = FALSE)

summary <- list()
options(scipen = 999)
#What was the average total jail population rate in Washington in 1990?

summary$avg_1990 <- prison_jail_small_wa %>% 
  filter(year == 1990) %>% 
  summarize(avg_1990 = mean(total_jail_pop_rate, na.rm = TRUE)) %>% 
  pull(avg_1990)

#How about in 2018?

summary$avg_2018 <- prison_jail_small_wa %>% 
  filter(year == 2018) %>% 
  summarise(avg_2018 = mean(total_jail_pop_rate, na.rm = TRUE)) %>% 
  pull(avg_2018)

#What was the the overall highest black jail population rate?

summary$highest_black_rate <- prison_jail_small_wa %>% 
  summarise(highest_black_rate = max(black_jail_pop_rate, na.rm = TRUE)) %>% 
  pull(highest_black_rate) 


#What was the overall highest white jail population rate?

summary$highest_white_rate <- prison_jail_small_wa %>% 
  summarize(highest_white_rate = max(white_jail_pop_rate, na.rm = TRUE)) %>% 
  pull(highest_white_rate)

#What was the overall highest aapi jail population rate?

summary$highest_aapi_rate <- prison_jail_small_wa %>% 
  summarize(highest_aapi_rate = max(aapi_jail_pop_rate, na.rm = TRUE)) %>% 
  pull(highest_aapi_rate)

#number of rows

summary$nrow <- nrow(prison_jail_small_wa)

#number of columns

summary$ncol <- ncol(prison_jail_small_wa)
