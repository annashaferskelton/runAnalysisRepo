# Rubric states that this file should be able to run as long as Samsung data 
# is in working directory (i.e. doesn't require that the script download the 
# file). However, I am including a download.file() 
# command here anyway so it is clear where the data came from (commented 
# out so it won't slow down the script once the file is already 
# downloaded).

# download file
# url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url,destfile="samsungData.zip",method="curl")
# zipFile <- "samsungData.zip"
# unzip(zipFile)

# --------------------------------------------------------
# IT IS ASSUMED THAT THE UCI FOLDER IS IN THE SAME 
# DIRECTORY AS THIS SCRIPT.
# --------------------------------------------------------

# ANNA!!!! UNCOMMENT THIS BEFORE SUBMITTING!!!!
# ANNA: link to article/discussion thread saying the wide form of the 
# data is tidy in my readme (per David's main post).
subdir <- "UCI HAR Dataset"
setwd(subdir) # This gets you into the directory that was downloaded.

# --------------------------------------------------------
# Step 1: Merge training and test sets to create one data set.
# --------------------------------------------------------

loadTables <- 1 # set this variable equal to 0 if you don't want to reload data
# every time you run the script.

# a) load tables.
if(loadTables){
  trainSet <- read.table('train/X_train.txt') # dim: 7352 x 561
  testSet <- read.table('test/X_test.txt') # dim: 2947 x 561
  trainLabels <- read.table('train/y_train.txt')
  testLabels <- read.table('test/y_test.txt')
  subjectTrain <- read.table('train/subject_train.txt') # dim: 7352 x 1
  subjectTest <- read.table('test/subject_test.txt') # dim: 2947 x 1
  features <- read.table('features.txt') # dim: 561 x 1
  activityLabels <- read.table('activity_labels.txt') # dim: 6 x 2
}

# b) combine data together.
trainAndTestData <- rbind(trainSet,testSet) # combine data for train and test.
allSubjNums <- rbind(subjectTrain,subjectTest) # combine subject IDs for train and test.
allActivities <- rbind(trainLabels,testLabels) # combine activity numbers for train and test.
mergedData <- cbind(allSubjNums,allActivities,trainAndTestData) # combine subjNum and activity columns with rest of data.

# c) add column names to merged data.
featureNames <- as.character(features[,2])
columnNames <- c("subjNums","activities",featureNames)
colnames(mergedData) <- columnNames



# --------------------------------------------------------
# Step 2: Extract only the measurements on the mean and 
# standard deviation for each measurement.
# --------------------------------------------------------

# After consulting features.txt and feature_info.txt, I came to the
# conclusion that everything that contained the string "mean" or the 
# string "std" was a mean or standard deviation. Even though meanFreq was
# a different type of mean than the "mean()" mean, I included it because
# it fit the requirements of "measurements on the mean and standard deviation". 
# In addition, in this pinned post: 
# https://class.coursera.org/getdata-015/forum/thread?thread_id=26#post-48
# a community TA says "There are no specific marking criteria on the 
# number of columns. It is up to you to make a decision and explain what you 
# did to the data." This implies that the point of grading this is to
# make sure the code is clear rather than to take points off for one decision 
# or the other.

columnsToKeep <- array(data=NA,dim=length(columnNames))
for(n in 1:length(columnNames)){
  # The below value is TRUE if the column name contains the string "mean"
  # Using these to make an array with a TRUE for every column I want to keep.
  isMean <- grepl('mean',columnNames[n]) 
  isSd <- grepl('std',columnNames[n]) 
  isSubjNum <- grepl(columnNames[n],'subjNums')
  isActivity <- grepl(columnNames[n],'activities')
  
  # the below array is an array with a TRUE for every column I want to keep.
  columnsToKeep[n] <- isMean || isSd || isSubjNum || isActivity
}

# Make new array whose only measurements are mean and sd measurements
# (Note that since "subjNum" and "activities" are not measurements,
# we are allowed to keep them.)
meanAndSdMeasurements <- mergedData[,columnsToKeep] 



# --------------------------------------------------------
# Step 3: Use descriptive activity names to name the 
# activities in the dataset.
# --------------------------------------------------------

# Uses the numbers in the meanAndSdMeasurements$activities array to index into 
# the second row of activity labels and get the name for each number.

