corr <- function(directory, threshold = 0) {
        fulldirectory <- complete(directory)
        alldata <- data.frame()
        corrvec <- numeric()
        idthreshold <- fulldirectory[fulldirectory["nobs"] > threshold,]$id
        for (i in idthreshold) {
                alldata <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
                fulldircc <- alldata[complete.cases(alldata),]
                corrvec<- c(corrvec,cor(fulldircc$sulfate, fulldircc$nitrate))
                }
        return(corrvec)
}