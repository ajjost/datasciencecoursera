complete <- function(directory, id = 1:332) {
        fullnamefiles <- list.files(directory, full.names = TRUE) 
        alldata <- data.frame() 
        for (i in id) {
                alldata <- rbind(alldata, read.csv(fullnamefiles[i]))
        }       
        nobscc <- as.numeric(complete.cases (alldata))
        z <- data.frame(id=id,nobs=sum(nobscc))
        z
}
#returns correctly for all but 30:25- here it gives total sum for every id not subtotal for each

complete <- function(directory, id = 1:332) {
        nobs = numeric()
        for (i in id) {
                
                alldata <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                                          ".csv", sep = ""))
                
                nobs <- c(nobs, sum(complete.cases(alldata)))
        }
        x <- (data.frame(id, nobs))
        x
}
