corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  wd = getwd()
  setwd(directory)
  
  ids <- vector()
  
  for(id in 1:332) {
    name <- paste(formatC(id, width=3, flag='0'), '.csv', sep='')
    data <- read.csv(name)
    if (sum(complete.cases(data))>threshold) {
      ids <- c(ids, cor(data$sulfate, data$nitrate, use="complete.obs"))
    }
  }
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  setwd(wd)
  ids
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}