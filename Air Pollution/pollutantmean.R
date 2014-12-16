## Read data from the directory and calculate the average of the pollutant in purtular sites

pollutantmean <- function(directory, pollutant, id = 1 :332)
{      
    newdata <- data.frame()
    data <- data.frame()
    
    filelist <- dir(directory,full.names = T)
    
    # put all the data we want into the ndata
    for (i in id)
    {
        data <- read.csv(filelist[i]) 
        newdata <- rbind(newdata,data)
    }
    
    # choose what pollutant we want 
    if(pollutant == "sulfate")
        pollutantmean <- mean(newdata$sulfate, na.rm = T) 
    if(pollutant == "nitrate")
        pollutantmean <- mean(newdata$nitrate, na.rm = T) 
    
    pollutantmean
         
}



