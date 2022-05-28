library(ggplot2)

#Average black jail pop over ten years
avg_black_jail_pop <- prison_jail_small_wa %>% 
  group_by(year) %>% 
  summarise(avg_black_jail_pop = mean(black_jail_pop_rate, na.rm = TRUE)) %>% 
  slice_max(n = 10, order_by = year) 
  
avg_white_jail_pop <- prison_jail_small_wa %>% 
  group_by(year) %>% 
  summarise(avg_white_jail_pop = mean(white_jail_pop_rate, na.rm = TRUE)) %>% 
  slice_max(n = 10, order_by = year) 

avg_jail_pop_rate <- left_join(avg_black_jail_pop, avg_white_jail_pop)

#Create chart
ggplot(data = avg_jail_pop_rate) +
  geom_line(aes(x = year, 
                y = avg_black_jail_pop, 
             color = "Avg Black Jail Pop Rate" )) +
  geom_line(aes(x = year, 
                y = avg_white_jail_pop,
                color = "Avg White Jail Pop Rate")) +
  labs(title = 'Average Jail Population Rates (Per 100,000) Black vs. White ', x = "Year", y = 'Average Jail Population Rate')
