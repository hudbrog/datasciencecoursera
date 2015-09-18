---
title: "CodeBook"
author: "hudbrog"
date: "18 Sep 2015"
output: html_document
---

This is a Code Book for Getting and Cleaning Data Course Project. It explains variables, data and tranformations that was performed on original dataset. 

Script assumes that data is unzipped into current workind directory inside folder named 'data'. 
First, script reads dictionaries: features.txt and activity_labels.txt into data frames. These are goind to be used later. After that script reads datasets from 'test' and 'train' folder. When reading the main dataset (i.e. '_X' file), values from features.txt are used as vector for column names. Activity and subject variables are read from separate files and are added to original dataset data frame with cbind. After that we have two datasets (test and train) both containing ids of subjects and activities as well as having proper column names. We use rbind to combine these two datasets into one. 

All of the above actions are done using 'pure' R. After that for readability and performance reasons we use 'dplyr' package. 
Dataset is left joined with activity names dictionary, thus adding a column ActivityName containing descriptive activity names. After that we use 'select' to limit the number of columns we have: only these, that contain words 'mean' and 'avg' are left, plus activity name and subject id. 

_Original dataset has variables for time domain and frequency domain signals plus several averaged signals based on original data. We decided to leave all 'mean' and 'std' signals. Do note that variables that include 'Mean' in the name are not included, since they represent angle between mean values of other variables but do not show mean value of anything by themselves._

That left us with dataset only with required columns and all names being descriptive. After that we group the data by subject IDs and activity types, summarizing all other columns with mean function. That data is written to *tidy_dataset_5.txt* file using _table.write_ function. 

Data could be read back from file using:

_read.table("tidy_dataset_5.txt", header=TRUE)_

code.

Here is the data dictionary:

* SubjectID - ID of the subject of the test
* ActivityName - description of test activity
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyAccMag-mean()
* tGravityAccMag-mean()
* tBodyAccJerkMag-mean()
* tBodyGyroMag-mean()
* tBodyGyroJerkMag-mean()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-meanFreq()
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-std()
* tGravityAccMag-std()
* tBodyAccJerkMag-std()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-std()
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-std()