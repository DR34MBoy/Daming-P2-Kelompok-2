install.packages("fpc")
install.packages("factoextra")
library(fpc)
library(mice)
library(caret)
library(factoextra)
library(cluster)

data1 <- read.csv("Automobile.csv")
data2 <- data1
data2$make <- NULL
data2$body.style <- NULL

str(data2)
summary(data2)

idx <- data2 == "?"
is.na(data2) <- idx

data2$bore <- as.numeric(data2$bore)
data2$stroke <- as.numeric(data2$stroke)
data2$horsepower <- as.numeric(data2$horsepower)
data2$peak.rpm <- as.numeric(data2$peak.rpm)
data2$price <- as.numeric(data2$price)

summary(data2)
md.pattern(data2) 

data2$bore[is.na(data2$bore)] <- mean(data2$bore, na.rm= TRUE)
data2$stroke[is.na(data2$stroke)] <- mean(data2$stroke, na.rm= TRUE)
data2$horsepower[is.na(data2$horsepower)] <- mean(data2$horsepower, na.rm= TRUE)
data2$peak.rpm[is.na(data2$peak.rpm)] <- mean(data2$peak.rpm, na.rm= TRUE)
data2$price[is.na(data2$price)] <- mean(data2$price, na.rm= TRUE)

summary(data2)
md.pattern(data2) 

write.csv(data2, "Automobile_clean.csv")



pamk.result <- pamk(data2)
pamk.result$nc
table(pamk.result$pamobject$clustering, data1$make)

layout(matrix(c(1,2),1,2))
plot(pamk.result$pamobject)
layout(matrix(1))

pam.result <- pam(data2, 4)
table(pam.result$clustering, data1$make)

layout(matrix(c(1,2),1,2))
plot(pam.result)
layout(matrix(1))

