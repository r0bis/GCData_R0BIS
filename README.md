Readme GCData_R0BIS
======================================================
This repository contains the coursework for JHU Getting and Cleaning Data course.

The main script which is to be executed from R environment does the following:
  - it loads the needed libraries - dplyr and sqldf
  - it looks for data in the subdirectory called 'data'
  - it produces output in its working directory 'tidydataset.txt'

The dataset you would process is obtained from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For the run_analysis.R script to work it is necessary that it should contain 
a subdirectory named dat where you have unzipped the downloaded dataset, preserving 
the dataset directory structure.

Dataset structure for your reference
--------------------------------------------------------
<pre>
├── activity_labels.txt
├── features_info.txt
├── features.txt
├── README.txt
├── test
│   ├── Inertial Signals
│   │   ├── body_acc_x_test.txt
│   │   ├── body_acc_y_test.txt
│   │   ├── body_acc_z_test.txt
│   │   ├── body_gyro_x_test.txt
│   │   ├── body_gyro_y_test.txt
│   │   ├── body_gyro_z_test.txt
│   │   ├── total_acc_x_test.txt
│   │   ├── total_acc_y_test.txt
│   │   └── total_acc_z_test.txt
│   ├── subject_test.txt
│   ├── X_test.txt
│   └── y_test.txt
└── train
    ├── Inertial Signals
    │   ├── body_acc_x_train.txt
    │   ├── body_acc_y_train.txt
    │   ├── body_acc_z_train.txt
    │   ├── body_gyro_x_train.txt
    │   ├── body_gyro_y_train.txt
    │   ├── body_gyro_z_train.txt
    │   ├── total_acc_x_train.txt
    │   ├── total_acc_y_train.txt
    │   └── total_acc_z_train.txt
    ├── subject_train.txt
    ├── X_train.txt
    └── y_train.txt
</pre>