## Before anything else, make sure machine has required packages First
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

## 1. Merge the training and the test sets to create one data set.

# Convert all the relevant or chosen data into dataframe R format for processing later.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
# This particular line will extract only mean and standard deviation as per number 2 instruction. 
extract_features <- grepl("mean|std", features)
A_testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
B_testdata <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
A_trainingdata <- read.table("./UCI HAR Dataset/train/X_train.txt")
B_trainingdata <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Assign the correct feature names into the headings of test data. 
names(A_testdata) = features
A_testdata = A_testdata[,extract_features]
B_testdata[,2] = activity_labels[B_testdata[,1]]
names(B_testdata) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Begin merging the data by binding
test_data <- cbind(as.data.table(subject_test), B_testdata, A_testdata)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(A_trainingdata) = features

A_trainingdata = A_trainingdata[,extract_features]

# Load activity data
B_trainingdata[,2] = activity_labels[B_trainingdata[,1]]
names(B_trainingdata) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

train_data <- cbind(as.data.table(subject_train), B_trainingdata, A_trainingdata)
data = rbind(test_data, train_data)
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)


## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidieddataset   = dcast(melt_data, subject + Activity_Label ~ variable, mean)
write.table(tidieddataset, file = "./indie_clean_data.txt", row.name=FALSE)