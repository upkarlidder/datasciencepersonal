pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  v <- vector(mode="numeric", length=0)

  for(i in id){
    fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(i)), ".csv", sep = "")
    myData <- read.csv(fileStr)
    
    num <- as.numeric(myData[[pollutant]][complete.cases(myData[[pollutant]])])
    
    v <- append(v, num)
  }
  print(mean(v))
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
