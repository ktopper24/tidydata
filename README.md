# tidydata
Getting and Cleaning Data Course Project

This script will read in files from the Samsung data set and create a tid data set. 

First, the reshape2 package is loaded so that it can be used later.

Three files are loaded to create the train section of the data set: the actual data, the labels 
(which are the activities), and the subject ID. The features file is then loaded in and set to 
the column names of the data frame. Both the activity ID and the subject ID are then added as columns 
to the beginning of the data frame and their corresponding names assigned. 

The same sequence is used on the test files to create the test data frame with its appropriate labels.
The two data sets are then combined with the train set first and the test set added to the end of it.

Next, the columns that correspond to a mean or standard deviation measurement are extracted and added
to a new data frame, keeping the activity ID and the subject ID. 

The activity labels that were numbers are now replaced with their corresponding name.

The data set is then melted and the subject ID and avtivity ID are given as identifiers and the 
rest of the columns (which are each of the measurements) are specified as variables.

The data is then cast to a new data frame where the mean is appplied to all variables based on 
both the subject ID and activity ID.

Finally, the tidy data frame is written to a text file. 

