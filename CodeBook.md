---
title: Code Book for Coursera Getting and Cleaning Data Course Project
output: github_document
---

## Introduction
This code book is part of the final assignment of Getting and Cleaning Data Course Project and contains the description of variables used in the data set tidy.txt that is the output of `run_analysis.R` script. Refer to README.md for details.

All the variables, except SubjectId and Activity, are normalized in the range [-1,1] so they are unitless. 

## Variables

**SubjectId**

*Description:* ID of the subject volunteer. Labelled from 1 to 30

*Values:* \[ 1 , 30 \] 


**Activity**

*Description:* activity performed by the subject

*Values:* (walking, walking upstairs, walking downstairs, sitting, standing, laying)


**TimeBodyAccelerationMeanXAxis**

**TimeBodyAccelerationMeanYAxis**

**TimeBodyAccelerationMeanZAxis**

*Description:* mean of the time domain signal indicating the body linear acceleration on the X/Y/Z axis

*Values:* [-1,1]


**TimeBodyAccelerationStandardDeviationXAxis**

**TimeBodyAccelerationStandardDeviationYAxis**

**TimeBodyAccelerationStandardDeviationZAxis**

*Description:* standard deviation of the time domain signal indicating the body linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \] 


**TimeGravityAccelerationMeanXAxis**

**TimeGravityAccelerationMeanYAxis**

**TimeGravityAccelerationMeanZAxis**

*Description:* mean of the time domain signal indicating the gravity linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**TimeGravityAccelerationStandardDeviationXAxis**

**TimeGravityAccelerationStandardDeviationYAxis**

**TimeGravityAccelerationStandardDeviationZAxis**

*Description:* standard deviation of the time domain signal indicating the gravity linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**TimeBodyAccelerationJerkMeanXAxis**

**TimeBodyAccelerationJerkMeanYAxis**

**TimeBodyAccelerationJerkMeanZAxis**

*Description:* mean of the time domain jerk signal indicating the body linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**TimeBodyAccelerationJerkStandardDeviationXAxis**

**TimeBodyAccelerationJerkStandardDeviationYAxis**

**TimeBodyAccelerationJerkStandardDeviationZAxis**

*Description:* standard deviation of the time domain jerk signal indicating the body linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**TimeBodyGyroscopeMeanXAxis**

**TimeBodyGyroscopeMeanYAxis**

**TimeBodyGyroscopeMeanZAxis**

*Description:* mean of the time domain signal indicating the body angular velocity on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**TimeBodyGyroscopeStandardDeviationXAxis**

**TimeBodyGyroscopeStandardDeviationYAxis**

**TimeBodyGyroscopeStandardDeviationZAxis**

*Description:* standard deviation of the time domain signal indicating the body angular velocity on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**TimeBodyGyroscopeJerkMeanXAxis**

**TimeBodyGyroscopeJerkMeanYAxis**

**TimeBodyGyroscopeJerkMeanZAxis**

*Description:* mean of the time domain jerk signal indicating the body angular velocity on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**TimeBodyGyroscopeJerkStandardDeviationXAxis**

**TimeBodyGyroscopeJerkStandardDeviationYAxis**

**TimeBodyGyroscopeJerkStandardDeviationZAxis**

*Description:* standard deviation of the time domain jerk signal indicating the body angular velocity on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**TimeBodyAccelerationMagnitudeMean**

**TimeBodyAccelerationMagnitudeStandardDeviation**

*Description:* mean/standard deviation of the time domain signal indicating the body linear acceleration magnitude

*Values:* \[ -1, 1 \]

**TimeGravityAccelerationMagnitudeMean**

**TimeGravityAccelerationMagnitudeStandardDeviation**

*Description:* mean/standard deviation of the time domain signal indicating the gravity linear acceleration magnitude

*Values:* \[ -1, 1 \]

**TimeBodyAccelerationJerkMagnitudeMean**

**TimeBodyAccelerationJerkMagnitudeStandardDeviation**

*Description:* mean/standard deviation of the time domain jerk signal indicating the body linear acceleration magnitude

*Values:* \[ -1, 1 \]

**TimeBodyGyroscopeMagnitudeMean**

**TimeBodyGyroscopeMagnitudeStandardDeviation**

*Description:* mean/standard deviation of the time domain signal indicating the body angular velocity magnitude

*Values:* \[ -1, 1 \]

**TimeBodyGyroscopeJerkMagnitudeMean**

