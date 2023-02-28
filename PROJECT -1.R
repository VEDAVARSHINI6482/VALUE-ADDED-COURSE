#LIBRARYS
library(rvest)
library(dplyr) 

#IMPORTING DATASET
dataset <- read.csv("world_population2023.csv")

#VIEW DATASET
View(dataset)

#REMOVING COLUMN
dataset <- subset(dataset, select = -(area))
View(dataset)
dataset <- subset(dataset, select = -(land.area))
View(dataset)

#VIEWING DATA TYPE
str(dataset)
View(dataset)

#SLICING DATA
growth.rate = dataset [, 6]
density = dataset [, 5]

#DATASET FOR SLR
data <- data.frame(growth.rate, density)
View(data)

#IMPORTING DATA SPLITTING LIBRARY
library(caTools)

#GENERATING RANDOM NUMBERS
set.seed(123)

#DATA SPLITTING
split = sample.split(dataset$growth.rate,SplitRatio = 0.8)

#TRAINING DATA
training_set = subset(dataset, split==TRUE)
View(training_set)

#TESTING DATA
testing_set = subset(dataset,split==FALSE)
View(testing_set)

#OBJECTS
x <- growth.rate
y <- density

#APPLYING REGRESSION
regressor = lm(formula = growth.rate~density, data = training_set)

#PREDICTION
y_pred = predict(regressor, newdata = testing_set)
View(y_pred)

#IMPORTING ggplot LIBRARY
library(ggplot2)

#VISUALIZATION
plot(testing_set$growth.rate, testing_set$density, type = 'p', col = 'blue', xlab ='GROWTH RATE', ylab = 'DENSITY')
lines(testing_set$growth.rate, y_pred, type = 'o', col = 'red')

#VISUALIZATION
ggplot(testing_set, aes(x = growth.rate)) + 
  geom_point(aes(y = density,colour = 'Actual')) + 
  geom_line(aes(y = y_pred, colour = 'Predicted'))



