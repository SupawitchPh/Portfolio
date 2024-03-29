# Explore dataframe 'diamonds' and create 5 visualizations.

## Chart 1 - Relationship between carat and price
library(tidyverse)

set.seed(25)
diamonds %>%
  sample_frac(0.1) %>%
  ggplot(aes(carat, price, col=color)) +
  geom_point(size = 3, alpha = 0.8) +
  theme_minimal() +
  scale_color_brewer(type = "seq", palette = "YlGnBu", direction = -1) +
  labs(
    title = "Relationship between carat and price",
    x = "Carat",
    y = "Price (USD)",
    caption = "Datasource : diamonds ggplot2"
  )

## Chart 2 - Relationship between carat and price divided by color
set.seed(25)
diamonds %>%
  sample_frac(0.1) %>%
  ggplot(aes(carat, price, col=color)) +
  geom_point(size = 1, alpha = 0.8) +
  geom_smooth(col="red", size = 0.5) +
  theme_minimal() +
  facet_wrap(~color, ncol = 3) +
  scale_color_brewer(type = "seq", palette = "YlGnBu", direction = -1) +
  labs(
    title = "Relationship between carat and price divided by color",
    x = "Carat",
    y = "Price (USD)",
    caption = "Datasource : diamonds ggplot2"
  )

## Chart 3 - Number of diamonds by clarity
set.seed(25)
diamonds %>%
  sample_frac(0.1) %>%
  ggplot(aes(clarity)) +
  geom_bar(fill = "#ffc0cb") +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, size = 2.5, col = "#ef662c") +
  labs(
    title = "Number of diamonds by clarity",
    x = "Clarity",
    y = "Count",
    caption = "Datasource : diamonds ggplot2"
  )

## Chart 4 - Proportion of clarity by cut
set.seed(25)
diamonds %>%
  sample_frac(0.1) %>%
  ggplot(aes(cut, fill = clarity)) +
  geom_bar(position = "fill") +
  scale_fill_brewer(type = "div", palette = "RdYlBu", direction = 1) +
  labs(
    title = "Proportion of clarity by cut",
    x = "Cut",
    y = "Count",
    caption = "Datasource : diamonds ggplot2"
  )

## Chart 5 - Relationship between carat and price divided by color  and clarity
set.seed(25)
diamonds %>%
  sample_frac(0.1) %>%
  ggplot(aes(carat, price)) +
  geom_point(size = 0.5, alpha = 0.5) +
  geom_smooth(col="red", size = 0.5) +
  theme_minimal() +
  facet_grid(clarity ~ color) +
  labs(
    title = "Relationship between carat and price divided by color and clarity",
    x = "Carat",
    y = "Price (USD)",
    caption = "Datasource : diamonds ggplot2"
  )
