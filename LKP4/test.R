install.packages("discretization")

library(BBmisc)
library(infotheo)
library(mice)
library(caret)
library(discretization)

data <- read.csv("lkp4-dataset - market_sales_item.csv")

data <- data[-251,]

summary(data)
str(data)

md.pattern(data)

# Rating (Kategorik)
data$Rating[is.na(data$Rating)] <- names(sort(-table(data$Rating))[1])
# gross.income (Numerik)
data$gross.income[is.na(data$gross.income)] <- mean (data$gross.income, na.rm= TRUE)

md.pattern(data)

Quantity.disc <- discretize(data$Quantity,"equalwidth",4)
Quantity.disc[Quantity.disc == 1] <- "Sedikit"
Quantity.disc[Quantity.disc == 2] <- "Sedang"
Quantity.disc[Quantity.disc == 3] <- "Banyak"
Quantity.disc[Quantity.disc == 4] <- "Sangat Banyak"

Unit.price.disc <- discretize(data$Unit.price,"equalwidth",4)
Unit.price.disc[Unit.price.disc == 1] <- "Sangat Murah"
Unit.price.disc[Unit.price.disc == 2] <- "Murah"
Unit.price.disc[Unit.price.disc == 3] <- "Sedang"
Unit.price.disc[Unit.price.disc == 4] <- "Mahal"

Rating.disc <- discretize(data$Rating,"equalwidth",5)
Rating.disc[Rating.disc == 1] <- "Sangat Buruk"
Rating.disc[Rating.disc == 2] <- "Buruk"
Rating.disc[Rating.disc == 3] <- "Normal"
Rating.disc[Rating.disc == 4] <- "Bagus"
Rating.disc[Rating.disc == 5] <- "Sangat Bagus"

data = data.frame(data,Quantity.disc,Unit.price.disc,Rating.disc)
colnames(data)[11] <- "Quantity Disc"
colnames(data)[12] <- "Unit Price Disc"
colnames(data)[13] <- "Rating Disc"

data <- transform(data, total_price = data$Unit.price * data$Quantity * 1.05)
data <- transform(data, tax_5percent = data$total_price - (data$Unit.price * data$Quantity))

data[14:15] <- normalize(data[14:15], method = "range", range = c(0, 1))

data2 <- read.csv("lkp4-dataset - customer_sales_info.csv")
data2 <- data2[-251:-252,]

data <- merge(data, data2, by = "Invoice.ID")


