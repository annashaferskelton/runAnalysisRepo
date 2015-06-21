# Code book: tidy_frame.txt
- (created using run_analysis.R; see README for more information.)
- Included in this repo: run_analysis.R
- README
- tidyFrame_CodeBook (this document)



### Info about original data: 

Data modified from: Human Activity Recognition Using Smartphones Dataset Version 1.0

Original authors: 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



### Tidied data created by AS (6/21/15)


RATIONALE FOR DESCRIPTIVE VARIABLE NAMES

- General info: - While it is ambiguous whether we are required to rename the column names, according to the answer to this post:
https://class.coursera.org/getdata-015/forum/thread?thread_id=26#post-970 
it looks like it would make the dataset tidier.
- From this post: 
https://class.coursera.org/getdata-015/forum/thread?thread_id=26#post-48
Explanation of what a descriptive name is: "Descriptive variable names means names based on the action the variable is recording, for example the Jerk of the body on the z axis of the phone. In general, the more 
descriptive is going to be the better.
- It is important to note that we are not required to use a name that long, we are just required to * base * our names on names with that amount of info.
- see code book for more detailed info, but:
- THE NAMES ARE DESCRIPTIVE BECAUSE I'VE BROKEN OUT OBSCURE PARTS OF THE ORIGINAL NAMES LIKE "f" AND "t" AND CHANGED THEM INTO ENGLISH WORDS OR MORE DESCRIPTIVE ABBREVIATIONS.
- "accelerometer/gyroscope" refers to where a given variable originated: an accelerometer or a gyroscipe(this corresponds to the "Acc" or "Gyro" in the original names.)
- the "acc" in many variable names just refers to the fact that these data are acceleration data and DOES NOT correspond to the "acc" in the original names or imply that the data were recorded with an accelerometer.
- Body/Grav refers to whether the acceleration measured is from the body or from gravity
- "frequencyDomain" or "timeDomain" corresponds to the "f" or "t" in the original data.


INDIVIDUAL VARIABLES:
* all information about units and data collection can be found in the information above about the original dataset.* 

* also note that all variables here are aggregated means of their respective measurement types. That means that for each measurement variable described below, the data are means of many measurements for a given subject and activity type.* 


"Subject.Numbers"
- numbers identifying each subject who participated in the study

"Activities"
- strings identifying each of the activities subjects could be performing.

"Mean.BodyAcc.XDir-accelerometer-timeDomain"
- Mean acceleration of the body in the X direction, recorded with an accelerometer and in the time domain.

"Mean.BodyAcc.YDir-accelerometer-timeDomain"
- Mean acceleration of the body in the Y direction, recorded with an accelerometer and in the time domain.

"Mean.BodyAcc.ZDir-accelerometer-timeDomain"
- Mean acceleration of the body in the Z direction, recorded with an accelerometer and in the time domain.

"Std.BodyAcc.XDir-accelerometer-timeDomain"
- Std deviation of acceleration of the body in the X direction, recorded with an accelerometer and in the time domain. 

"Std.BodyAcc.YDir-accelerometer-timeDomain"
- Standard deviation of acceleration of the body in the Y direction, recorded with an accelerometer and in the time domain.

"Std.BodyAcc.ZDir-accelerometer-timeDomain"
- Standard deviation of acceleration of the body in the Z direction, recorded with an accelerometer and in the time domain. 

"Mean.GravAcc.XDir-accelerometer-timeDomain"
- Mean of acceleration from gravity in the x direction, recorded with an accelerometer and in the time domain.

"Mean.GravAcc.YDir-accelerometer-timeDomain"
- Mean of acceleration from gravity in the Y direction, recorded with an accelerometer and in the time domain. 

"Mean.GravAcc.ZDir-accelerometer-timeDomain"
- Mean of acceleration from gravity in the Z direction, recorded with an accelerometer and in the time domain. 

"Std.GravAcc.XDir-accelerometer-timeDomain"
- Standard deviation of acceleration from gravity in the X direction, recorded with an accelerometer and in the time domain. 

