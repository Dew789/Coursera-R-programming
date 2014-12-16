#calculate the correlative in the files that the complete numbers greater threshold 

corr <- function(directory, threshold = 0)
{
    id <- vector()
    cor <- vector()
    
    # check the nods and list files' address
    status <- complete(directory, 1 : 332)
    filelist <- dir(directory,full.names = T)
    
    # list the file's id that up to strander
    for (i in 1 : 332)
    {
        if(status[i, ]$nobs > threshold)
        {
            singleid <- status[i, ]$id
            id <- c(id, singleid)
        }            
    }
    
    # no file, no output
    if (length(id) == 0)
        return(numeric())
    
    # calculate the corrlative number
    for(i in id)
    {
        data <- read.csv(filelist[i]) 
        value <- is.na(data$nitrate) | is.na(data$sulfate)
        ndata <- cbind(data$nitrate[!value], data$sulfate[!value])
        rel <- cor(ndata[, 1], ndata[, 2])   
        cor <- c(cor, rel)
    }
           
    cor
}
