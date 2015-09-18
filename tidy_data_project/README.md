To use the script all you need to do is to source it and run do_work() function. Make sure that your working directory is the same as the one that contains script file. Data should be in 'data' folder of the same directory. 

```{R}
source('script.R')
do_work()
```

As result you should see *tidy_dataset_5.txt* file created. You can load that file back into R with the following code:

```{R}
data <- read.table("tidy_dataset_5.txt", header=TRUE)
```

Description of the inner working of the script is in the CodeBook.md file. 