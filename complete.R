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
