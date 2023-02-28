install.packages("fpc")
install.packages("factoextra")
library(fpc)
library(mice)
library(caret)
library(factoextra)
library(cluster)

data1 <- read.csv("Automobile.csv")

str(data1)
summary(data1)

idx <- data1 == "?"
is.na(data1) <- idx

data1$bore <- as.numeric(data1$bore)
data1$stroke <- as.numeric(data1$stroke)
data1$horsepower <- as.numeric(data1$horsepower)
data1$peak.rpm <- as.numeric(data1$peak.rpm)
data1$price <- as.numeric(data1$price)

summary(data1)
md.pattern(data1) 

data1$bore[is.na(data1$bore)] <- mean(data1$bore, na.rm= TRUE)
data1$stroke[is.na(data1$stroke)] <- mean(data1$stroke, na.rm= TRUE)
data1$horsepower[is.na(data1$horsepower)] <- mean(data1$horsepower, na.rm= TRUE)
data1$peak.rpm[is.na(data1$peak.rpm)] <- mean(data1$peak.rpm, na.rm= TRUE)
data1$price[is.na(data1$price)] <- mean(data1$price, na.rm= TRUE)

summary(data1)
md.pattern(data1) 

# Opsional
write.csv(data1, "Automobile_clean_full.csv", row.names = FALSE)

data2 <- read.csv("Automobile_clean_full.csv")

data3 <- data2
data3$make <- NULL
data3$body.style <- NULL

summary(data3)
md.pattern(data3) 

pamk.result <- pamk(data3)
pamk.result$nc
table(pamk.result$pamobject$clustering, data2$make)

layout(matrix(c(1,2),1,2))
plot(pamk.result$pamobject)
layout(matrix(1))

pam.result <- pam(data3, 4)
table(pam.result$clustering, data2$make)

layout(matrix(c(1,2),1,2))
plot(pam.result)
layout(matrix(1))

