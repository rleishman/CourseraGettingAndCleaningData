#Code Book
##run_analysis.R

features - Vector of feature names in the same order as which they appear in the data set

activities - Data Frame of Activity codes and labels

x_test - Data Frame containing the metrics from the TEST data set

x_train - Data Frame containing the metrics from the TRAIN data set

x_all - Concatenation of x_test and x_train

y_test - Data Frame of Activity Codes for the Test data set

y_train - Data Frame of Activity Codes for the TRAIN data set

y_all - Concatenation of y_test and y_train, with codes translated to activity names


subject_test - Data Frame of Subject Codes for the Test data set

subject_train - Data Frame of Subject Codes for the TRAIN data set

subject_all - Concatenation of subject_test and subject_train

x_mean_std - Just the columns of the combined data set containing meand and standard deviations, bound to the Activity Descriptions and Subject Codes

x_summ - Summary of x_mean_std showing mean of all columns by Activity Description and Subject
