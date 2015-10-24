## The following code summarizes an existing dataset for further 
## analysis and saves it to a text file. 

## Please view the Read Me and CodeBook documents for 
## more in depth explanation and directions on how to load the
## created tidy dataset.

## load and merge data
library(dplyr)
library(tidyr)

activityLabels<- read.delim("./data/activity_labels.txt",sep= " ",header = FALSE)
        colnames(activityLabels) = c("activityId","activity")
features<- read.delim("./data/features.txt",sep= " ",header = FALSE,row.names = 1)

trainSubject<- read.table("./data/train/subject_train.txt")
        colnames(trainSubject)= "subjectId"
trainLabel<- read.table("./data/train/y_train.txt")
        colnames(trainLabel)= "activityId"
trainSet<- read.table("./data/train/X_train.txt")
        colnames(trainSet)= features[1:561,] 
        trainSet<- cbind(trainSubject,trainLabel,trainSet)

testSubject<- read.table("./data/test/subject_test.txt")
        colnames(testSubject)= "subjectId"
testLabel<- read.table("./data/test/y_test.txt")
        colnames(testLabel)= "activityId"
testSet<- read.table("./data/test/X_test.txt")
        colnames(testSet)= features[1:561,]
        testSet<- cbind(testSubject,testLabel,testSet)


dfAll<- rbind(trainSet,testSet)
dfAll<- full_join(activityLabels,dfAll)

## Collect only the columns required - mean and std 

reqCol<- grep('-(mean|std)\\(',names(dfAll))
reqCols <- dfAll[,reqCol]
dfAll<- cbind(dfAll[,2:3],reqCols)

## Clean the data set so that it follows tidy data rules
tidy<- tbl_df(dfAll)
cnames<- names(tidy) 
cnames<- gsub("BodyBody","Body",cnames)  
cnames<- gsub("[-,(,)]","",cnames) 
cnames<- gsub("mean","Mean",cnames) 
cnames<- gsub("std","Std",cnames) 
colnames(tidy) = cnames

## Summarize the average, create and export a tidy data set
tidySummary<- tidy %>% group_by(activity, subjectId) %>% summarise_each(funs(mean))
write.table(dfAll, file= "RawData.txt" ,row.name=FALSE)
write.table(tidySummary, file= "MeanTidyData.txt" ,row.name=FALSE)