meanAndSdMeasurements$activities <- activityLabels[meanAndSdMeasurements$activities,2]



# --------------------------------------------------------
# Step 4: Appropriately label the dataset with descriptive
# variable names.
# --------------------------------------------------------

# according to the answer to this post:
# https://class.coursera.org/getdata-015/forum/thread?thread_id=26#post-970
# ... , it looks like we need to rename the variables for the dataset, i.e. 
# the column names.

# From this post: 
# https://class.coursera.org/getdata-015/forum/thread?thread_id=26#post-48
# Explanation of what a descriptive name is: "Descriptive variable names 
# means names based on the action the variable is recording, for example 
# the Jerk of the body on the z axis of the phone. In general, the more 
# descriptive is going to be the better.

# see code book for more detailed info, but:
# The names are descriptive because I've broken out obscure parts of the 
# names like "f" and "t" into English words/abbreviations.

# - "accelerometer/gyroscope" refers to where a given variable originated
# (this corresponds to the "Acc" or "Gyro" in the original names.)
# - the "acc" in many variable names just refers to the fact that these data
# are acceleration data and DOES NOT correspond to the "acc" in the original
# names.
# - Body/Grav refers to whether the acceleration measured is from the body
# or from gravity
# "frequencyDomain" or "timeDomain" corresponds to the "f" or "t" in the 
# original data.

