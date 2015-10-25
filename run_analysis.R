library(dplyr)

getwd() -> current_dir
base_dir <- "C:\\Users\\Ross\\git\\CourseraGetCleanData\\UCI HAR Dataset"
setwd(base_dir)
features <- read.csv("features.txt", header=FALSE, col.names=c("FeatureCode", "FeatureName"), sep=" ")
activities <- read.csv("activity_labels.txt", header=FALSE, col.names=c("ActivityCode", "ActivityName"), sep=" ")


#setwd("test")

# Read in both the TEST and TRAIN data sets, applying Feature Names during the load

read.table("test\\x_test.txt", header=FALSE, col.names=features$FeatureName) -> x_test
tbl_df(x_test) -> x_test

read.table("train\\X_train.txt", header=FALSE, col.names=features$FeatureName) -> x_train
tbl_df(x_train) -> x_train

#1. Merge the Training Set and the Test Set
bind_rows(x_test, x_train) -> x_all

#2. Extract just the columns containing ".mean." and ".std." ie. The means and standard deviations
x_all[, grepl(".mean.|.std.", colnames(x_all))] -> x_mean_std

#3. Read in Activity Codes for each observation and translate to Activity Names
read.csv("test\\y_test.txt", header=FALSE, col.names="Y") -> y_test
read.csv("train\\y_train.txt", header=FALSE, col.names="Y") -> y_train
bind_rows(y_test, y_train) -> y_all
merge(y_all, activities, by.x="Y", by.y="ActivityCode") -> y_all
tbl_df(y_all) -> y_all

read.csv("test\\subject_test.txt", header=FALSE, col.names="SubjectNum") -> subject_test
read.csv("train\\subject_train.txt", header=FALSE, col.names="SubjectNum") -> subject_train
bind_rows(subject_test, subject_train) -> subject_all

tbl_df(subject_all) -> subject_all


# Bind the SubjectNum and ActivityName columns to x_mean_std data frame

y_all %>%
  bind_cols(subject_all, x_mean_std) %>%
  select(-Y)  %>%
  group_by(ActivityName, SubjectNum)-> 
    x_mean_std

summarise_each(x_mean_std, funs(mean)) -> x_summ

setwd(current_dir)
print(getwd())

x_summ
