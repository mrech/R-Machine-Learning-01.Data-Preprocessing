#In R press F1 to call the Help for a function

# Data Preprocessing 

# Importing the Dataset
  ## Define the working directory:

setwd("C:/Users/PC-ASUS/Desktop/Free Time/e-learning/Udemy/Machine Learning with R and Python/02. Data Preprocessing")

# You can set the directory also from the bottom-right square finding the folder
# through ... and setting it as directory clicking on More

#Define a variables which contains the dataset

dataset = read.csv('Data.csv')

# Taking care of missing values
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     (dataset$Age))

# na.rm = TRUE indicates that missing values are removed before the computation

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x,na.rm = TRUE)),
                        (dataset$Salary))

# Encoding categorical data
# Since R encondes categorical data using Factors --> it does not create by default ordered relationship
# so we do not need to create dummy variables
dataset$Country = factor(dataset$Country,
                         levels = c('France','Spain', 'Germany'),
                         labels = c(1,2,3))

# For the dependent variable
dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No','Yes'),
                         labels = c(0,1))

# Splitting the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)
set.seed(123)

# split is the METHOD that make the split into Training and Test set
split = sample.split(dataset$Purchased, SplitRatio = 0.8)

# Create the training_set and the test_set

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling - (Euclidean Distance)
# Factors are not numeric numbers, so we exclude the categories from the 
# feature scaling
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])



