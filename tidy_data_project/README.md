To use the script all you need to do is to source it and run do_work() function. Make sure that your working directory is the same as the one that contains script file. Data should be in 'data' folder of the same directory. 

```{R}
source('run_analysis.R')
do_work()
```

As result you should see *tidy_dataset_5.txt* file created. You can load that file back into R with the following code:

```{R}
data <- read.table("tidy_dataset_5.txt", header=TRUE)
```

Description of the inner working of the script:


Script assumes that data is unzipped into current workind directory inside folder named 'data'. 
First, script reads dictionaries: features.txt and activity_labels.txt into data frames. These are goind to be used later. After that script reads datasets from 'test' and 'train' folder. When reading the main dataset (i.e. '_X' file), values from features.txt are used as vector for column names. Activity and subject variables are read from separate files and are added to original dataset data frame with cbind. After that we have two datasets (test and train) both containing ids of subjects and activities as well as having proper column names. We use rbind to combine these two datasets into one. 

All of the above actions are done using 'pure' R. After that for readability and performance reasons we use 'dplyr' package. 
Dataset is left joined with activity names dictionary, thus adding a column ActivityName containing descriptive activity names. After that we use 'select' to limit the number of columns we have: only these, that contain words 'mean' and 'avg' are left, plus activity name and subject id. 

_Original dataset has variables for time domain and frequency domain signals plus several averaged signals based on original data. We decided to leave all 'mean' and 'std' signals. Do note that variables that include 'Mean' in the name are not included, since they represent angle between mean values of other variables but do not show mean value of anything by themselves._

That left us with dataset only with required columns and all names being descriptive. After that we group the data by subject IDs and activity types, summarizing all other columns with mean function. That data is written to *tidy_dataset_5.txt* file using _table.write_ function. 