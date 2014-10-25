---
title: "CodeBook.md"
author: "Ahmad Damra"
date: "10/22/2014"
output: html_document
---

This CodeBook describes the data sources in project, the transformations, and the data in the final data set.
The project data comes from the Human Activity Recognition Using Smartphones Data Set. It is an open source data set that was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Complete description of the activities and resulting data is available on the projects website 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data manipulation:


As well as David Hood's the FAQ 
https://class.coursera.org/getdata-008/forum/thread?thread_id=24

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. [1]

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. [1]

A tidy dataset that combines the test and training data provided was created. It was modeled to satisfy the Tidy data rules:

1. Each variable forms a column
In generating the tidy data set, The decision was made to treat the fields like  tBodyAcc-mean()-X as one variable rather than multiple variables that would need to be divided. It is possible for an action to change a y direction reading in the phone without changing a x or z direction reading.

The discussions in the class forums were very helpful in reaching such a conclusion especially comments made by David Hood one of the community TA's
https://class.coursera.org/getdata-008/forum/thread?thread_id=181
https://class.coursera.org/getdata-008/forum/thread?thread_id=94

The Activity Code was replaced with the Activity Name for more readability. The Subject id was also added to the data set as well. 

Only columns that had mean and standard deviation information for  each variable was kept from the readings. This reduced the number of columns down to 68.

The remaining columns were renamed to make them more readable and tidy.

2. Each observation forms a row
The rows that made both the train and test data were kept. The mean of all variables were calculated grouped by Activity Name, and Subject id.

3. Each type of observational unit forms a table
One table (data set) was created as it only contains variables that describe the observarion of one activity made by the subject.



## Attribute Information:
For each record in the dataset the following variables are provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

"Volunteer" - An identifier of the subject who carried out the experiment.
"ActivityName" -  Its activity label. 
The remaining columns provide the mean readings made for each Volunteer and Activity. The columns are named as follws:
The field starts with Meanof for the mean of the readings grouped by Volunteer and Activity
Followed by either Time to signify time domain signals or Fourier to signify frequency domain signals
Followed by on of four 
  * BodyAccelerator for acceleration signals
  * BodyAcceleratorJerkSignal for Jerk signals 
  * BodyGyroscope for Gyroscope signals
  * BodyGyroscopeJerkSignal for Gyroscope jerk signals
Followed by Magnitude when magnitude of these three-dimensional signals were calculated using the Euclidean norm.
Followed by Mean for the mean of the reading or Std for the Standard Deviation
Followed by XAxis, YAxis, or ZAxis for the Axis of the movement direction.

