install.packages("party")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("e1071")
install.packages("caret")
install.packages("readxl")

library(party)
library(rpart)
library(rpart.plot)
library(e1071)
library(caret)
library(readxl)

dataset <- read_excel("Dataset/Rice_Cammeo_Osmancik.xlsx")
dataset$Class <- as.factor(dataset$Class)

set.seed(1234)

ind <- sample(2, nrow(dataset), replace=TRUE, prob=c(0.75, 0.25))

trainData <- dataset[ind==1,]
testData <- dataset[ind==2,]

myFormula <- Class ~ Area + Perimeter + Major_Axis_Length + Minor_Axis_Length + Eccentricity + Convex_Area + Extent

# CTree
data_ctree <- ctree(myFormula, data=trainData)

print(data_ctree)
plot(data_ctree)
plot(data_ctree, type="simple")

ctree_pred <- predict(data_ctree, newdata = testData)
confusionMatrix(ctree_pred, testData$Class)


# RPart
data_rpart <- rpart(myFormula, data = trainData, control = rpart.control(minsplit = 10))

print(data_rpart)
rpart.plot(data_rpart)

rpart_pred <- predict(data_rpart, newdata = testData, type = "class")
confusionMatrix(rpart_pred, testData$Class)


# SVM
svm_model <- svm(myFormula, data = trainData, cost = 2, gamma = 1)

svm_pred <- predict(svm_model, testData)
confusionMatrix(svm_pred, testData$Class)