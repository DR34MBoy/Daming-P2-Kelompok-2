install.packages("infotheo")
install.packages("mice")
library(infotheo)
library(mice)

data <- read.csv("lkp4-dataset - market_sales_item.csv")

summary(data)
str(data)

# No. 1 (Cek missing value dan ubah missing value)
md.pattern(data)
# Unit Price (Numerik)
data$Unit.price[is.na(data$Unit.price)] <- mean (data$Unit.price, na.rm= TRUE)
# Quantity (Numerik)
data$Quantity[is.na(data$Quantity)] <- mean (data$Quantity, na.rm= TRUE)
# cogs
data$cogs[is.na(data$cogs)] <- mean (data$cogs, na.rm= TRUE)
# Rating (Kategorik)
data$Rating[is.na(data$Rating)] <- mean (data$Rating, na.rm= TRUE)
# gross.income (Numerik)
data$gross.income[is.na(data$gross.income)] <- mean (data$gross.income, na.rm= TRUE)


# No. 2 (Diskretasi)
## Equal Width
ew.unit_price <- discretize(data$Unit.price, "equalwidth", 4)
ew.quantity <- discretize(data$Unit.price, "equalwidth", 4)
ew.rating <- discretize(data$Unit.price, "equalwidth", 5)

## Equal Frequency
ef.unit_price <- discretize(data$Unit.price, "equalfreq", 4)
ef.quantity <- discretize(data$Unit.price, "equalfreq", 4)
ef.rating <- discretize(data$Unit.price, "equalfreq", 5)

# No.3 (Operasi gabungan baris dan kolom)
data2 <- transform(data, total_price = data$Unit.price * data$Quantity * 1.05)
data3 <- transform(data2, tax_5percent = data2$total_price - (data2$Unit.price * data2$Quantity))



