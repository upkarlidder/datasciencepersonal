corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  nobsDF <- complete(directory)
  print(class(nobsDF))
  print(names(nobsDF))
  print(class(nobsDF$nobs))
  r <- nobsDF[nobsDF$nobs == threshold,]
  print(head(r))
  print(class(r$id))
  print(r$id)
  
  for(i in r$id){
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(i)), ".csv", sep = "")
    print(fileStr)
    myData <- read.csv(fileStr)
    print(cor(myData$sulfate, myData$nitrate))
  }
}

corr("specData", 200)