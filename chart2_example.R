library(ggplot2)

#total prison pop rate vs. urbanicity

avg_urbanicity <- prison_jail_small_wa %>% 
  group_by(urbanicity) %>% 
  summarise(avg_urbanicity = mean(total_jail_pop_rate, na.rm = TRUE))

ggplot(data = avg_urbanicity) +
  geom_col(mapping = aes(x = urbanicity,
                         y = avg_urbanicity,
                      fill = urbanicity)) +
  scale_x_discrete(guide = guide_axis(n.dodge=3)) +
  labs(title = 'Jail Population Rates Vs. Urbanicity', x = "Urbanicity", y = 'Average Jail Population Rate') 


avg_year_total <- prison_jail_small_wa %>% 
  group_by(year) %>% 
  summarise(avg_year = mean(black_jail_pop_rate, na.rm = TRUE))

ggplot(data = avg_year_total) +
  geom_col(mapping = aes(x = year,
                         y = avg_year,
                         fill = avg_year)) +
  scale_x_continuous(breaks = round(seq(1990, 2018, by = 5))) +
  labs(title = 'Average Black Jail Population Rate Over Time', x = "Year", y = 'Average Jail Population Rate') 
