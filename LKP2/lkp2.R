#2
str(mtcars)


#3
data <- read.csv("houseprices.csv")
summary(data)


#4
hist(data$LotFrontage, main="test",xlim=c(20,120),breaks = 20)
hist(data$LotArea, main="test", xlim=c(0,20000), breaks = 20)
hist(data$GarageArea, main="test", breaks = 40)
hist(data$SalePrice, main="test")

barplot(table(data$MSZoning), xlab= "tahun", ylab="Frekuensi", main="test")
barplot(table(data$LotShape), xlab= "tahun", ylab="Frekuensi", main="test")
barplot(table(data$OverallQual), xlab= "tahun", ylab="Frekuensi", main="test")
barplot(table(data$YearBuilt), xlab= "tahun", ylab="Frekuensi", main="test")
barplot(table(data$RoofStyle), xlab= "tahun", ylab="Frekuensi", main="test")


#5
pairs(data[,c("LotFrontage","LotArea","GarageArea","SalePrice")],
      bg = rainbow(3),
      col = rainbow(3),
      pch = 21)
