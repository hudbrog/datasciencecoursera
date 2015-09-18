pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  wd = getwd()
  setwd(directory)
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  data_list <- lapply(id, function(x) {read.csv(paste(formatC(x, width=3, flag='0'), '.csv', sep=''))})
  data <- do.call(rbind, data_list)
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  setwd(wd)
  mean(data[, pollutant], na.rm = TRUE)
}
