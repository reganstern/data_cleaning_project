## Working directory should be UCI HAR Dataset
## This script makes use of dplyr and data.table

library(data.table)
library(dplyr)

## Read in the feature files for test and train
## Select the columns that represent the mean and standard deviation data

features <- fread("./features.txt")

data <- fread("./test/X_test.txt", col.names = features$V2) %>% 
        rbind(fread("./train/X_train.txt", col.names = features$V2))

data <- data[, .SD, .SDcols= grep("mean|std", features$V2, value=T)]

## Read in the subject and activity data for test and train
## Create a data table that has the subject and activity name 

activityLabel <- fread("./activity_labels.txt")

subject <- fread("./test/subject_test.txt") %>% 
        rbind(fread("./train/subject_train.txt"))

activity <- fread("./test/y_test.txt") %>% 
        rbind(fread("./train/y_train.txt"))

data <- cbind(data.table(subject = subject$V1, 
                activityName = activityLabel[activity$V1]$V2), data) %>% 
                arrange(subject, activityName) 

## Create a data table with the average of each variable 
## for each activity and each subject.

data <- as.data.table(data)
names(data) <- gsub("\\()", "", names(data))

averageActivity <- data[, lapply(.SD, mean), by = activityName, .SDcols = data[,(3:81)]] %>%
                mutate(subject = NA)
num_cols <- length(names(averageActivity))
setcolorder(averageActivity, c(1, num_cols, seq(from=2, to=(num_cols - 1))))

averageSubject <- data[, lapply(.SD, mean), by = subject, .SDcols = data[,(3:81)]] %>%
                mutate(activityName = NA) %>%
                arrange(subject)
num_cols <- length(names(averageSubject))
setcolorder(averageSubject, c(num_cols, 1, seq(from=2, to=(num_cols - 1))))

averageDataSet <- rbind(averageActivity, averageSubject)

rm(list = c("activity", "activityLabel", "averageActivity",
            "averageSubject", "features", "subject", "num_cols"))