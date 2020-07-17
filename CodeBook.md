### Code Book - averages.txt
<br/>

There are 180 observations and 68 columns (variables) in this file. The first two columns are: <br/>

- ***subjectNumber***: a numeric vector from 1 to 30, for each of the 30 participants in this study. <br/>
- ***activityLabel***: the activity that the participant was doing during the experiment which has six levels: <br/> 
  1. LAYING
  2. SITTING
  3. STANDING
  4. WALKING
  5. WALKING_DOWNSTAIRS
  6. WALKING_UPSTAIRS
  
The remaining 66 columns contain the average of different measurements for each *subjectNumber* and each *activityLabel*. The value of all of these measurements are normalized and between -1 and +1. I have used the following method and abbreviations to label these 66 columns: <br/>

Each column name is consisted of either five or six abbreviated parts: <br/>


| Part |*Abbreviation*: Desciption |
|:--- |:----|
|Part 1| ***t***: time domain signals.  <br/> ***f***: frequency domain signals. Fast Fourier Transform (FFT) was applied to these signals.|
|Part 2| ***Body***: signals based on the body motion of the participant. <br/> ***Gravity***: signals based on the earth's gravity.|
|Part 3| ***Acc***: the signals from the smartphone's accelerometer. <br/> ***Gyro***: the signals from the smartphone's gyroscope.|
|Parts 4 to 6| ***Mean***: the mean value in the initial data set. <br/> ***Std***: the standard deviation in the initial data set. <br/> ***X, Y, or Z***: the signal was calculated on the X, Y, or Z axis. <br/> ***Jerk***: jerk signals. <br/> ***Mag***: the magnitude calculated using the Euclidean norm. |

The unit of each variable (column) is determined by the third part of its name: <br/>
- ***Acc***: the unit of these variables is standard gravity 'g'. <br/>
- ***Gyro***: the unit of these variables is radians/second. <br/><br/>

**Note: I need to re-emphasize that all of the values in the averages.txt are the mean of values in the initial data sets; in other words, I have calculated the mean of the mean values, and the mean of the standard deviation values.** <br/>
<br/>
Finally, here is the list of all column names and their index in the *averages.txt* file: <br/>

| Index |Colname | Index |Colname | Index |Colname |
|:- |:----|:- |:----|:- |:----|
| 1 | subjectNumber | 2 | activityLabel |  |  |
| 3 | tBodyAccMeanX | 4 | tBodyAccMeanY | 5 | tBodyAccMeanZ |
| 6 | tGravityAccMeanX | 7 | tGravityAccMeanY | 8 | tGravityAccMeanZ |
| 9 | tBodyAccJerkMeanX | 10 | tBodyAccJerkMeanY | 11 | tBodyAccJerkMeanZ |
| 12 | tBodyGyroMeanX | 13 | tBodyGyroMeanY | 14 | tBodyGyroMeanZ |
| 15 | tBodyGyroJerkMeanX | 16 | tBodyGyroJerkMeanY | 17 | tBodyGyroJerkMeanZ |
| 18 | tBodyAccMagMean | 19 | tGravityAccMagMean | 20 | tBodyAccJerkMagMean |
| 21 | tBodyGyroMagMean | 22 | tBodyGyroJerkMagMean | 23 | fBodyAccMeanX |
| 24 | fBodyAccMeanY | 25 | fBodyAccMeanZ | 26 | fBodyAccJerkMeanX |
| 27 | fBodyAccJerkMeanY | 28 | fBodyAccJerkMeanZ | 29 | fBodyGyroMeanX |
| 30 | fBodyGyroMeanY | 31 | fBodyGyroMeanZ | 32 | fBodyAccMagMean |
| 33 | fBodyAccJerkMagMean | 34 | fBodyGyroMagMean | 35 | fBodyGyroJerkMagMean |
| 36 | tBodyAccStdX | 37 | tBodyAccStdY | 38 | tBodyAccStdZ |
| 39 | tGravityAccStdX | 40 | tGravityAccStdY | 41 | tGravityAccStdZ |
| 42 | tBodyAccJerkStdX | 43 | tBodyAccJerkStdY | 44 | tBodyAccJerkStdZ |
| 45 | tBodyGyroStdX | 46 | tBodyGyroStdY | 47 | tBodyGyroStdZ |
| 48 | tBodyGyroJerkStdX | 49 | tBodyGyroJerkStdY | 50 | tBodyGyroJerkStdZ |
| 51 | tBodyAccMagStd | 52 | tGravityAccMagStd | 53 | tBodyAccJerkMagStd |
| 54 | tBodyGyroMagStd | 55 | tBodyGyroJerkMagStd | 56 | fBodyAccStdX |
| 57 | fBodyAccStdY | 58 | fBodyAccStdZ | 59 | fBodyAccJerkStdX |
| 60 | fBodyAccJerkStdY | 61 | fBodyAccJerkStdZ | 62 | fBodyGyroStdX |
| 63 | fBodyGyroStdY | 64 | fBodyGyroStdZ | 65 | fBodyAccMagStd |
| 66 | fBodyAccJerkMagStd | 67 | fBodyGyroMagStd | 68 | fBodyGyroJerkMagStd |