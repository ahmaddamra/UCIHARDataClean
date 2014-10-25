---
title: "README"
author: "Ahmad Damra"
date: "10/22/2014"
output: html_document
---

## Introduction
This project is the course project for the Getting and Cleaning Data class that is part of the Johns Hopkins University Data Science Specialization offered through coursera.org

The project uses the Human Activity Recognition Using Smartphones Data Set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), to demonstrate my ability to collect, work with, and clean a data set. Then produce a tidy data that can be used for later analysis.

The data for the project is downloaded from 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Requirements
The assignment requires the creation of one R script called run_analysis.R that: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The tidy data set is finaly written to a file tidyds.txt

## Code Description
The run_analysis.R script depends on the following libraries
* data.table
* plyr
* sqldf
* dplyr


The run_analysis.R file acomplishes the tasks above as follows:
1. clean the environment by removing any variables to avoid any conflicts
2. Checks if the data files do not exist then download and expand them in the current working director. It stores the data in "UCIHARDataset" folder. This was done to ease dealing with the data on Linux which is my environment.
3. Create a function loaddataset that loads both the test and train data sets. It has four parameters:
  * The function accomplishes tasks 1 and 3
    + Task 1 - partial load and setup each of the test and train data sets
    + Assignment task 3 - Uses descriptive activity names to name the activities in the data set 
  * Parameters:
    + subjectFile  contains the volunteer subject information
    + yFile contains the activities
    + xFile contains the test data
    + activitylabels - activity laeblels data set pre loaded before calling the function 
  * Logic
    + Load the three data files
    + Use Activity names by merging activity labels data set with the yfile
    + Use Set the column names in yfile data set to "ActivityCode", "V2"="ActivityName" and subjectfile to "Volunteer"
    + combine column wise the three data sets into one data set and return it
4. Combine row wise the two data sets generated for train and test data.
  + Assignment Task 1 - Merges the training and the test sets to create one data set.
5. Get the column names from the features.txt file and assign them to the appropriate columns in the combined data set
  + Assignment Task 4 - Appropriately labels the data set with descriptive variable names. 
6. Drop all columns that do not have mean() or std() and properly rename the remaining columns.
  + Assignment Task 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
7. Generate a tidy data set with the average of each variable for each activity and each subjec.
  + Assignment Task 5 -  creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to run the code
To execute the project. 
1. Download the script run_analysis.R.
2. Place in a folder on your drive. e.g ~/proj
3. from the command line (if on Linux) run the following command (the output will be stored in run_analysis.out file and a data file tidyds.txt was created)
  R CMD BATCH -q run_analysis.R run_analysis.out