**TimeBodyGyroscopeJerkMagnitudeStandardDeviation**

*Description:* mean/standard deviation of the time domain jerk signal indicating the body angular velocity magnitude

*Values:* \[ -1, 1 \]

**FrequencyBodyAccelerationMeanXAxis**

**FrequencyBodyAccelerationMeanYAxis**

**FrequencyBodyAccelerationMeanZAxis**

*Description:* mean of the frequency domain signal indicating the body linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**FrequencyBodyAccelerationStandardDeviationXAxis**

**FrequencyBodyAccelerationStandardDeviationYAxis**

**FrequencyBodyAccelerationStandardDeviationZAxis**

*Description:* standard deviation of the frequency domain signal indicating the body linear acceleration in the X/Y/Z axis

*Values:* \[ -1, 1 \]

**FrequencyBodyAccelerationMeanFrequencyXAxis**

**FrequencyBodyAccelerationMeanFrequencyYAxis**

**FrequencyBodyAccelerationMeanFrequencyZAxis**

*Description:* mean frequency of the frequency domain signal indicating the body linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \]

**FrequencyBodyAccelerationJerkMeanXAxis**

**FrequencyBodyAccelerationJerkMeanYAxis**

**FrequencyBodyAccelerationJerkMeanZAxis**

*Description:* mean of the frequency domain jerk signal indicating the body linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \]

**FrequencyBodyAccelerationJerkStandardDeviationXAxis**

**FrequencyBodyAccelerationJerkStandardDeviationYAxis**

**FrequencyBodyAccelerationJerkStandardDeviationZAxis**

*Description:* standard deviation of the frequency domain jerk signal indicating the body linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \]

**FrequencyBodyAccelerationJerkMeanFrequencyXAxis**

**FrequencyBodyAccelerationJerkMeanFrequencyYAxis**

**FrequencyBodyAccelerationJerkMeanFrequencyZAxis**

*Description:* mean frequency of the frequency domain jerk signal indicating the body linear acceleration on the X/Y/Z axis

*Values:* \[ -1, 1 \]

**FrequencyBodyGyroscopeMeanXAxis**

**FrequencyBodyGyroscopeMeanYAxis**

**FrequencyBodyGyroscopeMeanZAxis**

*Description:* mean of the frequency domain signal indicating the body angular velocity on the X/Y/Z axis

*Values:* \[ -1, 1 \]

**FrequencyBodyGyroscopeStandardDeviationXAxis**

**FrequencyBodyGyroscopeStandardDeviationYAxis**

**FrequencyBodyGyroscopeStandardDeviationZAxis**

*Description:* standard deviation of the frequency domain signal indicating the body angular velocity on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**FrequencyBodyGyroscopeMeanFrequencyXAxis**

**FrequencyBodyGyroscopeMeanFrequencyYAxis**

**FrequencyBodyGyroscopeMeanFrequencyZAxis**

*Description:* mean frequency of the frequency domain signal indicating the body angular velocity on the X/Y/Z axis

*Values:* \[ -1, 1 \]


**FrequencyBodyAccelerationMagnitudeMean**

**FrequencyBodyAccelerationMagnitudeStandardDeviation**

**FrequencyBodyAccelerationMagnitudeMeanFrequency**

*Description:* mean/standard deviation/mean frequency of frequency time domain signal indicating the body linear acceleration magnitude

*Values:* \[ -1, 1 \]


**FrequencyBodyAccelerationJerkMagnitudeMean**

**FrequencyBodyAccelerationJerkMagnitudeStandardDeviation**

**FrequencyBodyAccelerationJerkMagnitudeMeanFrequency**

*Description:* mean/standard deviation/mean frequency of the frequency domain jerk signal indicating the body linear acceleration magnitude

*Values:* \[ -1, 1 \]

**FrequencyBodyGyroscopeMagnitudeMean**

**FrequencyBodyGyroscopeMagnitudeStandardDeviation**

**FrequencyBodyGyroscopeMagnitudeMeanFrequency**

*Description:* mean/standard deviation/mean frequency of frequency time domain signal indicating the body angular velocity magnitude

*Values:* \[ -1, 1 \]


**FrequencyBodyGyroscopeJerkMagnitudeMean**

**FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation**

**FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency**

*Description:* mean/standard deviation/mean frequency of the frequency domain jerk signal indicating the body angular velocity magnitude

*Values:* \[ -1, 1 \]


