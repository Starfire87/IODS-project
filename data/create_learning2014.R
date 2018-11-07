# Kristiina Suominen 
# 7.11.2018
# Regression and model validation

#Reading the data into variable lrn14
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)#Exploring the structure and dimensions of the data
dim(lrn14)
str(lrn14)
#At this point there are 183 observations and 60 variables

# creating column 'attitude' by scaling the column "Attitude"
lrn14$attitude <- lrn14$Attitude / 10

# Accessing the dplyr library
library(dplyr)

# Selecting questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# selecting the columns related to deep learning and creating column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# selecting the columns related to surface learning and creating column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# selecting the columns related to strategic learning and creating column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

# choosing the columns to keep
keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")

# selecting the 'keep_columns' to create a new dataset
learning2014 <- select(lrn14, one_of(keep_columns))

# select rows where points is greater than zero
learning2014 <- filter(learning2014, Points > 0)

# see the stucture of the new dataset
str(learning2014)
