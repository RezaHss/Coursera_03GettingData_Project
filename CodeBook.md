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
  
The rest of the 66 columns contain the average of different measurements for each *subjectNumber* and each *activityLabel*. The value of all of these measurements are normalized and between -1 and +1. I have used the following method and abbreviations to label these 66 columns: <br/>

Each column name is consisted of either five or six abbreviated parts: <br/>


| Part |*Abbreviation*: Desciption |
|:--- |:----|
|Part 1| ***t***: time domain signals.  <br/> ***f***: frequency domain signals. Fast Fourier Transform (FFT) was applied to these signals.|
|Part 2| ***Body***: signals based on the body motion of the participant. <br/> ***Gravity***: signals based on the earth's gravity.|
|Part 3| ***Acc***: the signals from the smartphone's accelerometer. <br/> ***Gyro***: the signals from the smartphone's gyroscope.|
|Parts 4 to 6| ***Mean***: the mean value in the initial data set. <br/> ***Std***: the standard deviation in the initial data set. <br/> ***X, Y, or Z***: the signal was calculated on the X, Y, or Z axis. <br/> ***Jerk***: jerk signals. <br/> ***Mag***: the magnitude calculated using the Euclidean norm |

The unit of each variable (column) is determined by the third part of its name: <br/>
- ***Acc***: the unit of these variables is standard gravity 'g'. <br/>
- ***Gyro***: the unit of these variables is radians/second. <br/><br/>

**Note: I need to re-emphasize that all of the values in the averages.txt are the mean of values in the initial data sets; in other words, I have calculated the mean of the mean values, and the mean of the standard deviation values.**