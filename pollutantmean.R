pollutantmean <- function(directory, pollutant, id=1:332) {
  ## set working directory
  setwd(directory)
  
  ## read csv files
  file_list <- paste(sprintf("%03d", id), "csv", sep=".")
  for(file in file_list) {
    if (!exists("dataset")) {
      dataset <- read.csv(file)
    }
    else {
      temp_dataset <- read.csv(file)
      dataset<-rbind(dataset, temp_dataset)
      rm(temp_dataset)
    }
  }
  
  ## revert working directory
  setwd("..")
  
  ## calculate mean
  return(mean(dataset[, pollutant], na.rm=TRUE))
}