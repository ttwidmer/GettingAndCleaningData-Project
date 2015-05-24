## CodeBook
    
### Code book

    * Activity: string, out of  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
    * Subject : Number betwen 1 and 30, labelling the 30 volunteers
    
    * all other variables are a subset of the columns given in the X_test.txt respectively Y_test.txt. Their column names are given in the features.txt. For a precise description see the provided README.txt.
    

### Study design

   * The data is obtained from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
    precise description see the README.md 
    
### Summary choices

    * All the columns containing either "std" or "mean" are included in the tidyData.txt, since it was not specified that a specific mean such as meanFreq() should be excluded.