"Std.GravAcc.YDir-accelerometer-timeDomain"
- Standard deviation of acceleration from gravity in the Y direction, recorded with an accelerometer and in the time domain.

"Std.GravAcc.ZDir-accelerometer-timeDomain"
- standard deviation of acceleration from gravity in the Z direction, recorded with an accelerometer and in the time domain.

"Mean.BodyJerk.XDir-accelerometer-timeDomain"
- Mean of acceleration from body jerk, in the X direction, recorded with an accelerometer and in the time domain.

"Mean.BodyJerk.YDir-accelerometer-timeDomain"
- Mean of acceleration from body jerk, in the Y direction, recorded with an accelerometer and in the time domain.

"Mean.BodyJerk.ZDir-accelerometer-timeDomain"
- Mean of acceleration from body jerk, in the Z direction, recorded with an accelerometer and in the time domain.

"Stdev.BodyJerk.XDir-accelerometer-timeDomain"
-Standard devation of acceleration from body jerk, in the X direction, recorded with an accelerometer and in the time domain.

"Stdev.BodyJerk.YDir-accelerometer-timeDomain"
- Standard deviation of acceleration from body jerk, in the Y direction, recorded with an accelerometer and in the time domain.

"Stdev.BodyJerk.ZDir-accelerometer-timeDomain"
- Standard deviation of body jerk in the Z direction, recorded with an accelerometer and in the time domain.

"Mean.BodyAcc.XDir-gyroscope-timeDomain" 
- Mean of body acceleration in the X direction, recorded with a gyroscope and in the time domain.

"Mean.BodyAcc.YDir-gyroscope-timeDomain"
- Mean of acceleration of the body in the Y direction, recorded with a gyroscope and in the time domain.

"Mean.BodyAcc.ZDir-gyroscope-timeDomain"
- Mean of acceleration of the body in the Z direction, recorded with a gyroscope and in the time domain.

"Std.BodyAcc.XDir-gyroscope-timeDomain"
- Standard devation of acceleration of the body in the X direction, recorded with a gyroscope and in the time domain.

"Std.BodyAcc.YDir-gyroscope-timeDomain"
- Standard deviation of acceleration of the body in the Y direction, recorded with a gyroscope and in the time domain.

"Std.BodyAcc.ZDir-gyroscope-timeDomain"
- Standard devation of acceleration of the body in the Z direction, recorded with a gyroscope and in the time domain.

"Mean.BodyJerk.XDir-accelerometer-timeDomain"
- Mean of body jerk in the X direction, recorded with an accelerometer and in the time domain.

"Mean.BodyJerk.YDir-accelerometer-timeDomain"
- Mean of body jerk in the Y direction, recorded with an accelerometer and in the time domain.

"Mean.BodyJerk.ZDir-accelerometer-timeDomain"
- Mean of body jerk in the Z direction, recorded with an accelerometer and in the time domain.

"Std.BodyJerk.XDir-accelerometer-timeDomain"
- Standard devation of body jerk in the X direction, recorded with an accelerometer and in the time domain.

"Std.BodyJerk.YDir-accelerometer-timeDomain"
- Standard deviation of body jerk in the Y direction, recorded with an accelerometer and in the time domain.

"Std.BodyJerk.ZDir-accelerometer-timeDomain"
- Standard deviation of body jerk in the Z direction, recorded with an accelerometer and in the time domain.

"Mean.BodyAccMag-accelerometer-timeDomain"
- Mean of body acceleration magnitude (different directions combined), recorded with an accelerometer and in the time domain.

"Std.BodyAccMag-accelerometer-timeDomain"
- Standard deviation of body acceleration magnitude (different dimensions combined), recorded with an accelerometer and in the time domain.

"Mean.GravityAccMag-accelerometer-timeDomain"
- Mean of acceleration magnitude from gravity (different dimensions combined), recorded with an accelerometer and in the time domain.

"Std.GravityAccMag-accelerometer-timeDomain"
- Standard devation of acceleration magnitude from gravity (different dimensions combined), recorded with an accelerometer and in the time domain.

