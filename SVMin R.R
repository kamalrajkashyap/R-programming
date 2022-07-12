#SVM in R
install.packages("mlbench")
install.packages("rpart")

library(e1071)
library(rpart)
data(Glass, package="mlbench")
View(Glass)
## split data into a train and test set
index <- 1:nrow(Glass)
testindex <- sample(index, trunc(length(index)/3))
testset <- Glass[testindex,]
trainset <- Glass[-testindex,]

## SVM
svm.model <- svm(Type ~ ., data = trainset, cost = 100, gamma = 1)
svm.pred <- predict(svm.model, testset[,-10])
svm.pred
##r-part - partition tree method used here to compare results

## r-part
rpart.model <- rpart(Type ~ ., data = trainset)
rpart.pred <- predict(rpart.model, testset[,-10], type = "class")

#compute svm confusion matrix
Tab1 <- table(pred = svm.pred, true = testset[,10])

## compute rpart confusion matrix
Tab2 <- table(pred = rpart.pred, true = testset[,10])

classAgreement(Tab1)
classAgreement(Tab2)
#Example -2 => Non-linear-Regression and SVM
###  here, the data points lie in between the two borders of the margin
##which is maximized under suitable conditions to avoid outlier inclusion

library(e1071)
library(rpart)
data(Ozone, package="mlbench")
## split data into a train and test set
index <- 1:nrow(Ozone)
testindex <- sample(index, trunc(length(index)/3))
testset <- na.omit(Ozone[testindex,-3])
trainset <- na.omit(Ozone[-testindex,-3])

## svm
svm.model <- svm(V4 ~ ., data = trainset, cost = 1000, gamma = 0.0001)
svm.pred <- predict(svm.model, testset[,-3])

# crossprod -  allows you to multiply two matrices or vectors, where the transpose of the first argument is used.
crossprod(svm.pred - testset[,3]) / length(testindex)

## rpart
rpart.model <- rpart(V4 ~ ., data = trainset)
rpart.pred <- predict(rpart.model, testset[,-3])
crossprod(rpart.pred - testset[,3]) / length(testindex)
