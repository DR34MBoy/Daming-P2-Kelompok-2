install.packages("infotheo")
library(infotheo)

data <- read.csv("lkp4-dataset - market_sales_item.csv")

summary(data)
str(data)

# Diskretasi
## Equal Width
ew.unit_price <- discretize(data$Unit.price, "equalwidth", 4)
ew.quantity <- discretize(data$Unit.price, "equalwidth", 4)
ew.rating <- discretize(data$Unit.price, "equalwidth", 5)

## Equal Frequency
ef.unit_price <- discretize(data$Unit.price, "equalfreq", 4)
ef.quantity <- discretize(data$Unit.price, "equalfreq", 4)
ef.rating <- discretize(data$Unit.price, "equalfreq", 5)

data2 <- transform(data, total_price = data$Unit.price * data$Quantity * 1.05)
data3 <- transform(data2, tax_5percent = data2$total_price - (data2$Unit.price * data2$Quantity))

