Code book for r0bis course project
======================================================
This code book explains the variables in the tidy data set 'tidydata.txt'.

Please note that data are average values grouped by Subject and Activity.
So the the numeric values represent mean values for each Subject-Activity pairs.

For each subject there are 66 values. Half of them are averaged mean values 
denoted by 'Mean', half are averaged standard deviations denoted by 'Std'.

X, Y and Z denote movement axes
t in the beginning denotes time based signal values
f - values to which Fast Fourier Transform has been applied
(for a more precise description, please see the end of this file)

Variables
------------------------------------------------------

<pre>
Subject  - Person who participated in the experiment integer 1 to 30
Activity - type of activity where measurement done
tBodyAccMeanX - mean value
tBodyAccMeanY - mean value
tBodyAccMeanZ - mean value
tBodyAccStdX - mean value
tBodyAccStdY - mean value
tBodyAccStdZ - mean value
tGravityAccMeanX - mean value
tGravityAccMeanY - mean value
tGravityAccMeanZ - mean value
tGravityAccStdX - mean value
tGravityAccStdY - mean value
tGravityAccStdZ - mean value
tBodyAccJerkMeanX - mean value
tBodyAccJerkMeanY - mean value
tBodyAccJerkMeanZ - mean value
tBodyAccJerkStdX - mean value
tBodyAccJerkStdY - mean value
tBodyAccJerkStdZ - mean value
tBodyGyroMeanX - mean value
tBodyGyroMeanY - mean value
tBodyGyroMeanZ - mean value
tBodyGyroStdX - mean value
tBodyGyroStdY - mean value
tBodyGyroStdZ - mean value
tBodyGyroJerkMeanX - mean value
tBodyGyroJerkMeanY - mean value
tBodyGyroJerkMeanZ - mean value
tBodyGyroJerkStdX - mean value
tBodyGyroJerkStdY - mean value
tBodyGyroJerkStdZ - mean value
tBodyAccMagMean - mean value
tBodyAccMagStd - mean value
tGravityAccMagMean - mean value
tGravityAccMagStd - mean value
tBodyAccJerkMagMean - mean value
tBodyAccJerkMagStd - mean value
tBodyGyroMagMean - mean value
tBodyGyroMagStd - mean value
tBodyGyroJerkMagMean - mean value
tBodyGyroJerkMagStd - mean value
fBodyAccMeanX - mean value
fBodyAccMeanY - mean value
fBodyAccMeanZ - mean value
fBodyAccStdX - mean value
fBodyAccStdY - mean value
fBodyAccStdZ - mean value
fBodyAccJerkMeanX - mean value
fBodyAccJerkMeanY - mean value
fBodyAccJerkMeanZ - mean value
fBodyAccJerkStdX - mean value
fBodyAccJerkStdY - mean value
fBodyAccJerkStdZ - mean value
fBodyGyroMeanX - mean value
fBodyGyroMeanY - mean value
fBodyGyroMeanZ - mean value
fBodyGyroStdX - mean value
fBodyGyroStdY - mean value
fBodyGyroStdZ - mean value
fBodyAccMagMean - mean value
fBodyAccMagStd - mean value
fBodyBodyAccJerkMagMean - mean value
fBodyBodyAccJerkMagStd - mean value
fBodyBodyGyroMagMean - mean value
fBodyBodyGyroMagStd - mean value
fBodyBodyGyroJerkMagMean - mean value
fBodyBodyGyroJerkMagStd - mean value
</pre>

### Detailed Data description (the original source)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).