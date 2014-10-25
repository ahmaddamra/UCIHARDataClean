##
## This script is to load the Human Activity Recognition Using Smartphones Data Set 
## parse it, keep only the mean and standard deviation columns and calculate the 
## mean of each column
##
library(data.table)
library(plyr)
library(sqldf)
library(dplyr)


##
## check if the data set exists, if it does not then
## Download the project data set, expand it, and rename the folder to
## remove any spaces from the name
rm(list=ls())
##setwd("~/Coursera/0030-GettingCleaningData/UCIHARDataClean")

if (! file.exists("./UCIHARDataset/test/X_test.txt")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile="./UCIHARDataset.zip", method="curl")
  unzip("./UCIHARDataset.zip", files = NULL, list = FALSE, overwrite = TRUE,
        junkpaths = FALSE, exdir = ".", unzip = "internal",
        setTimes = FALSE)
  file.rename("UCI HAR Dataset", "UCIHARDataset")
}

##
## Assignment steps:
## 1. Merges the training and the test sets to create one data set.

## Load Activity Codes data set
activitylabels <- read.table("./UCIHARDataset/activity_labels.txt")

loaddataset <- function(subjectFile, yFile, xFile, activitylabels){
  ##
  ## this functions loads the x_ file which contains the test data
  ## y_ file which contains the activities
  ## subject_ file which contains the volunteer subject information
  ## activity laeblels data set 
  
  tempsubject <- read.table(subjectFile)
  tempactivities <- read.table(yFile)
  tempset <- read.table(xFile)
  
  ##  
  ## Assignment task
  ## 3. Uses descriptive activity names to name the activities in the data set
  ##    use activity labels instead of activity codes
  tempactivities1 <- merge(tempactivities, activitylabels, by="V1")
  tempactivities2 <- plyr::rename(tempactivities1, c("V1"="ActivityCode", "V2"="ActivityName"))
  
  rm(list=c("tempactivities","tempactivities1"))
  
  tempsubject1 <- plyr::rename(tempsubject, c("V1"="Volunteer"))
  
  ##
  ## Combine the subject info, activities, readings data sets
  ## to create one full data set
  tempds <- cbind(tempsubject1, tempactivities2, tempset)
  
  ## Clean up intermediate data sets
  rm(list=c("tempsubject", "tempsubject1","tempactivities2","tempset"))
  return(tempds)
  
}

##
## Load and prepare the test data set
testds <- loaddataset("./UCIHARDataset/test/subject_test.txt", "./UCIHARDataset/test/y_test.txt", "./UCIHARDataset/test/X_test.txt", activitylabels)


##
## Load and prepare the train data set
trainds <- loaddataset("./UCIHARDataset/train/subject_train.txt", "./UCIHARDataset/train/y_train.txt", "./UCIHARDataset/train/X_train.txt", activitylabels)


combinedds <- rbind(testds,trainds)

rm(list=c("testds","trainds"))

##
## Assignment task
## 4. Appropriately labels the data set with descriptive variable names. 
## Give columns proper names as per the features.txt file

readingsnames <- read.table("./UCIHARDataset/features.txt")
colnames <- append(c("Volunteer", "ActivityCode", "ActivityName"), as.vector(readingsnames$V2))
length(colnames)
setnames(combinedds, names(combinedds), colnames )

##
## Assignment task
##   2. Extracts only the measurements on the mean and standard deviation for each measurement. 

meanstddevcols <- sqldf("select V2 from readingsnames where V2 like '%mean()%' OR V2 like '%std()%'")
keepcols <- append(c("Volunteer", "ActivityName"), as.vector(meanstddevcols$V2))
ucihards <- combinedds[keepcols]

keepcols <- gsub("^t", "Time", keepcols)
keepcols <- gsub("^f", "Fourier", keepcols)
keepcols <- gsub("-X", "XAxis", keepcols)
keepcols <- gsub("-Y", "YAxis", keepcols)
keepcols <- gsub("-Z", "ZAxis", keepcols)
keepcols <- gsub("Acc", "Accelerator", keepcols)
keepcols <- gsub("Mag", "Magnitude", keepcols)
keepcols <- gsub("Jerk", "JerkSignal", keepcols)
keepcols <- gsub("Gyro", "Gyroscope", keepcols)
keepcols <- gsub("-mean\\(\\)", "Mean", keepcols)
keepcols <- gsub("-std\\(\\)", "StdDev", keepcols)
setnames(ucihards, names(ucihards), keepcols )
rm(list=c("meanstddevcols", "colnames", "keepcols",  "combinedds"))

##
## Assignment task
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

keeptbldf <- tbl_df(ucihards)
tidyds <-
  keeptbldf %>%
  group_by(ActivityName, Volunteer) %>%
  summarise_each(funs(mean))

## use meaningfull names
colnames <- names(tidyds)
colnames <- colnames[! colnames %in% c("Volunteer","ActivityName")]

colnames <- gsub("^", "MeanOf", colnames)
colnames <- append(c("Volunteer", "ActivityName"), colnames)
setnames(tidyds, names(tidyds), colnames )
rm("keeptbldf", "readingsnames", "colnames")

##
## write tinydata set to file as per assignment
write.table(tidyds, file = "./tidyds.txt", row.name=FALSE)

