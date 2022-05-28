library(ggplot2)
library(dplyr)
library(stringr)
library(usmap)
library(plotly)
library(scales)

# Data about prison/jail populations per 100,000 people per county/state
prison_jail_rates <-  read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true", stringsAsFactors = FALSE)

prison_jail_rates_2018 <- prison_jail_rates %>% 
  filter(year == 2018) %>% 
  group_by(state)
 
options(scipen = 999)

plot <- plot_usmap("counties", data = prison_jail_rates_2018,
           values = "black_jail_pop_rate")

ggplotly(plot_usmap("counties",
                    data = prison_jail_rates_2018,
                    values = "black_jail_pop_rate", na.rm = TRUE,
                    color = "white",
                    size = 0) +
           scale_fill_gradientn(colors = c("lightblue","blue","darkblue"),
                                values = rescale(c(0,750,20000))) +
           theme(legend.position = "right") +
           labs(title = "Total Black Jail Population Rate",
                fill = "Black Jail Population Per 100,000 People"))

