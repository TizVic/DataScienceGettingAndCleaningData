##
## Date 2016-08-18
## Author: Tiziano Vicentini
##
## This script is part of the final assignemnt of the Getting and Cleaning Data
## from Coursera Data Science Specialization.
## It processes the data sets from sorce 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## and downloaded at link 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Output is a tidy data set tidy.txt with the average of  
## each variable for each activity and each subject.
##
library(dplyr)

## STEP 1
# Merges the training and the test sets to create one data set.

# Loads datasets from disk
print("Loading dataset from disk...")
trainx <- read.table("./data/train/X_train.txt", stringsAsFactors = FALSE)
trainy <- read.table("./data/train/y_train.txt", stringsAsFactors = FALSE)
testx <- read.table("./data/test/X_test.txt", stringsAsFactors = FALSE)
testy <- read.table("./data/test/y_test.txt", stringsAsFactors = FALSE)
trainsubj <- read.table("./data/train/subject_train.txt", stringsAsFactors = FALSE)
testsubj <- read.table("./data/test/subject_test.txt", stringsAsFactors = FALSE)

# Joins datasets  
mytrain <- cbind(trainsubj, trainy, trainx)
mytest  <- cbind(testsubj, testy, testx)

final_step1 <- rbind(mytrain, mytest) # final result STEP 1

# cleaning
rm(list = c("trainx", "trainy", "testx", "testy", "trainsubj", "testsubj", "mytrain", "mytest"))

print("STEP 1: Merges the training and the test sets to create one data set. Done!")

## STEP 2
# Extracts only the measurements on the mean and standard deviation for each measurement.

# Loads features labels
lbdata <- read.table("./data/features.txt")

# Adds ActivityId and SubjectId to labels
lbdata <- rbind(data.frame(V1 = 0, V2 = "ActivityId"), lbdata)
lbdata <- rbind(data.frame(V1 = -1, V2 = "SubjectId"), lbdata)

# Assign labels to final_step1 dataset
names(final_step1) <- t(lbdata[,2]) # transpose the column 

# Extracts mean and std only  
final_step2 <- final_step1[,grep("mean|std",names(final_step1))] # final result STEP 2

# cleaning
rm(list = c("lbdata"))

print("STEP 2: Extracts only mean/std measurement. Done!")

## STEP 3
# Uses descriptive activity names to name the activities in the data set

# read label data for activities
lbactivity <- read.table("./data/activity_labels.txt", stringsAsFactors = FALSE)

# substitute "_" with space
lbactivity[,2] <- sub("_"," ", lbactivity[,2])

# all lowercase
lbactivity[,2] <- tolower(lbactivity[,2])

# Set column names for the temp data
names(lbactivity) <- c("ActivityId", "Activity")

# Add Activity and Subject 
final_step2 <- cbind("ActivityId" = final_step1$ActivityId, "SubjectId" = final_step1$SubjectId, final_step2)

# Join data
final_step3 <- merge(lbactivity, final_step2, by = "ActivityId", all = TRUE, sort = FALSE)

# Remove unused colum 
final_step3 <- final_step3[,c(3,2,4:82)] # final result STEP 3

# cleaning
rm(list = c("final_step2", "lbactivity"))

print("STEP 3: Use descriptive activity names. Done." )

## STEP 4
# Appropriately labels the data set with descriptive variable names.

# Store temp column label
nametidy <- names(final_step3)

# Set column labels to HumanReadableForm beacuse are very long names
nametidy <- sub("^f", "Frequency", nametidy)
nametidy <- sub("^t", "Time", nametidy)
nametidy <- sub("BodyBody", "Body", nametidy)
nametidy <- sub("Acc", "Acceleration", nametidy)
nametidy <- sub("Gyro", "Gyroscope", nametidy)
nametidy <- sub("mean\\(\\)", "Mean", nametidy)
nametidy <- sub("meanFreq\\(\\)", "MeanFrequency", nametidy)
nametidy <- sub("Mag", "Magnitude", nametidy)
nametidy <- sub("std\\(\\)", "StandardDeviation", nametidy)
nametidy <- sub("X", "XAxis", nametidy)
nametidy <- sub("Y", "YAxis", nametidy)
nametidy <- sub("Z", "ZAxis", nametidy)
nametidy <- gsub("-", "", nametidy)
names(final_step3) <- nametidy 

final_step4 <- final_step3 # final result step 4

# cleaning
rm(list = c("nametidy", "final_step3"))

print("STEP 4: Appropriately labels the data set with descriptive variable names.Done!")

## STEP 5
# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

# final result STEP 5
tidy <- final_step4 %>% 
                    group_by(SubjectId, Activity) %>% 
                        summarise_all(mean)

# write data for assignment
write.table(tidy, "tidy.txt", row.names = FALSE)

# cleaning
rm(list = c("final_step1", "final_step4"))

print("STEP 5: creates a second, independent tidy data set. Done!")