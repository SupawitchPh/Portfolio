# BUS Juice Bars

# Create dataframe for smoothies menu.
menus <- list(
  No. = 1:5,
  Menu = c("Strawberry Smoothie", "Raspberry Smoothie", "Apple Smoothie", "Banana Smoothie", "Mango Smoothie"),
  Price_THB = c(80, 80, 75, 70, 70)
)

menus_df <- data.frame(menus)

# Start chatbot for customer.
sale_chatbot <- function() {
  print("Welcome to BUS Juice Bars!")
  welcome_text = readline("What is your name: ")
  print(paste("Hello!", welcome_text))
  print("This is our smoothies menu")
  print(menus_df)
  order_text = readline("Please select the number: ")
  if (order_text == 1) {
    smoothie <- "Strawberry Smoothie"
    price <- 80
  } else if (order_text == 2) {
    smoothie <- "Raspberry Smoothie"
    price <- 80
  } else if (order_text == 3) {
    smoothie <- "Apple Smoothie"
    price <- 75
  } else if (order_text == 4) {
    smoothie <- "Banana Smoothie"
    price <- 70
  } else if (order_text == 5) {
    smoothie <- "Mango Smoothie"
    price <- 70
  }
  quantity_text = readline("Quantity: ")
  quantity_num <- as.numeric(quantity_text)
  total_price <- (price * quantity_num)
  print(paste("Your order is", smoothie, ", Quantity =", quantity_text))
  print(paste("Net Total Price =", total_price, "THB"))
  print("Thank you for your support!")
}