"Mean.BodyJerkMag-accelerometer-timeDomain"
- Mean of body jerk magnitude (different dimensions combined), recorded with an accelerometer and in the time domain.

"Std.BodyJerkMag-accelerometer-timeDomain"
- Standard deviation of body jerk magnitude (different dimensions combined) , recorded with an accelerometer and in the time domain.

"Mean.BodyAccMag-gyroscope-timeDomain"
- Mean of body acceleration magnitude (different dimensions combined), recorded with a gyroscope and in the time domain.

"Std.BodyAccMag-gyroscope-timeDomain"
- Standard devation of body acceleration magnitude (different dimensions combined), recorded with a gyroscope and in the time domain.

"Mean.BodyJerkMag-gyroscope-timeDomain"
- Mean of body jerk magnitude (different dimensions combined), recorded with a gyroscope and in the time domain.

"Std.BodyJerkMag-gyroscope-timeDomain"
- Standard deviation of body jerk magnitude (different dimensions combined), recorded with a gyroscope and in the time domain.

"Mean.BodyAcc.XDir-accelerometer-frequencyDomain"
- Mean of body acceleration in the X direction, recorded with a gyroscope and in the frequency domain.

"Mean.BodyAcc.YDir-accelerometer-frequencyDomain"
- Mean of body acceleration in the Y direction, recorded with an accelerometer and in the frequency domain.

"Mean.BodyAcc.ZDir-accelerometer-frequencyDomain"
- Mean of body acceleration in the Z direction, recorded with an accelerometer and in the frequency domain.

"Std.BodyAcc.XDir-accelerometer-frequencyDomain"
- Standard deviation of body acceleration in the X direction, recorded with an accelerometer and in the frequency domain.

"Std.BodyAcc.YDir-accelerometer-frequencyDomain"
- Standard devation of body acceleration in the Y direction, recorded with an accelerometer and in the frequency domain.

"Std.BodyAcc.ZDir-accelerometer-frequencyDomain"
- Standard deviation of body acceleration in the Z direction, recorded with an accelerometer and in the frequency domain.

"MeanFreq.BodyAcc.XDir-accelerometer-frequencyDomain"
- Mean of different frequencies of body acceleration in the X direction, recorded with an accelerometer and in the frequency domain.

"MeanFreq.BodyAcc.YDir-accelerometer-frequencyDomain"
- Mean of different frequencies of body acceleration in the Y direction, recorded with an accelerometer and in the frequency domain.

"MeanFreq.BodyAcc.ZDir-accelerometer-frequencyDomain"
- Mean of different frequencies of body acceleration in the Z direction, recorded with an accelerometer and in the frequency domain.

"Mean.BodyJerk.XDir-accelerometer-frequencyDomain"
- Mean of body jerk in the x direction, recorded with an accelerometer and in the frequency domain.

"Mean.BodyJerk.YDir-accelerometer-frequencyDomain"
- Mean of body jerk in the Y direction, recorded with an accelerometer and in the frequency domain.

"Mean.BodyJerk.ZDir-accelerometer-frequencyDomain"
- Mean of body jerk in the Z direction, recorded with an accelerometer and in the frequency domain.

"Std.BodyJerk.XDir-accelerometer-frequencyDomain"
- Standard deviation of body jerk in the X direction, recorded with an accelerometer and in the frequency domain.

"Std.BodyJerk.YDir-accelerometer-frequencyDomain"
- Standard deviation of body jerk in the Y direction, recorded with an accelerometer and in the frequency domain.

"Std.BodyJerk.ZDir-accelerometer-frequencyDomain"
- Standard deviation of body jerk in the Z direction, recorded with an accelerometer and in the frequency domain.

"MeanFreq.BodyJerk.XDir-accelerometer-frequencyDomain"
- Mean of different frequencies of body jerk in the X direction, recorded with an accelerometer and in the frequency domain.

"MeanFreq.BodyJerk.YDir-accelerometer-frequencyDomain"
- Mean of different frequencies of body jerk in the Y direction, recorded with an accelerometer and in the frequency domain.

