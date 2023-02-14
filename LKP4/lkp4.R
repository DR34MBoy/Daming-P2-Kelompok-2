install.packages("infotheo")
install.packages("mice")
install.packages("caret")
install.packages("BBmisc")
library(BBmisc)
library(infotheo)
library(mice)
library(caret)

data <- read.csv("lkp4-dataset - market_sales_item.csv")
data2 <- read.csv("lkp4-dataset - customer_sales_info.csv")

data <- data[-251,]
data2 <- data2[-251:-252,]

summary(data)
str(data)

# No. 1 (Cek missing value dan ubah missing value)
md.pattern(data)

# Unit Price (Numerik)
data$Unit.price[is.na(data$Unit.price)] <- mean (data$Unit.price, na.rm= TRUE)
# Quantity (Numerik)
data$Quantity[is.na(data$Quantity)] <- mean (data$Quantity, na.rm= TRUE)
# cogs (Numerik)
data$cogs[is.na(data$cogs)] <- mean (data$cogs, na.rm= TRUE)
# Rating (Kategorik)
data$Rating[is.na(data$Rating)] <- names(sort(-table(data$Rating))[1])
# gross.income (Numerik)
data$gross.income[is.na(data$gross.income)] <- mean (data$gross.income, na.rm= TRUE)

x

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
data <- transform(data, total_price = data$Unit.price * data$Quantity * 1.05)
data <- transform(data, tax_5percent = data$total_price - (data$Unit.price * data$Quantity))

typeof(data$gross.income)
typeof(data$total_price)
typeof(data$tax_5percent)

df.norm <- normalize(data[11:12], method = "range", range = c(0, 1))

# No.4 Integrasi data

data <- merge(data, data2, by = "Invoice.ID")

  


