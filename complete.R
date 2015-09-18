complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  wd = getwd()
  setwd(directory)
  analyze <- function(id) {
    name <- paste(formatC(id, width=3, flag='0'), '.csv', sep='')
    data <- read.csv(name)
    c(id=id, nobs=sum(complete.cases(data)))
  }
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  data_list <- sapply(id, analyze)
  setwd(wd)
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  data.frame(t(data_list))
}