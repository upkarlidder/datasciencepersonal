complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  df <- data.frame(id=numeric(),
                   nobs=numeric(),
                   stringsAsFactors=FALSE) 
  for(i in id){
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(i)), ".csv", sep = "")
    myData <- read.csv(fileStr)
    logi <- complete.cases(myData)
    nob <- length(logi[logi == TRUE])
    
    newRow <- data.frame(id=i, nobs=nob)
    df <- rbind(df, newRow)
  }
  df
}

complete("specData", 1:2)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)