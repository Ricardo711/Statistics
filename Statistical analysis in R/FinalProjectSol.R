# Solution of Final Project [100 points]
# Created by : Ricardo Manjarrez
# Created on : 26-APR-2024

# Question 1) [15 points] Answer the following questions about this dataset 
# using suitable R code.

library(datasets)
data("iris")
print(head(iris))

# 1a) How many unique ‘Species’ are there in the data frame?
length(unique(iris$Species))

# 1b) What is the total number of records (total rows)?
nrow(iris)

# 1c) How many records per ‘Species’ (number of rows per species)?
table(iris$Species)
# OR
aggregate(Sepal.Length~Species, data=iris, FUN=length)

# 1d) How many attributes in the dataset?
ncol(iris)

# 1e) Provide a summary (min, mean, max, median) of the first four attributes.
summary(iris[, 1:4])

# Question 2) [20 points] Pearson’s correlation method measures the strength of
# association and direction of relationship between two continuous variables. 
# It provides a value between -1 to +1 wherein +1 indicates the perfectly 
# positive relationship and -1 indicates a perfectly negative relationship. So,
# the sign of the correlation score determines the direction, whereas the 
# magnitude determines the strength, thus a score of 0 means the two variables 
# are independent.

# 2a) Find the relationship between Petal.Length and Petal.Width.
# Ex: cor(iris$Petal.Length, iris$Petal.Width)
cor(iris$Petal.Length, iris$Petal.Width, method="pearson")

# 2b) Find the relationship between Sepal.Length and Sepal.Width.
cor(iris$Sepal.Length, iris$Sepal.Width, method="pearson")

# Describe the results obtained in a) and b) in a few words.
# ==> Answer in file Observations.txt

# Question 3) [20 points] Generate scatter plots between:
# 3.1) Petal.Length and Petal.Width (save the file as AssoPetal.pdf)
# Name scatter plot to save as a PDF file
pdf("AssoPetal.pdf")

# Create plot
plot(iris$Petal.Length, iris$Petal.Width, 
     xlab="Petal Length", ylab="Petal Width", 
     main="Scatter Plot of Petal Length vs Petal Width")

# Close the PDF device
dev.off()

# 3.2) Sepal.Length and Sepal.Width (save the file as AssoSepal.pdf)
# Name scatter plot to save as a PDF file
pdf("AssoSepal.pdf")

# Create plot
plot(iris$Sepal.Length, iris$Sepal.Width, 
     xlab="Sepal Length", ylab="Sepal Width", 
     main="Scatter Plot of Sepal Length vs Sepal Width")

# Close the PDF device
dev.off()

# Use appropriate x and y labels and suitable heading for your plots.

# Also see if you can verify the trend from question 2 in your plots.
# ==> Answer in file Observations.txt


# Question 4) [45 points] Pearson’s Chi-square test can also be used as a test 
# of independence between two discrete variables (refer to slides on statistical 
# analysis for details on the usage of Chi-square test).
# Determine through statistical analysis if the Petal.Width and Species are 
# dependent, that is, if there is a relationship between the two variables. 
# You need to follow the steps listed below:

# 4.1) [3 points] Utilizing the knowledge from previous lectures, use Ckmeans 
# package to discretize the Petal.Width. You should get a vector of repeating 
# integers. Call this vector ‘X’.
# A dummy ex could be: c(2,2,2,2,1,1,1,1,2,2,2)

# Install and load the Ckmeans.1d.dp package
install.packages("Ckmeans.1d.dp")
library(Ckmeans.1d.dp)

# Perform discretization of Petal.Width
pw_discretized <- Ckmeans.1d.dp(iris$Petal.Width, k=5)$cluster

# Assign the resulting vector to 'X'
X <- pw_discretized

# 4.2) [3 points] Now create a vector Y of Species.
# Ex: Y < iris$Species
Y <- iris$Species

# 4.3) [3 points] Use the above two vectors in a method table(X, Y) to create a 
# contingency table (or frequency table). This will be given as an input to the 
# chisq.test().
contingency_table <- table(X, Y)

# Perform chi-squared test of independence
chisq.test(contingency_table)

# Question 4) [20 points] Follow all the steps that we learned in the statistical analysis 
# lecture and using the chisq.test() at the standard p-value cut off 
# (p-value <= 0.05) determine if there is dependence between Petal.Width and 
# Species. Write all your observations and statements in a separate text file 
# named Observations.txt.

# ==> Answer in file Observations.txt

# Question 5) [10 points] Create a boxplot between Petal.Width and Species and see if you 
# can observe a trend. Use appropriate x and y labels and title for your plot. 
# Save it as ChiPetal.pdf.
# Name scatter plot to save as a PDF file
pdf("ChiPetal.pdf")

# Create plot
boxplot(Petal.Width ~ Species, data=iris,
        xlab="Species", ylab="Petal Width",
        main="Boxplot of Petal Width by Species")

# Close the PDF device
dev.off()

# Question 6) [6 points] Observing ChiPetal.pdf can you see a relationship between 
# Petal.Width and Species such that it can be utilized by a domain specialist 
# (or you) to distinguish the three species of Iris. State your observation as 
# well as whether or not the three Iris species can be distinguished by 
# Petal.Width with proper explanation in either case.

# ==> Answer in file Observations.txt


