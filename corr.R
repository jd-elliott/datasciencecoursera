corr <- function(directory, threshold = 0) {
  ## set working directory
  setwd(directory)
  
  ## read csv files
  file_list <- list.files(pattern="*.csv")
  corout <- numeric()
  for(file in file_list) {
    dataset <- read.csv(file)
    good <- complete.cases(dataset)
    if(sum(good) > threshold) {
      corout <- c(corout, cor(dataset[,"sulfate"], dataset[,"nitrate"], 
                              use="complete.obs"))
    }
  }
  
  ## revert working directory
  setwd("..")
  
  ## calculate correlation
  return(corout)
}