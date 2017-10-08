## Coursera Data Science "Data Cleaning" Programming Assignment 3.
## Script by: Pascal Bauermeister, October 2017.
##
## This R script does the following:
##
## 1. Merges the training and the test sets to create one data set.
##
## 2. Extracts only the measurements on the mean and standard
##    deviation for each measurement.
##
## 3. Uses descriptive activity names to name the activities in the
##    data set
##
## 4. Appropriately labels the data set with descriptive variable
##    names.
##
## 5. From the data set in step 4, creates a second, independent tidy
##    data set with the average of each variable for each activity and
##    each subject.
##
## The final results are generated in the file 'dataset-2.txt'.
##


library(dplyr)

## Collect common textual names and values
activity.descr <- read.table("UCI HAR Dataset/activity_labels.txt")
features.descr <- read.table("UCI HAR Dataset/features.txt")$V2

## This function returns a complete data frame for the given data set
make_data_frame <- function(dataset) {
    ## Load subject id data
    path <- paste("UCI HAR Dataset/", dataset, "/subject_", dataset, ".txt", sep="")
    subject <- read.table(path, col.names=c("subject"))

    ## Load activity data, as string values (step 3.)
    path <- paste("UCI HAR Dataset/", dataset, "/y_", dataset, ".txt", sep="")
    activity.numeric <- read.table(path)
    activity <- activity.descr[activity.numeric$V1, 2, drop=F]$V2
    
    ## Load measurements data
    path <- paste("UCI HAR Dataset/", dataset, "/X_", dataset, ".txt", sep="")
    measurements.all <- read.table(path)
    names(measurements.all) <- features.descr
    
    ## Keep only mean and standard deviation values (step 2.)
    measurements.wanted_columns <- grep("-(mean|std)[(]", features.descr)
    measurements <- measurements.all[, measurements.wanted_columns]
    # # Cosmetic: Rename column names in the form "*BodyBody*" to "*Body*"
    # names(measurements) <- sub("BodyBody", "Body", names(measurements))
    
    ## Create the data frame
    data <- data.frame(subject, activity)
    data <- cbind(data, measurements)
    data
}

## Collect each data set
data.train <- make_data_frame("train")
data.test <- make_data_frame("test")

## Concatenate all data sets (step 1.)
data <- rbind(data.train, data.test)
# data <- make_data_frame("test")

## End of step 4.
# write intermediate dataset as CSV
#write.csv(data, "dataset-1.csv", row.names=F)

## Beginning of step 5: 
## From the data set in step 4, creates a second, independent tidy
## data set with the average of each variable for each activity and
## each subject.

# get possible activities and subjects, and form an empty datafreame for the results
activities <- unique(data$activity)
subjects <- unique(sort(data$subject))
dataframe <- data.frame()

## For each combination of activity and subject, make the mean of all values
## (There is surely a much conciser way of doing all this...)
for (a in activities) {
    for (s in subjects) {
        ## subset of values for current activity and subject
        data.measurements <- filter(data, subject==s & activity==a) %>% select(-(1:3))
        means <- colMeans(data.measurements)
        means <- rbind(means)

        ## assemble activity, subject, and means in a single row        
        row <- cbind(data.frame(activity=a, subject=s), means)

        ## append row to results
        dataframe <- rbind(dataframe, row)
    }
}

## Write final dataset as CSV (eases checks)
#write.csv(dataframe, "dataset-2.csv", row.names=F)

## Write final dataset as table, w/o column names as requested
write.table(dataframe, "dataset-2.txt", row.names=F, col.names=F, quote=F)

