# This CodeBook describes the analysis of the Human Activity Recognition Data (HAR Data) from UCI
### This analysis is part of the JHU Getting and Cleaning Data Coursera assignment



---
title: "CodeBook"
author: "RDashora"
date: "November 15, 2015"
output: html_document
---

=============================================================================================================================


1) **Download the Dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and UNZIP**

2) Dataset is comprized of information from UCI

  ++ The Full Dataset includes the following files:

      + 'README.txt'
      + 'features_info.txt': Shows information about the variables used on the feature vector.
      + 'features.txt': List of all features.
      + 'activity_labels.txt': Links the class labels with their activity name.
      + 'train/X_train.txt': Training set.
      + 'train/y_train.txt': Training labels.
      + 'test/X_test.txt': Test set.
      + 'test/y_test.txt': Test labels.

  ++ For each record it is provided:

      + Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
      + Triaxial Angular velocity from the gyroscope. 
      + A 561-feature vector with time and frequency domain variables. 
      + Its activity label. 
      + An identifier of the subject who carried out the experiment.


3) Take time to read the README File from dataset

4) features.txt is a list  of all the feature columns available on the X_Train.txt and X_test.Txt files.

5) the y_test.txt and y_train.txt files are the list of activity codes from participent in the study.

6) activity_labels.txt is a list of actvities for which the measurements was performed

7) subject_test.txt and subjest_train.txt are the list of Subjects who participated on the study

8) process the file using the run_analysis.R file in the REPO

9) As part of JHU Assignement we are only interested in the mean and standard deviation reading of the feature matrix

10) We will be combining the 2 separate datasets into one and process the larger tidy dataset

11) we would also provide proper column headings and produce a group/summarize the data over Subject and Activity.

================================================================================================


### Association between Datasets

1) X_Test and X_Train are the actual measurement files
2) y_test and y_train are the list of activity code (lookup dataset activity_labels.txt) of the participent
3) Each line of y_test is associated with corresponding line on the X_test readings file
4) subject_test.txt is the list of Subjects who participated on the study
5) Each line of subject_test is associated with corresponding line on the X_test readings file
6) Same association is for the Training Datasets.

### R Analysis Script

** run_analysis.R

    * Read the Test Dataset first
    * Apply the Column Headings from the features.txt file
    * Tidy up Test Dataset by using columns with mean/std functions
    * Connect the Data using CBind
    * Repeat the process for Train Dataset
    * Combine the Train and Test Dataset using RBind
    * Using Groupby and Summarize prepare the FinalTidyData
    * Apply Scientific formatting for readable output format
    * write the Dataset to a file
    
===============================================================================================  

