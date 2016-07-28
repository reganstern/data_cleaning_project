---
title: "CodeBook"
author: "Regan Stern"
date: "July 28, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

R script to produce the analysis data sets is run_analysis.R. It assumes the .gz file has been downloaded and expanded. The script should be run from the UCI HAR Dataset directory. 
R packages data.table and dplyr must be installed before running the script.

Each dataset contains 81 variables. 

Column		Column
Number		Name						Values
1		subject			     1:30			
2		activityName                 LAYING, STANDING, SITTING, WALKING,
					     WALKING_UPSTAIRS, WALKING_DOWNSTAIRS
3:5		tBodyAcc-mean-XYZ	     t= time, values are normalized and bounded
6:8		tBodyAcc-std-XYZ             within [-1,1]. All values are calculated. 
9:11		tGravityAcc-mean-XYZ         XYZ indicates 3 variables in the X, Y, and
12:14		tGravityAcc-std-XYZ            Z dimensions. std represents the standard
15:17		tBodyAccJerk-mean-XYZ        deviation.
18:20		tBodyAccJerk-std-XYZ           
21:23		tBodyGyro-mean-XYZ
24:26		tBodyGyro-std-XYZ             
27:29		tBodyGyroJerk-mean-XYZ
30:32		tBodyGyroJerk-std-XYZ         
33		tBodyAccMag-mean
34		tBodyAccMag-std            
35		tGravityAccMag-mean
36		tGravityAccMag-std           
37		tBodyAccJerkMag-mean
38		tBodyAccJerkMag-std          
39		tBodyGyroMag-mean
40		tBodyGyroMag-std            
41		tBodyGyroJerkMag-mean
42		tBodyGyroJerkMag-std
         
43:45	        fBodyAcc-mean-XYZ	   f = frequency, values are normalized and bounded	46:48		fBodyAcc-std-XYZ             within [-1,1]. All values are calculated.
49:51		fBodyAcc-meanFreq-XYZ       XYZ indicates 3 variables in the X, Y, and Z
52:54		fBodyAccJerk-mean-XYZ       dimensions. std represents the standard deviation.
55:57		fBodyAccJerk-std-XYZ
58:60		fBodyAccJerk-meanFreq-X   
61:63		fBodyGyro-mean-XYZ
64:66		fBodyGyro-std-XYZ          
67:69		fBodyGyro-meanFreq-XYZ
70		fBodyAccMag-mean         
71		fBodyAccMag-std
72		fBodyAccMag-meanFreq      
73		fBodyBodyAccJerkMag-mean
74		fBodyBodyAccJerkMag-std     
75		fBodyBodyAccJerkMag-meanFreq
76		fBodyBodyGyroMag-mean        
77		fBodyBodyGyroMag-std
78		fBodyBodyGyroMag-meanFreq   
79		fBodyBodyGyroJerkMag-mean
80		fBodyBodyGyroJerkMag-std    
81		fBodyBodyGyroJerkMag-meanFreq

Datasets:
data: 10299 observations from the original dataset. It is a combination of the test and train
observation files (X_test.txt, y_test.txt, subject_test.txt, X_train.txt, subject_train.txt).
Only columns representing mean and standard deviation estimates were included. The files
representing the subject and activity per observation were merged with the observation dataset.

averageDataSet: Derived from the data dataset. Each row represents either the mean value of
observations grouped by activityName or subject.