"MeanFreq.BodyJerk.ZDir-accelerometer-frequencyDomain"
- Mean of different frequencies of body jerk in the Z direction, recorded with an accelerometer and in the frequency domain.

"Mean.BodyAcc.XDir-gyroscope-frequencyDomain"
- Mean of body acceleration in the X direction, recorded with a gyroscopoe and in the frequency domain.

"Mean.BodyAcc.YDir-gyroscope-frequencyDomain"
- Mean of body acceleration in the Y direction, recorded with a gyroscopoe and in the frequency domain.

"Mean.BodyAcc.ZDir-gyroscope-frequencyDomain"
- Mean of body acceleration in the Z direction, recorded with a gyroscopoe and in the frequency domain.

"Std.BodyAcc.XDir-gyroscope-frequencyDomain"
- Standard deviation of body acceleration in the X direction, recorded with a gyroscopoe and in the frequency domain.

"Std.BodyAcc.YDir-gyroscope-frequencyDomain"
- Standard deviation of body acceleration in the Y direction, recorded with a gyroscopoe and in the frequency domain.

"Std.BodyAcc.ZDir-gyroscope-frequencyDomain"
- Standard deviation of body acceleration, recorded with a gyroscopoe and in the frequency domain.

"MeanFreq.BodyAcc.XDir-gyroscope-frequencyDomain"
- Mean of different frequencies of body acceleration in the X direction, recorded with a gyroscopoe and in the frequency domain.

"MeanFreq.BodyAcc.YDir-gyroscope-frequencyDomain"
- Mean of different frequencies of body acceleration in the Y direction, recorded with a gyroscopoe and in the frequency domain.

"MeanFreq.BodyAcc.ZDir-gyroscope-frequencyDomain"
- Mean of different frequencies of body acceleration in the Z direction, recorded with a gyroscopoe and in the frequency domain.

"Mean.BodyAccMag-accelerometer-frequencyDomain"
- Mean of body acceleration magnitudes (different dimensions combined), recorded with an accelerometer and in the frequency domain.

"Std.BodyAccMag-accelerometer-frequencyDomain"
- Standard deviation of body acceleration magnitudes (different dimensions combined), recorded with an accelerometer and in the frequency domain.

"MeanFreq.BodyAccMag-accelerometer-frequencyDomain"
- Mean of different frequencies of body acceleration magnitude, recorded with an accelerometer and in the frequency domain.

"Mean.BodyJerkMag-accelerometer-frequencyDomain"
- Mean of of body jerk magnitude, recorded with an accelerometer and in the frequency domain.

"Std.BodyJerkMag-accelerometer-frequencyDomain"
- Standard deviation of body jerk magnitude, recorded with an accelerometer and in the frequency domain.

"MeanFreq.BodyJerkMag-accelerometer-frequencyDomain"
- Mean of different frequencies of body jerk magnitude, recorded with an accelerometer and in the frequency domain.

"Mean.BodyAccMag-gyroscope-frequencyDomain"
- Mean of the magnitude of body acceleration (different dimensions combined), recorded with a gyroscope and in the frequency domain.

"Std.BodyAccMag-gyroscope-frequencyDomain"
- Standard deviation of the magnitude of body acceleration (different dimensions combined), recorded with a gyroscope and in the frequency domain.

"MeanFreq.BodyAccMag-gyroscope-frequencyDomain"
- Mean of different frequencies of body acceleration magnitude (different dimensions combined), recorded with a gyroscope and in the frequency domain.

"Mean.BodyJerkMag-gyroscipe-frequencyDomain"
- Mean of body jerk magnitude (different dimensions combined), recorded with a gyroscope and in the frequency domain.

"Std.BodyJerkMag-gyroscope-frequencyDomain"
- Standard deviation of body jerk magnitude (different dimensions combined), recorded with a gyroscope and in the frequency domain.

"MeanFreq.BodyJerkMag-gyroscope-frequencyDomain")
- Mean of different frequencies of body jerk magnitude (different dimensions combined), recorded with a gyroscope and in the frequency domain.