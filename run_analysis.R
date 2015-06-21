library(reshape2)

train_set <- read.table("train/X_train.txt")
train_labels <- read.table("train/y_train.txt")
train_subject <- read.table("train/subject_train.txt")
features <- read.table("features.txt")
colnames(train_set) <- features[,2]
train <- cbind(train_subject, train_labels, train_set)
colnames(train)[1] <- "subjectID"
colnames(train)[2] <- "activityID"
test_set <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")
colnames(test_set) <- features[,2]
test <- cbind(test_subject, test_labels, test_set)
colnames(test)[1] <- "subjectID"
colnames(test)[2] <- "activityID"
all_data <- rbind(train, test)
needed_columns <- c(-1, 0, 1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)
needed_after <- needed_columns + 2
needed_data <- all_data[,needed_after]

needed_data$activityID[needed_data$activityID == 1] <- "Walking"
needed_data$activityID[needed_data$activityID == 2] <- "Walking_Upstairs"
needed_data$activityID[needed_data$activityID == 3] <- "Walking_Downstairs"
needed_data$activityID[needed_data$activityID == 4] <- "Sitting"
needed_data$activityID[needed_data$activityID == 5] <- "Standing"
needed_data$activityID[needed_data$activityID == 6] <- "Laying"

melted <- melt(needed_data, id = c("subjectID", "activityID"), measure.vars = c(3:ncol(needed_data)))
data <- dcast(melted, activityID + subjectID ~ variable, mean)


write.table(data, file="run_analysis.txt", row.names = FALSE)