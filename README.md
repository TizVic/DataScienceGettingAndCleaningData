---
# Getting and Cleaning Data Course Project - Coursera
---

## Introduction
This is the README of the *Coursera Getting and Cleaning Data Course Project*. The goal of this project is to demonstrate the ability to collect, work with, and clean a data set.

The data set represents data collected from the accelerometers from a smartphone (details can be found at the site [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)). The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist.

The link to data set used in this project is  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Project's files are:

* `README.md` - this file
* `CodeBook.md` - code book for all variables
* `run_analysis.R` - script that process the data set and write the requested tidy data set

## Prerequisites
There are three prerequisites to run correctly the script `run_analysis.R`:

0. the script `run_analysis.R`  is in the working folder
1. the `UCI HAR Dataset` is already uncompress in a subfolder `./data/` of the working folder 
2. the package `dplyr` is already installed

## Actions
To run the script `run_analysis.R` you may use:

```
source("run_analysis.R")
```

The script performs the five step requested by assignment:

**STEP 1: Merges the training and the test sets to create one data set.**

All the data sets are first loaded than merged in `final_step1` 

```
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
```
finally at the end of every step some clean up

```
# cleaning
rm(list = c("trainx", "trainy", "testx", "testy", "trainsubj", "testsubj", "mytrain", "mytest"))
```

**STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.**

The script loads features labels from the disk and assigns at `final_step1` then it filters columns based on column's names and creates `final_step2` 
```
# Loads features labels
lbdata <- read.table("./data/features.txt")

# Adds ActivityId and SubjectId to labels
lbdata <- rbind(data.frame(V1 = 0, V2 = "ActivityId"), lbdata)
lbdata <- rbind(data.frame(V1 = -1, V2 = "SubjectId"), lbdata)

# Assign labels to final_step1 dataset
names(final_step1) <- t(lbdata[,2]) # transpose the column 

# Extracts mean and std only  
final_step2 <- final_step1[,grep("mean|std",names(final_step1))] # final result STEP 2
```

**STEP 3: Uses descriptive activity names to name the activities in the data set**

The activity labels are loaded from disk then processed for some minor formatting.
Activity Id and subject Id are added to `final_step2` to merge with activity labels data frame via `ActivityId` 
```
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
```

**STEP 4: Appropriately labels the data set with descriptive variable names.**

For descriptive variable names I chose to expand abbreviations and to capitalize first letter of every word removing spaces ([UpperCamelCase](https://en.wikipedia.org/wiki/CamelCase)) because IMHO `TimeBodyAccelerationJerkStandardDeviationYAxis` is more readble than `timebodyaccelerationjerkstandarddeviationyaxis`

```
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
```

**STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

In the last step, data in `final_step4` from step 4 are grouped by `SubjectId` and `Activity` and then summarised with the mean. 

```
# final result STEP 5
tidy <- final_step4 %>% 
                    group_by(SubjectId, Activity) %>% 
                        summarise_all(mean)
```
This operation creates a data set of dimensions 180x81 given from 30 Subject x 6 activities each.

Finally data are written on disk via `write.table()`

