pollutantmean <- function(directory, pollutant, id = 1:332) {
        fullnamefiles <- list.files(directory, full.names = TRUE) 
        alldata <- data.frame()
        for (i in id) {
                alldata <- rbind(alldata, read.csv(fullnamefiles[i]))
        }
        alldata_subset <- alldata[[pollutant]]  
        mean(alldata_subset, na.rm = TRUE)  
}


