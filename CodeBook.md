# CodeBook

This code book tries to explain in detail how the raw sensor data was cleaned. This aims to help replicate the procedure for future enthusiasts in using and tidying this data. 

## Source of Raw Data

* Download the zip file here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Information on the Raw Data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## More Information about the Data
The data comes from smartphone users of Samsung Galaxy S II who are wearing their smartphones during exercise. Six types of activities were recorded in the dataset, namely: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. Thirty volunteers were tasked to record these data, aged 19 to 48 years old. The sensor is updated and makes use of the built in accelerometer and gyroscope at a rate of 50Hz. The raw dataset in this study has been randomly partitioned into two sets, and 70% of the volunteers was chosen for generating the training data and the remaining 30% comprise the test data.

The sensor signals made use of noise filters and fixed-width sliding windows (2.56 sec and 50% overlap at 128 readings/window). A Butterworth low-pass filter separated the sensor acceleration data into body acceleration and gravity. A filter with 0.3 Hz cutoff frequency was used for the gravitational data. 

## Data Composition and Elements

The dataset includes the following files:


- 'activity_labels.txt': Links the class labels with their activity name.

- 'features_info.txt': discusses the variables on the feature vector

- 'features.txt': all features are listed in here

- 'README.txt': contains general description of the data

- 'train/X_train.txt': Training set file

- 'train/y_train.txt': Training label file

- 'test/X_test.txt': Test set file

- 'test/y_test.txt': Test label file


For each data group (test and train), these files can be found:

- 'train/subject_train.txt': ranges from 1-30 and gives identification to the subjects.

- 'train/Inertial Signals/total_acc_x_train.txt': 128 element vector depicting smartphone accelerometer X axis signal in standard gravity units 'g'.

- 'train/Inertial Signals/body_acc_x_train.txt': the values of body acceleration signal which was taken from the difference of the total acceleration with the gravity value

- 'train/Inertial Signals/body_gyro_x_train.txt': vector of angular velocity in radians/second


## Run Analysis Details


OUTLINE OF THE PROCESS:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Details on the R File Run_analysis:

* Required packages are first considered for merging: reshape2 and data.table
* Test and train data are loaded into dataframes
* Features and activity labels are also pulled out of the raw file. 
* Columns containing the mean and standard deviation are taken. 
* Dataset is merged containing the chosen columns. 
* A new dataset is created using write table and FALSE rownames