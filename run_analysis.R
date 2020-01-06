# Getting and Cleanning Data - Project
# Sebastian Leal
# Precondition: You have the data in "data" subfolder

# inclusion of libraries
library(dplyr)
library(magrittr)

### Before starting with the items, read all the data and put it into data frame

# Read main activities and features 
activities   <- read.table("./data/activity_labels.txt", col.names = c("id_activity", "activity"))
features     <- read.table("./data/features.txt",        col.names = c("id_feature", "feature")) 
# Clean up feature names
features$feature %<>%
  gsub("\\(\\)", "", .) %>%
  gsub(",",      "", .) %>%
  gsub("-",      "", .)

# Read TEST data
subjectTest <- read.table("./data/test/subject_test.txt", col.names = "subject")
xTest <- read.table("./data/test/X_test.txt", col.names = features$feature)
yTest <- read.table("./data/test/y_test.txt", col.names = "id_activity")

# Read TRAIN data
subjectTrain <- read.table("./data/train/subject_train.txt", col.names = "subject")
xTrain <- read.table("./data/train/X_train.txt", col.names = features$feature)
yTrain <- read.table("./data/train/y_train.txt", col.names = "id_activity")


# 1. Merges the training and the test sets to create one data set.

allX <- rbind(xTrain, xTest)
allY <- rbind(yTrain, yTest)
allSubjects <- rbind(subjectTrain, subjectTest)
allData <- cbind(allSubjects, allY, allX)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanAndStdDevData <- allData %>% select(subject, id_activity, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set
meanAndStdDevData$activityName <- activities[meanAndStdDevData$id_activity, 2]
meanAndStdDevData <- subset(meanAndStdDevData, select = -c(id_activity))

# 4. Appropriately labels the data set with descriptive variable names.
# Already done at the beginning

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
finalData <- meanAndStdDevData %>%
  group_by(subject, activityName) %>%
  summarise_all(funs(mean))
write.table(finalData, "./final_data.txt", row.name = FALSE, sep = "\t")
