# Code Book

## 1. Data Set File

The data set of interest is in the file `dataset-2.txt`.

There is one observation per line, in which the values are space-separated.
There is no column headers.

The original data serving as the base of this project are found there:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and explaned there:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## 2. Data Set Columns

| Column  | Column name |
| ------- | ------------------------ |
| `1`     | activity |
| `2`     | subject |
| `3`     | tBodyAcc-mean-Y-avg |
| `4`     | tBodyAcc-mean-Z-avg |
| `5`     | tBodyAcc-std-X-avg |
| `6`     | tBodyAcc-std-Y-avg |
| `7`     | tBodyAcc-std-Z-avg |
| `8`     | tGravityAcc-mean-X-avg |
| `9..67` | etc. |

Please see the file `columns.txt` for a full list of column names.

## 3. Columns 1 - Activity

Possible values: `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, `WALKING_UPSTAIRS`.

## 4. Columns 2 - Subject

Numerical identifier of the subject (person) on which the data were recorded.

## 5. Columns 3 to 67

The columns 3 to 67 are the averages of the original features over the entries for the activity and subject specified in columns 1 and 2.
As per exercise specifications, only the mean and standard deviation features have been considered.

To denote the fact that they are averages, `-avg` has been postfixed to each column name.
As such, they retain the same units as the original features, which are explained below.

Note: Some of the original features seem to have a typo (`BodyBody` e.g. `fBodyBodyAccJerkMag-mean()`).
In this data set, they have been renamed to fix the typo (`fBodyAccJerkMag-mean-avg`).

## 6. Original Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- All other variables of the original data sets have been omitted, as per exercise specifications.

The complete list of variables of each mean of feature vector is available in `columns.txt`.
