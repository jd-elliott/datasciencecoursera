complete <- function(directory, id = 1:332) {
  ## set working directory
  setwd(directory)
  
  ## read csv files and count complete cases
  for(i in seq (along=id)) {
    dataset <- read.csv(paste(sprintf("%03d", id[i]), "csv", sep="."))
    if (!exists("outrep")) {
      outrep <- data.frame(id=id[i], nobs=sum(complete.cases(dataset)))
    }
    else {
      outrep <- rbind(outrep, c(id[i], sum(complete.cases(dataset))))
    }
  }
  
  ## revert working directory
  setwd("..")
  
  ## return output
  return(outrep)
}