"MeanOfTimeBodyAcceleratorMeanXAxis" 
"MeanOfTimeBodyAcceleratorMeanYAxis" 
"MeanOfTimeBodyAcceleratorMeanZAxis" 
"MeanOfTimeBodyAcceleratorStdDevXAxis" 
"MeanOfTimeBodyAcceleratorStdDevYAxis" 
"MeanOfTimeBodyAcceleratorStdDevZAxis" 
"MeanOfTimeGravityAcceleratorMeanXAxis" 
"MeanOfTimeGravityAcceleratorMeanYAxis" 
"MeanOfTimeGravityAcceleratorMeanZAxis" 
"MeanOfTimeGravityAcceleratorStdDevXAxis" 
"MeanOfTimeGravityAcceleratorStdDevYAxis" 
"MeanOfTimeGravityAcceleratorStdDevZAxis" 
"MeanOfTimeBodyAcceleratorJerkSignalMeanXAxis" 
"MeanOfTimeBodyAcceleratorJerkSignalMeanYAxis" 
"MeanOfTimeBodyAcceleratorJerkSignalMeanZAxis" 
"MeanOfTimeBodyAcceleratorJerkSignalStdDevXAxis" 
"MeanOfTimeBodyAcceleratorJerkSignalStdDevYAxis" 
"MeanOfTimeBodyAcceleratorJerkSignalStdDevZAxis" 
"MeanOfTimeBodyGyroscopeMeanXAxis" 
"MeanOfTimeBodyGyroscopeMeanYAxis" 
"MeanOfTimeBodyGyroscopeMeanZAxis" 
"MeanOfTimeBodyGyroscopeStdDevXAxis" 
"MeanOfTimeBodyGyroscopeStdDevYAxis" 
"MeanOfTimeBodyGyroscopeStdDevZAxis" 
"MeanOfTimeBodyGyroscopeJerkSignalMeanXAxis" 
"MeanOfTimeBodyGyroscopeJerkSignalMeanYAxis" 
"MeanOfTimeBodyGyroscopeJerkSignalMeanZAxis" 
"MeanOfTimeBodyGyroscopeJerkSignalStdDevXAxis" 
"MeanOfTimeBodyGyroscopeJerkSignalStdDevYAxis" 
"MeanOfTimeBodyGyroscopeJerkSignalStdDevZAxis" 
"MeanOfTimeBodyAcceleratorMagnitudeMean" 
"MeanOfTimeBodyAcceleratorMagnitudeStdDev" 
"MeanOfTimeGravityAcceleratorMagnitudeMean" 
"MeanOfTimeGravityAcceleratorMagnitudeStdDev" 
"MeanOfTimeBodyAcceleratorJerkSignalMagnitudeMean" 
"MeanOfTimeBodyAcceleratorJerkSignalMagnitudeStdDev" 
"MeanOfTimeBodyGyroscopeMagnitudeMean" 
"MeanOfTimeBodyGyroscopeMagnitudeStdDev" 
"MeanOfTimeBodyGyroscopeJerkSignalMagnitudeMean" 
"MeanOfTimeBodyGyroscopeJerkSignalMagnitudeStdDev" 
"MeanOfFourierBodyAcceleratorMeanXAxis" 
"MeanOfFourierBodyAcceleratorMeanYAxis" 
"MeanOfFourierBodyAcceleratorMeanZAxis" 
"MeanOfFourierBodyAcceleratorStdDevXAxis" 
"MeanOfFourierBodyAcceleratorStdDevYAxis" 
"MeanOfFourierBodyAcceleratorStdDevZAxis" 
"MeanOfFourierBodyAcceleratorJerkSignalMeanXAxis" 
"MeanOfFourierBodyAcceleratorJerkSignalMeanYAxis" 
"MeanOfFourierBodyAcceleratorJerkSignalMeanZAxis" 
"MeanOfFourierBodyAcceleratorJerkSignalStdDevXAxis" 
"MeanOfFourierBodyAcceleratorJerkSignalStdDevYAxis" 
"MeanOfFourierBodyAcceleratorJerkSignalStdDevZAxis" 
"MeanOfFourierBodyGyroscopeMeanXAxis" 
"MeanOfFourierBodyGyroscopeMeanYAxis" 
"MeanOfFourierBodyGyroscopeMeanZAxis" 
"MeanOfFourierBodyGyroscopeStdDevXAxis" 
"MeanOfFourierBodyGyroscopeStdDevYAxis" 
"MeanOfFourierBodyGyroscopeStdDevZAxis" 
"MeanOfFourierBodyAcceleratorMagnitudeMean" 
"MeanOfFourierBodyAcceleratorMagnitudeStdDev" 
"MeanOfFourierBodyBodyAcceleratorJerkSignalMagnitudeMean" 
"MeanOfFourierBodyBodyAcceleratorJerkSignalMagnitudeStdDev" 
"MeanOfFourierBodyBodyGyroscopeMagnitudeMean" 
"MeanOfFourierBodyBodyGyroscopeMagnitudeStdDev" 
"MeanOfFourierBodyBodyGyroscopeJerkSignalMagnitudeMean" 
"MeanOfFourierBodyBodyGyroscopeJerkSignalMagnitudeStdDev"



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012