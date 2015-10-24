RunAnalysis Getting and Cleaning Data Course Project==============

================================================================
==
All data used comes from the UCI HAR Dataset [1]
        Data
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
        Explanation of Data
        http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For further insight into the original data, please refer to the references below and documentation provided in their download.
==================================================================

Purpose:
========
The purpose of this project is to prepare for further analysis the UCI HAR dataset which measures different individual's physical response levels for multiple activities. 
==================================================================

Explanation:
========
Subsets of data from the original UCI HAR data set are combined, merged, summarized and otherwise made tidy for further analysis on the available mean and standard deviations:
        1. Test and Trial data are respectively uploaded and bound with their subject and activity ids.
        2. Test and Trial data are then merged and filtered
        3. The remaining data is summarized by mean for Activity and Subject
==================================================================

Instructions to Load Tidy Data Set:
========
        1. In RStudo, run the following code:
        data <- read.table("./MeanTidyData.txt", header = TRUE) 
        View(data) 
==================================================================

Instructions to Reproduce Raw and Tidy Data Sets:
========
        1. Download original data and unzip the file in your working directory. Name the file "data."
        2. You must have the following packages installed: dplyr and tidyr
        3. Open and run the script “run_analysis.r”
==================================================================

Notes:
========
        This file includes
        1. "README.txt" document
        2. "CodeBook.rmd" explaining the data and how it has been manipulated
        3. "run_analysis.r"  R script which will give you the tidy data set
        4. "RawData.txt" raw data set
        5. "MeanTidyData.txt" tidy data set 
==================================================================
        

Data Reference:
========
Thanks to the following for use of their data:

[1] Human Activity Recognition Using Smartphones Dataset
Version 1.0
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

For more information about the UCI HAR dataset contact: activityrecognition@smartlab.ws