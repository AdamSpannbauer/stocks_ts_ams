library(fpp3)

# Read data
# NEED TO DOWNLOAD `nyse_stocks.csv` FOR THIS TO WORK!
# NEED TO DOWNLOAD `nyse_stocks.csv` FOR THIS TO WORK!
stocks <- read.csv("nyse_stocks.csv")

# Convert to `tsibble()`
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)

# 1 stock
selected_stock <- "AAPL"

stocks %>%
  filter(symbol == selected_stock) %>%
  autoplot(open) +
  labs(title = selected_stock)

# Multiple stocks
selected_stocks <- c("GOOG", "AAPL")

stocks %>%
  filter(symbol %in% selected_stocks) %>%
  autoplot(open)
