## Created a dataframe for top 10 most popular movies on netflix in thailand (18 - 24 March 2024) from www.netflix.com

library(tidyverse)
library(rvest)

url_imdb <- "https://www.netflix.com/tudum/top10?week=2023-10-29%2F"

movie_name <- url_imdb %>%
  read_html() %>%
  html_elements("td.pb-2.tbl-cell.tbl-cell-name") %>%
  html_text2()

weeks <- url_imdb %>%
  read_html() %>%
  html_elements("span.wk-number") %>%
  html_text2()

hr_views <- url_imdb %>%
  read_html() %>%
  html_elements("td.pb-2.tbl-cell.tbl-cell-hours ") %>%
  html_text2()

runtimes <- url_imdb %>%
  read_html() %>%
  html_elements("td.pb-2.tbl-cell.tbl-cell-runtime ") %>%
  html_text2()

views <- url_imdb %>%
  read_html() %>%
  html_elements("td.pb-2.tbl-cell.tbl-cell-vhor ") %>%
  html_text2()

top_10_df <- data.frame(
  Movie = movie_name,
  Weeks_in_top_10 = weeks,
  Hours_viewed = hr_views,
  Runtime = runtimes,
  Views = views
)
