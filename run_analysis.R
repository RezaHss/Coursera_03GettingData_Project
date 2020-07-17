### Coursera - Getting and Cleaning Data - Course Project ##################

# I will follow the five steps mentioned in the instructions for this project
# to make a tidy data set.


## Step 1: Merging the test and the train sets -----------------------------

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="samsungData.zip", method="curl")
unzip("samsungData.zip")

# I used "tidyverse" library (which automatically loads dplyr, readr, and some
# other useful packages), instead of base R functions, for faster and easier
# reading and manipulation of the data.
# As the contents of the "Inertial Signals" folder in both test and train sets
# are raw data, and the contents of the other files have been processed, I did
# not merge the files inside the "Inertial Signals" folders with my main
# data set, as it opposes tidy data principles.

library(tidyverse)

# Merging the test set:

subject_test <- read_table("./UCI HAR Dataset/test/subject_test.txt",
                           col_names="subjectNumber")
subject_test
y_test <- read_table("./UCI HAR Dataset/test/y_test.txt",
                     col_names="activityNumber")
y_test
X_test <- read_table("./UCI HAR Dataset/test/X_test.txt", col_names=FALSE)
X_test
merged_test <- bind_cols(subject_test, y_test, X_test)
merged_test

# Merging the train set:

subject_train <- read_table("./UCI HAR Dataset/train/subject_train.txt",
                            col_names="subjectNumber")
subject_train
y_train <- read_table("./UCI HAR Dataset/train/y_train.txt",
                      col_names="activityNumber")
y_train
X_train <- read_table("./UCI HAR Dataset/train/X_train.txt", col_names=FALSE)
X_train
merged_train <- bind_cols(subject_train, y_train, X_train)
merged_train

# Merging the test and train sets together:

mergedDF <- bind_rows(merged_test, merged_train)
mergedDF

# Putting the "features" in the column names of the MergedDF:
# The first two variables, subjectNumber and activityNumber, were imported from
# other data sets, so we need to put the 561 features in columns 3 to 563.

features <- read_table("./UCI HAR Dataset/features.txt", col_names=FALSE)
features
colnames(mergedDF)[3:563] <- features[[1]]
# I used double [ because I wanted to convert "features" into a character
# vector, instead of a tibble.
mergedDF

# I remove all objects, except "mergedDF" from the Global Environment to free
# up some RAM:

rm(list = setdiff(ls(), "mergedDF"))


## Step 2: Extracting only the measurements on the mean and std ------------

# There are both "mean" and "meanFreq" among the features (variables). The
# question asks for mean AND standard deviation. The number of features
# containing the phrase "std" is 33. This number for phrases "mean" and
# "meanFreq" is 46 and 13, respectively, and when we exclude "meanFreq" from
# "mean", the number of matching features would be 33, just as this number
# for "std". As there is no definite instruction on this issue, I am going
# with my understanding of the matter and that is I should not include the
# "meanFreq" in my tidy data set.

length(grep("std", colnames(mergedDF)))
length(grep("mean", colnames(mergedDF)))
length(grep("meanFreq", colnames(mergedDF)))
length(grep("mean[^F]", colnames(mergedDF)))

index_std <- grep("std", colnames(mergedDF))
index_mean <- grep("mean[^F]", colnames(mergedDF))
mergedDF <- select(mergedDF, subjectNumber, activityNumber,
                   c(index_mean, index_std))
rm(list = setdiff(ls(), "mergedDF"))


## Step 3: Using descriptive activity names to name the activities ---------

activity_labels <- read_table("./UCI HAR Dataset/activity_labels.txt",
                              col_names=c("activityNumber", "activityLabel"))
activity_labels

mergedDF <- right_join(activity_labels, mergedDF, by="activityNumber")

# Now I remove "activityNumber", which is redundant, and reorder the columns:

mergedDF <- select(mergedDF, subjectNumber, activityLabel, 4:69)
mergedDF
rm(activity_labels)


## Step 4: Properly labeling the variables with descriptive names ----------

# The abbreviated column names are described in the Code Book. 

