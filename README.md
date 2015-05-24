
## This is the README file for the tidy data set obtained from the study:
## Human Activity Recognition Using Smartphones Dataset Version 1.0

=========================================
###The goal of this project was to obtain a tidy data with the following requirements.

1. Merge the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

=========================================
This was achieved as follows:

*  use the data in the Folder "UCI HAR Dataset" downloaded from 
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    For a precise description of the data files please read the README.txt file povided therein.
*  An R script is provided "run_analysis.R". This script uses the libraries library(plyr) and library(dplyr) and contains two functions.
    a) mergeData() this function loads the data and transforms the data according to the steps 1 to 4 of the requirements.
        More precisely:
            loads X_test.txt and X_train.txt and merges them by rbind()
            adds correct column names from the features.txt using colnames() (to give descriptive column names)
            adds the Activity column (obtained from Y_test.txt and Y_train.txt by rbind()) by cbind()
            adds the Subject column (obtained from subject_test.txt and subject_train.txt by rbind()) by cbind()
            only the columns containing "std|mean|Activity|Subject" in their column name are selected by using a grep
            the labels (numbers) for the activity are replaced by a descriptive name
    b)  secondTidyDataSet() this function creates a ssecond, independet tidy data set with the average of each variable for each activity and each subject.
    More precisely:
        the data is loaded using the mergeData() function
        the data is grouped with group_by(data, Activity, Subject)
        the data is summarised with summarise_each(groupedData, funs(mean))
        the data is saved in a tidyData.txt file in the working directory with write.table
*  The data in tidyData.txt can be read by using:
    data <- read.table("tidyData.txt", header = TRUE)
        
        
=========================================  