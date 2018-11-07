# Kristiina Suominen 
# 7.11.2018
# Regression and model validation

#Reading the data into variable lrn14
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

#Exploring the structure and dimensions of the data
dim(lrn14)
str(lrn14)
#At this point there are 183 observations and 60 variables
