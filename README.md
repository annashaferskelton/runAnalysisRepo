#Readme for tidyFrame.txt

- tidyFrame.txt was created using the data found in the UCI HAR dataset folder.

- created using run_analysis.R

- *run_analysis.R will run properly if it is placed in the same directory as the UCI HAR dataset folder is placed in.*

- tidyFrame.txt uses the wide form of the data, which is accepted as a tidy form of the data (see https://class.coursera.org/getdata-015/forum/thread?thread_id=27#post-49 and https://class.coursera.org/getdata-015/forum/thread?thread_id=26#post-48). I chose to use this form so all measures were visible in the top of the file.

- It is important to note that all values in tidyFrame.txt are averaged across all the values created for a given subject and activity.


## Steps to create tidyFrame.txt

### Step 0: Change directories and load the data.
- The script will run properly if it is placed in the same directory as the folder "UCI HAR Dataset". 
- It first sets the working directory to be the UCI HAR Dataset folder. This remains the working directory for the entire script.
- Next, there is a variable "loadTables" that either gets set to 1 or 0. It should be set to 1 if you have not yet loaded the tables and 0 if you already have. This helps the program run faster if you are running multiple times and only want to load the data once.
- Files from the "train" folder: X_train.txt, y_train.txt, subject_train.txt.
- Files read from the "test" folder: X_test.txt, y_test.txt, subject_test.txt.
- Files read straight from the UCI HAR Dataset folder: features.txt, activity_labels.txt

### Step 1: Merge the training and the test sets.
- rbind is used to merge data, subject numbers, and activities from the training and test sets.
- cbind is used to merge subject numbers, activities, and the rest of the data (in that order)
- While ambiguous in the instructions, I add column labels at this stage as well. This is unnecessary to get the correct result but assisted in trouble-shooting while writing the script.
- This produces the data frame mergedData.

### Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

After consulting features.txt and feature_info.txt, I came to the conclusion that *everything that contained the string "mean" or the string "std" was a mean or standard deviation*. Even though meanFreq was
a different type of mean than the "mean()" mean, I included it because it fit the requirements of "measurements on the mean and standard deviation". 
In addition, in this pinned post: 
https://class.coursera.org/getdata-015/forum/thread?thread_id=26#post-48
a community TA says "There are no specific marking criteria on the number of columns. It is up to you to make a decision and explain what you did to the data." This implies that in grading this section of the code, we are supposed to judge whether what the code does is clearly explained rather than which criterion was chosen.

- I selected the measurements I wanted by using the grepl function to test whether the strings "mean" or "std" were contained in each of the column names.
- Using a logical index, I kept only the columns with those strings included.
- This produces the data frame meanAndSdMeasurements.

### Step 3: Use descriptive activity names to name the activities in the dataset.

- This section of the script uses the numbers in the meanAndSdMeasurements$activities array to index into the second row of activity labels and get the name for each number.
- It re-sets meanAndSdMeasurements$activities to the new column containing names.

### Step 4: Appropriately label the dataset with descriptive variable names.


- While it is ambiguous whether we are required to rename the column names, according to the answer to this post:
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

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- I used "aggregate" to take the mean of each combination of Subject.Numbers and Activities. (no library call is required for this)
- This results in a 180 x 81 dataset, which is the wide form of the tidy data set. Please see info at top for justification for why the wide form is tidy.
- I had to rename the Subject.Numbers and Activities columns by hand since "aggregate" renamed them.
- I used write.table to save the result as "tidyFrame.txt", with the only option specified being "row.name=FALSE", as instructed.



