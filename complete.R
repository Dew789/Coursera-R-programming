## Claculate the number of complete data in certain files

complete <- function(directory, id = 1 : 332)
{
    # the addresss of files
    filelist <- dir(directory,full.names = T)
    
    outcome <- data.frame()
    
    for (i in id)
    {
        # calcluate the row numbers of files
        data <- read.csv(filelist[i]) 
        cnum <- nrow(data) 
        nobs <- 0
        
        # calculate the number of complete 
        for (j in 1: cnum)
        {
            l <- sum(is.na(data[j, ]))  
            if(l == 0)
                nobs <- nobs + 1
        }
        
        # put each fiels' data into outcome
        status <- c(i, nobs)  
        outcome <- rbind(outcome, status)
    }
    
    colnames(outcome) <- c("id", "nobs")  
    outcome
}