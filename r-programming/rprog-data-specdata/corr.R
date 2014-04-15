corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  nobsDF <- complete(directory)
  r <- nobsDF[nobsDF$nobs > threshold,]
  cr <- numeric()
  
  for(i in r$id){
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(i)), ".csv", sep = "")
    myData <- read.csv(fileStr)
    cr <- append(cr, round(cor(myData$sulfate, myData$nitrate, use="na.or.complete"),5))
  }
  cr
}

corr("specData", 150)