mergedDF <- rename(mergedDF,
                   "tBodyAccMeanX" = "1 tBodyAcc-mean()-X",
                   "tBodyAccMeanY" = "2 tBodyAcc-mean()-Y",
                   "tBodyAccMeanZ" = "3 tBodyAcc-mean()-Z",
                   "tGravityAccMeanX" = "41 tGravityAcc-mean()-X",
                   "tGravityAccMeanY" = "42 tGravityAcc-mean()-Y",
                   "tGravityAccMeanZ" = "43 tGravityAcc-mean()-Z",
                   "tBodyAccJerkMeanX" = "81 tBodyAccJerk-mean()-X",
                   "tBodyAccJerkMeanY" = "82 tBodyAccJerk-mean()-Y",
                   "tBodyAccJerkMeanZ" = "83 tBodyAccJerk-mean()-Z",
                   "tBodyGyroMeanX" = "121 tBodyGyro-mean()-X",
                   "tBodyGyroMeanY" = "122 tBodyGyro-mean()-Y",
                   "tBodyGyroMeanZ" = "123 tBodyGyro-mean()-Z",
                   "tBodyGyroJerkMeanX" = "161 tBodyGyroJerk-mean()-X",
                   "tBodyGyroJerkMeanY" = "162 tBodyGyroJerk-mean()-Y",
                   "tBodyGyroJerkMeanZ" = "163 tBodyGyroJerk-mean()-Z",
                   "tBodyAccMagMean" = "201 tBodyAccMag-mean()",
                   "tGravityAccMagMean" = "214 tGravityAccMag-mean()",
                   "tBodyAccJerkMagMean" = "227 tBodyAccJerkMag-mean()",
                   "tBodyGyroMagMean" = "240 tBodyGyroMag-mean()",
                   "tBodyGyroJerkMagMean" = "253 tBodyGyroJerkMag-mean()",
                   "fBodyAccMeanX" = "266 fBodyAcc-mean()-X",
                   "fBodyAccMeanY" = "267 fBodyAcc-mean()-Y",
                   "fBodyAccMeanZ" = "268 fBodyAcc-mean()-Z",
                   "fBodyAccJerkMeanX" = "345 fBodyAccJerk-mean()-X",
                   "fBodyAccJerkMeanY" = "346 fBodyAccJerk-mean()-Y",
                   "fBodyAccJerkMeanZ" = "347 fBodyAccJerk-mean()-Z",
                   "fBodyGyroMeanX" = "424 fBodyGyro-mean()-X",
                   "fBodyGyroMeanY" = "425 fBodyGyro-mean()-Y",
                   "fBodyGyroMeanZ" = "426 fBodyGyro-mean()-Z",
                   "fBodyAccMagMean" = "503 fBodyAccMag-mean()",
                   "fBodyAccJerkMagMean" = "516 fBodyBodyAccJerkMag-mean()",
                   "fBodyGyroMagMean" = "529 fBodyBodyGyroMag-mean()",
                   "fBodyGyroJerkMagMean" = "542 fBodyBodyGyroJerkMag-mean()",
                   "tBodyAccStdX" = "4 tBodyAcc-std()-X",
                   "tBodyAccStdY" = "5 tBodyAcc-std()-Y",
                   "tBodyAccStdZ" = "6 tBodyAcc-std()-Z",
                   "tGravityAccStdX" = "44 tGravityAcc-std()-X",
                   "tGravityAccStdY" = "45 tGravityAcc-std()-Y",
                   "tGravityAccStdZ" = "46 tGravityAcc-std()-Z",
                   "tBodyAccJerkStdX" = "84 tBodyAccJerk-std()-X",
                   "tBodyAccJerkStdY" = "85 tBodyAccJerk-std()-Y",
                   "tBodyAccJerkStdZ" = "86 tBodyAccJerk-std()-Z",
                   "tBodyGyroStdX" = "124 tBodyGyro-std()-X",
                   "tBodyGyroStdY" = "125 tBodyGyro-std()-Y",
                   "tBodyGyroStdZ" = "126 tBodyGyro-std()-Z",
                   "tBodyGyroJerkStdX" = "164 tBodyGyroJerk-std()-X",
                   "tBodyGyroJerkStdY" = "165 tBodyGyroJerk-std()-Y",
                   "tBodyGyroJerkStdZ" = "166 tBodyGyroJerk-std()-Z",
                   "tBodyAccMagStd" = "202 tBodyAccMag-std()",
                   "tGravityAccMagStd" = "215 tGravityAccMag-std()",
                   "tBodyAccJerkMagStd" = "228 tBodyAccJerkMag-std()",
                   "tBodyGyroMagStd" = "241 tBodyGyroMag-std()",
                   "tBodyGyroJerkMagStd" = "254 tBodyGyroJerkMag-std()",
                   "fBodyAccStdX" = "269 fBodyAcc-std()-X",
                   "fBodyAccStdY" = "270 fBodyAcc-std()-Y",
                   "fBodyAccStdZ" = "271 fBodyAcc-std()-Z",
                   "fBodyAccJerkStdX" = "348 fBodyAccJerk-std()-X",
                   "fBodyAccJerkStdY" = "349 fBodyAccJerk-std()-Y",
                   "fBodyAccJerkStdZ" = "350 fBodyAccJerk-std()-Z",
                   "fBodyGyroStdX" = "427 fBodyGyro-std()-X",
                   "fBodyGyroStdY" = "428 fBodyGyro-std()-Y",
                   "fBodyGyroStdZ" = "429 fBodyGyro-std()-Z",
                   "fBodyAccMagStd" = "504 fBodyAccMag-std()",
                   "fBodyAccJerkMagStd" = "517 fBodyBodyAccJerkMag-std()",
                   "fBodyGyroMagStd" = "530 fBodyBodyGyroMag-std()",
                   "fBodyGyroJerkMagStd" = "543 fBodyBodyGyroJerkMag-std()")


## Step 5: Creating another data set with the average of each variable -----
##         for each activity and each subject
 
averagesDF <- mergedDF %>% 
              group_by(subjectNumber, activityLabel) %>% 
              summarize(across(everything(), mean))
averagesDF

# Here I used dplyr::across(everything()) to calculate mean across all of the
# columns. Please note that, as the dataframe had been grouped by
# "subjectNumber" and "activityLabel", the mean function was not applied to
# these two columns (otherwise, I would have received warnings for trying to
# take the mean of character vectors).
