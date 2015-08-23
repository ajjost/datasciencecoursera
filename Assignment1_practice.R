dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url,"diet_data.zip")
unzip("rprog_data_specdata.zip",exdir="specdata")

fullfiles <- list.files("specdata", full.names  = TRUE)


weightedmedian<- function(directory,day) {
        files_list <- list.files(directory, full.names = TRUE)  ##creates a list of files
        dat <- data.frame()  ##creates an empty data frame
        for (i in 1:332) {
                ##loops through the files, rbinding them together
                dat <- rbind(dat, read.csv(fullfiles[i]))
                }
        dat_subset <- dat[which(dat[,"Day"] == day), ]  ##subsets the rows that match the 'day' arguement
        median(dat_subset[,"Weight"], na.rm = TRUE)  ##identifies the median weight while stripping out NAs
}

for (i in seq_along(fullfiles)) {
        print(fullfiles([i])
}



pollutantmean <- function(directory, pollutant, id = 1:332) {
        # define directory
        fullnamefiles <- list.files(directory, full.names = TRUE) #creates list of files with their full name
        alldata <- data.frame() #create empty data frame
        for (i in id) {
                #loops through the files, rbinding them together
                alldata <- rbind(alldata, read.csv(fullnamefiles[i]))
        }
        alldata_subset <- alldata[[pollutant]]  ##subsets the rows that match the 'day' arguement
        mean(alldata_subset, na.rm = TRUE)  ##identifies the median weight while stripping out NAs
}

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
