library(dplyr)

read_data <- function() {
  features <- read.table(file.path("data","features.txt"), sep=" ", col.names=c("ID", "FeatureName"), colClasses=c("numeric", "character"))
  activity_labels <- read.table(file.path("data","activity_labels.txt"), sep=" ", col.names=c("ActivityID", "ActivityName"), colClasses=c("numeric", "character"))
  test_X <- read.table(file.path("data","test","X_test.txt"), strip.white=TRUE, header=FALSE, colClasses=c("numeric"), col.names = features$FeatureName)
  test_activity <- read.table(file.path("data","test","y_test.txt"), sep=" ", col.names=c("ActivityID"), colClasses=c("numeric"))
  test_subject <- read.table(file.path("data","test","subject_test.txt"), sep=" ", col.names=c("SubjectID"), colClasses=c("numeric"))
  test_data <- cbind(test_X, test_activity, test_subject)
  train_X <- read.table(file.path("data","train","X_train.txt"), strip.white=TRUE, header=FALSE, colClasses=c("numeric"), col.names = features$FeatureName)
  train_activity <- read.table(file.path("data","train","y_train.txt"), sep=" ", col.names=c("ActivityID"), colClasses=c("numeric"))
  train_subject <- read.table(file.path("data","train","subject_train.txt"), sep=" ", col.names=c("SubjectID"), colClasses=c("numeric"))
  train_data <- cbind(train_X, train_activity, train_subject)
  data <- tbl_df(rbind(train_data, test_data)) %>% left_join(activity_labels, "ActivityID") %>% select(contains("mean"), contains("std"), ActivityName, SubjectID)
  data2 <- group_by(data, SubjectID, ActivityName) %>% summarise_each(funs(mean))
  return(data2)
}

data <- read_data()
write.table(data, file="tidy_dataset_5.txt", row.names=FALSE)
