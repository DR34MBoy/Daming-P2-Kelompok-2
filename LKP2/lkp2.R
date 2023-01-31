#2
str(mtcars)


#3
data <- read.csv("houseprices.csv")
summary(data)


#4
salesprice = c()
salesprice
for (i in 1:100){
  salesprice[i] = floor(data$SalePrice[i]/1000)
  data$SalePrice[i]
  salesprice[i]
}

hist(data$LotFrontage, xlab= "Lot Frontage", ylab="Frekuensi",
     main="Persebaran Lot Frontage",xlim=c(0,120),
     breaks = 100,col = heat.colors(25))
hist(data$LotArea, xlab= "Lot Area", ylab="Frekuensi",
     main="Persebaran Lot Area", xlim=c(0,20000), 
     breaks = 100, col = heat.colors(40))
hist(data$GarageArea, xlab= "Garage Area", ylab="Frekuensi",
     main="Persebaran Garage Area", xlim=c(0,1000),
     breaks = 100, col = heat.colors(25))
hist(salesprice, xlab= "Sale Price (in thousands)", ylab="Frekuensi",
     main="Persebaran Sale Price", xlim=c(0,500),
     breaks = 100, col = heat.colors(25))


barplot(table(data$MSZoning), xlab= "MS Zoning", ylab="Frekuensi", 
        main="Frekuensi Kemunculan MSZoning",col = topo.colors(10))
barplot(table(data$LotShape), xlab= "Lot Shape", ylab="Frekuensi", 
        main="Frekuensi Kemunculan Lot Shape",col = topo.colors(10))
barplot(table(data$OverallQual), xlab= "Overall Qual", ylab="Frekuensi", 
        main="Frekuensi Kemunculan OverallQual",col = topo.colors(10))
barplot(table(data$YearBuilt), xlab= "Year Built", ylab="Frekuensi", 
        main="Frekuensi Kemunculan YearBuilt",col = topo.colors(120))
barplot(table(data$RoofStyle), xlab= "Roof Style", ylab="Frekuensi", 
        main="Frekuensi Kemunculan RoofStyle",col = topo.colors(10))



#5
pairs(data[,c("LotFrontage","LotArea","GarageArea","SalePrice")],
      bg = rainbow(3),
      col = rainbow(3),
      pch = 21)
