# CourseraGettingAndCleaningData
Main Project for Coursera Getting and Cleaning Data Unit

In this project, please find the following
- run_analysis.R - An R program to analyse the Samsung data
- README.md - This file1
- UCI HAR Dataset - The folder containing Samsung data downloaded for this exercise1

The run_analysis.R program works as follows:
- Read in the FEATURES (features.txt) and ACTIVITIES (activites.txt) these are code tables that will be used to translate the main data files
- Read in the main data sets using read_table (no headers) from the "test" and "train" directories. As they are read in, apply column names from the features.txt we loaded earlier.
- Convert TEST and TRAIN datasets to dplyr tables with tbl_df()
- Join the TEST and TRAIN data sets together using bind_rows()
- Copy just the columns containing the words "mean" and "std" into a separate data set.
- Read in the Y (activity) data sets in the same way, concatenating them with bind_rows(). Join to the Activity code table we loaded earlier to translate the Activity Code to a Name
- Read in the Subject data sets in the same way, concatenating them with bind_rows()
- Using pipelining, start with Y (activity), bind the Subjects, bind the X Meand and Std data, and then Group by Activity and Subject for analysis
- Use Summarise_each to summarise all columns at once, calculating the mean
- Output the summary
