install.packages("randomForest")
suppressPackageStartupMessages(library(randomForest))
set.seed(40)
my_fit <- randomForest(mpg ~ ., data=mtcars)
plot(my_fit)
yhat1 <- predict(my_fit) #OOB(test) prediction
yhat2 <- predict(my_fit, newdata=mtcars) #training set perdiction
#different y hat 
plot(yhat1, yhat2)
mean((yhat1 - mtcars$mpg)^2)
mean((yhat2 - mtcars$mpg)^2)

