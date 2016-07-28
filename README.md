# data_cleaning_project
This script assumes that you have the data files included in the project description.
The file structure is 
        'UCI HAR Dataset'
                activity_labels.txt
                features_info.txt
                reatures.txt
                README.txt
                test
                        subject_test.txt
                        X_test.txt
                        y_test.txt
                train
                        subject_train.txt
                        X_train.txt
                        y_train.txt
                        
As stated in the r script, the file reads are relative to the 'UCI HAR Dataset' directory.
Also, it is necessary to have installed the data.table and dplyr packages.

The r script will execute when the source is loaded. It will load the libraries, read in the defined text file into data tables and manipulate the files as required. All intermediate files are removed at the end of the script leaving only the 2 data sets that are required by the project.