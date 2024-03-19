## ปริมาณฝุ่นละอองขนาดไม่เกิน 2.5 ไมครอน (PM2.5) - ภาคเหนือ พ.ศ. 2554 - 2565 จากสำนักงานนโยบายและแผนทรัพยากรธรรมชาติและสิ่งแวดล้อม

library(rvest)

url_env <- "http://env_data.onep.go.th/indicator/view?ind=740"

pm_data <- url_env %>%
  read_html() %>%
  html_elements("td") %>%
  html_text2() %>%
  as.numeric()

pm_matrix <- pm_data %>%
  matrix(ncol = 2, byrow = T)

colnames(pm_matrix) <- c("Years", "PM2.5")

pm_table <- data.frame(pm_matrix)
