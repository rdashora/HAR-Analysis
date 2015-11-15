##
## This Script is to used to calculate the Average of MEAN() and STD() features 
## on the UCI Human Activity Recognition Using Smartphones Dataset (HAR Dataset)
##

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="HARDataset.zip", mode = "wb")
unzip("HARDataset.zip")

library(dplyr)

## Read the Features and Activities Datasets
Features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
Activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)

## Read and Process the Test Data
TestData <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, colClasses=as.vector(rep("double", 561L) ), numerals = c("warn.loss") )

## Set the Column Names to be Features Values
names(TestData) <- Features[,2]

## Select Only those Columns having Mean() and STD() in them (mean and standard deviation)
selectColumns <- sort( c( grep("mean\\(\\)", names(TestData) ), grep("std\\(\\)", names(TestData)  ) ) )
TestData <- TestData[, selectColumns]

## Read Subjects and Activities Dataset and assign proper Column Names
TestSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
TestActivity <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
names(TestSubjects) <- c("Subject")
names(TestActivity) <- c("Activity")

## Assign Activity Names
TestActivity <- mutate(TestActivity, ActivityLabel = Activities[TestActivity$Activity, "V2"])

## Combine the 3 Data datasets
FinalTestData <- cbind( TestSubjects, TestActivity, TestData )

## REPEAT the above process for Training Data

## Read and Process the Training Data
TrainData <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, colClasses=as.vector(rep("double", 561L) ), numerals = c("warn.loss") )

## Set the Column Names to be Features Values
names(TrainData) <- Features[,2]

## Select Only those Columns having Mean() and STD() in them (mean and standard deviation)
selectColumns <- sort( c( grep("mean\\(\\)", names(TrainData) ), grep("std\\(\\)", names(TrainData)  ) ) )
TrainData <- TrainData[, selectColumns]

## Read Subjects and Activities Dataset and assign proper Column Names
TrainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
TrainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
names(TrainSubjects) <- c("Subject")
names(TrainActivity) <- c("Activity")

## Assign Activity Names
TrainActivity <- mutate(TrainActivity, ActivityLabel = Activities[TrainActivity$Activity, "V2"])

## Combine the 3 Data datasets
FinalTrainData <- cbind( TrainSubjects, TrainActivity, TrainData )


## Combine Both the Datasets : Training & Testing
TidyData <- rbind(FinalTrainData, FinalTestData)

## Order the Dataset by Subject, Activity
TidyData <- TidyData[ order(TidyData$Subject, TidyData$Activity), ]

## Group by Subject, Activity & ActivityName
by_subj_act <- group_by(TidyData, Subject, Activity, ActivityLabel)

## Summarize
FinalTidyData <- summarise_each(by_subj_act, funs(mean))

## Format the Dataset for Writing
FinalTidyData <- format(FinalTidyData, scientific=T)
write.table(FinalTidyData, "FinalTidyData.txt", row.names = FALSE, quote=FALSE)