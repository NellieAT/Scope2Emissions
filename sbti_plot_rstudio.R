
pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png', 
               'grid', 'ggpubr', 'scales',
               'bbplot')

library("ggalt")
library("tidyr")
library("bbplot")
library("readr")

#Prepare data
#dumbbell_df <- gapminder %>%
  #filter(year == 1967 | year == 2007) %>%
  #select(country, year, lifeExp) %>%
  #spread(year, lifeExp) %>%
  #mutate(gap = `2007` - `1967`) %>%
  #arrange(desc(gap)) %>%
  #head(10)

#Data 
data_df <- read_csv("plot_dumbbell_data_2.csv")
options(repr.plot.width =9, repr.plot.height =9)

#Make plot
ggplot(data_df, aes(x = `Base`, xend = `Target`, y = reorder(Company, Base))) + 
  geom_dumbbell(colour = "#dddddd",
                size = 3,
                colour_x = "#FAAB18",
                colour_xend = "#1380A1",
                dot_guide=TRUE, dot_guide_size=0.25) +

  #bbc_style() + 
  theme_minimal() +
  labs(title="Top 30 Company Commitments for Scope 2 Emissions",
       subtitle="SBTi data as of November 2022",
       x='Horizon (Base year vs. Target year)',
       y=NULL)