descriptiveVariableNames <- c(
  "Subject.Numbers",
  "Activities",
  "Mean.BodyAcc.XDir-accelerometer-timeDomain",
  "Mean.BodyAcc.YDir-accelerometer-timeDomain",
  "Mean.BodyAcc.ZDir-accelerometer-timeDomain",
  "Std.BodyAcc.XDir-accelerometer-timeDomain",
  "Std.BodyAcc.YDir-accelerometer-timeDomain",
  "Std.BodyAcc.ZDir-accelerometer-timeDomain", # name number 8
  "Mean.GravAcc.XDir-accelerometer-timeDomain",
  "Mean.GravAcc.YDir-accelerometer-timeDomain",
  "Mean.GravAcc.ZDir-accelerometer-timeDomain",
  "Std.GravAcc.XDir-accelerometer-timeDomain",
  "Std.GravAcc.YDir-accelerometer-timeDomain",
  "Std.GravAcc.ZDir-accelerometer-timeDomain", # name number 14
  "Mean.BodyJerk.XDir-accelerometer-timeDomain",
  "Mean.BodyJerk.YDir-accelerometer-timeDomain",
  "Mean.BodyJerk.ZDir-accelerometer-timeDomain",
  "Stdev.BodyJerk.XDir-accelerometer-timeDomain",
  "Stdev.BodyJerk.YDir-accelerometer-timeDomain",
  "Stdev.BodyJerk.ZDir-accelerometer-timeDomain", # name number 20
  "Mean.BodyAcc.XDir-gyroscope-timeDomain",
  "Mean.BodyAcc.YDir-gyroscope-timeDomain",
  "Mean.BodyAcc.ZDir-gyroscope-timeDomain",
  "Std.BodyAcc.XDir-gyroscope-timeDomain",
  "Std.BodyAcc.YDir-gyroscope-timeDomain",
  "Std.BodyAcc.ZDir-gyroscope-timeDomain", # name number 26
  "Mean.BodyJerk.XDir-accelerometer-timeDomain",
  "Mean.BodyJerk.YDir-accelerometer-timeDomain",
  "Mean.BodyJerk.ZDir-accelerometer-timeDomain",
  "Std.BodyJerk.XDir-accelerometer-timeDomain",
  "Std.BodyJerk.YDir-accelerometer-timeDomain",
  "Std.BodyJerk.ZDir-accelerometer-timeDomain", # name number 32
  "Mean.BodyAccMag-accelerometer-timeDomain",
  "Std.BodyAccMag-accelerometer-timeDomain",
  "Mean.GravityAccMag-accelerometer-timeDomain",
  "Std.GravityAccMag-accelerometer-timeDomain", # name number 36
  "Mean.BodyJerkMag-accelerometer-timeDomain",
  "Std.BodyJerkMag-accelerometer-timeDomain", # name number 38
  "Mean.BodyAccMag-gyroscope-timeDomain",
  "Std.BodyAccMag-gyroscope-timeDomain",
  "Mean.BodyJerkMag-gyroscope-timeDomain",
  "Std.BodyJerkMag-gyroscope-timeDomain", # name number 42
  "Mean.BodyAcc.XDir-accelerometer-frequencyDomain",
  "Mean.BodyAcc.YDir-accelerometer-frequencyDomain",
  "Mean.BodyAcc.ZDir-accelerometer-frequencyDomain",
  "Std.BodyAcc.XDir-accelerometer-frequencyDomain",
  "Std.BodyAcc.YDir-accelerometer-frequencyDomain",
  "Std.BodyAcc.ZDir-accelerometer-frequencyDomain", # name number 48
  "MeanFreq.BodyAcc.XDir-accelerometer-frequencyDomain",
  "MeanFreq.BodyAcc.YDir-accelerometer-frequencyDomain",
  "MeanFreq.BodyAcc.ZDir-accelerometer-frequencyDomain", # name number 51
  "Mean.BodyJerk.XDir-accelerometer-frequencyDomain",
  "Mean.BodyJerk.YDir-accelerometer-frequencyDomain",
  "Mean.BodyJerk.ZDir-accelerometer-frequencyDomain", # name number 54
  "Std.BodyJerk.XDir-accelerometer-frequencyDomain",
  "Std.BodyJerk.YDir-accelerometer-frequencyDomain",
  "Std.BodyJerk.ZDir-accelerometer-frequencyDomain", # name number 57
  "MeanFreq.BodyJerk.XDir-accelerometer-frequencyDomain",
  "MeanFreq.BodyJerk.YDir-accelerometer-frequencyDomain",
  "MeanFreq.BodyJerk.ZDir-accelerometer-frequencyDomain", # name number 60
  "Mean.BodyAcc.XDir-gyroscope-frequencyDomain",
  "Mean.BodyAcc.YDir-gyroscope-frequencyDomain",
  "Mean.BodyAcc.ZDir-gyroscope-frequencyDomain", # name number 63
  "Std.BodyAcc.XDir-gyroscope-frequencyDomain",
  "Std.BodyAcc.YDir-gyroscope-frequencyDomain",
  "Std.BodyAcc.ZDir-gyroscope-frequencyDomain", # name number 66
  "MeanFreq.BodyAcc.XDir-gyroscope-frequencyDomain",
  "MeanFreq.BodyAcc.YDir-gyroscope-frequencyDomain",
  "MeanFreq.BodyAcc.ZDir-gyroscope-frequencyDomain", # name number 69
  "Mean.BodyAccMag-accelerometer-frequencyDomain",
  "Std.BodyAccMag-accelerometer-frequencyDomain", # 71
  "MeanFreq.BodyAccMag-accelerometer-frequencyDomain", #72
  "Mean.BodyJerkMag-accelerometer-frequencyDomain", # name number 73
  "Std.BodyJerkMag-accelerometer-frequencyDomain", #74
  "MeanFreq.BodyJerkMag-accelerometer-frequencyDomain", #75
  "Mean.BodyAccMag-gyroscope-frequencyDomain",
  "Std.BodyAccMag-gyroscope-frequencyDomain",
  "MeanFreq.BodyAccMag-gyroscope-frequencyDomain", #78
  "Mean.BodyJerkMag-gyroscipe-frequencyDomain",
  "Std.BodyJerkMag-gyroscope-frequencyDomain", #80
  "MeanFreq.BodyJerkMag-gyroscope-frequencyDomain")

colnames(meanAndSdMeasurements) <- descriptiveVariableNames


# --------------------------------------------------------
# Step 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.
# --------------------------------------------------------

numCols <- length(meanAndSdMeasurements)
myList <- list(meanAndSdMeasurements$Subject.Numbers,meanAndSdMeasurements$Activities)
tidyFrame <- aggregate(meanAndSdMeasurements[,3:numCols],by=myList,FUN=mean)

# Rename first 2 columns bc aggregate renames them.
colnames(tidyFrame)[1:2] <- c("Subject.Numbers","Activities")

# write as table so I can upload to project submission
write.table(tidyFrame,file="tidyFrame.txt",row.name=FALSE)
