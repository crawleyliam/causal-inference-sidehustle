# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

library(tidyverse)
library(here)

read_csv(here("data/NLSY97_clean.csv")) %>%
  group_by(race, gender) %>%
  summarize(total_incarcerations = mean(total_incarcerations)) %>%
  ggplot(aes(race, total_incarcerations, fill = gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    x = "Race", 
    y = "Mean Incarcerations", 
    fill = "Gender",) +
  theme_minimal()

ggsave(here("figures/incarcerations_by_racegender.png"), width=8, height=4.5)
