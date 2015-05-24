# Course Project

#using the following packages
library(plyr)
library(dplyr)

# merge the Data, and make a tidy data set
mergeData <- function(){
    #loads test and train set
    testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
    trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
   
    #total sample set
    totalSet<-rbind(testSet,trainSet)
    #get column names
    columnData <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,stringsAsFactors =FALSE)
    #add column names
    colnames(totalSet)<- columnData$V2

    #add labels
    testLabels <- read.table("./UCI HAR Dataset/test/Y_test.txt")
    trainLabels <- read.table("./UCI HAR Dataset/train/Y_train.txt")
    totalLabels <- rbind(testLabels,trainLabels)
    colnames(totalLabels) <- "Activity" 

    totalSetWithLabels <- cbind(totalLabels,totalSet)

    #add subject info
    testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    totalSubject <- rbind(testSubject,trainSubject)
    colnames(totalSubject) <- "Subject" 

    totalSetWithLabelsAndSubject <- cbind(totalSubject,totalSetWithLabels)

    #get only those columns containg "mean" or "std" in their column names
    DataOnlyForMeanAndStd <- totalSetWithLabelsAndSubject[, grep("std|mean|Activity|Subject",colnames(totalSetWithLabelsAndSubject))]

    # descriptive activity names (replace the label numers with a descriptive name)
    DataOnlyForMeanAndStd$Activity[DataOnlyForMeanAndStd$Activity == 1]<- "WALKING"
    DataOnlyForMeanAndStd$Activity[DataOnlyForMeanAndStd$Activity == 2]<- "WALKING_UPSTAIRS"
    DataOnlyForMeanAndStd$Activity[DataOnlyForMeanAndStd$Activity == 3]<- "WALKING_DOWNSTAIRS"
    DataOnlyForMeanAndStd$Activity[DataOnlyForMeanAndStd$Activity == 4]<- "SITTING"
    DataOnlyForMeanAndStd$Activity[DataOnlyForMeanAndStd$Activity == 5]<- "STANDING"
    DataOnlyForMeanAndStd$Activity[DataOnlyForMeanAndStd$Activity == 6]<- "LAYING"
}

# frist creating the merged data set and then getting an independent tidy data set with the average of each variable for each activity and each subject
secondTidyDataSet <- function(){
    mergeData()
    #step 5 of the course project
    fintalData <- DataOnlyForMeanAndStd
    # group Data by Activity and Subject
    groupedData <- group_by(fintalData, Activity, Subject)
    # sumairse the grouped data
    data_to_submit <- summarise_each(groupedData, funs(mean))
    # save in a txt file
    write.table(data_to_submit,file = "tidyData.txt", row.name=FALSE)
}


