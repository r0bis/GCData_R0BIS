# This file should be run from its directory when sub-directory data contains
# the downloaded raw data set
# R01 - reading in data and labels:
# the following libraries are required for data subsetting and SQL selection
library(dplyr)
library(sqldf)

# read in test data
Xdt <- read.csv("data/test/X_test.txt",sep="")
Ylb <- read.csv("data/test/y_test.txt",sep="")
Sbj <- read.csv("data/test/subject_test.txt",sep="")
# read in global labels - activity names and feature names
gALab <- read.csv("data/activity_labels.txt",sep="",header=F)
colnames(gALab) <- c('ActivityID','ActivityName')
gFeat <- read.csv("data/features.txt",sep="",header=F)
colnames(gFeat) <- c('FeatureID','FeatureName')
# make global feature labels usable for columnnames
# this is done in sequence to prepare correct names for future column selection
gFeat <- as.data.frame(sapply(gFeat,gsub,pattern='-mean\\(\\)-',replacement="Mean"))
gFeat <- as.data.frame(sapply(gFeat,gsub,pattern='-mean\\(\\)',replacement="Mean"))
gFeat <- as.data.frame(sapply(gFeat,gsub,pattern='-std\\(\\)-',replacement="Std"))
gFeat <- as.data.frame(sapply(gFeat,gsub,pattern='-std\\(\\)',replacement="Std"))
gFeat$FeatureName <- make.names(gFeat$FeatureName, unique=T)
# insert column names in the Test data set
colnames(Xdt) <- gFeat$FeatureName
# now select only columns further needed for work
XdtTest <- select(Xdt,matches("Mean[XYZ]$|Mean$|Std[XYZ]$|Std$"))
# now attach subject information to this data set
XdtTest <- cbind(XdtTest,Sbj[,1])
colnames(XdtTest)[67] <- c("Subject")
# now attach activity labels to the data set
# first prepare descriptive activity names
colnames(Ylb) <- c('ActivityLabel')
YlbNames <- sqldf("SELECT gALab.ActivityName
                FROM Ylb
                LEFT JOIN gALab
                ON Ylb.ActivityLabel = gALab.ActivityID")
# then add the column to the data set
XdtTest <- cbind(XdtTest,YlbNames[,1])
colnames(XdtTest)[68] <- c('Activity')

### now conduct the same preparations for the training dataset
Xdt <- read.csv("data/train/X_train.txt",sep="")
Ylb <- read.csv("data/train/y_train.txt",sep="")
Sbj <- read.csv("data/train/subject_train.txt",sep="")
colnames(Xdt) <- gFeat$ActivityName
XdtTrain <- select(Xdt,matches("Mean[XYZ]$|Mean$|Std[XYZ]$|Std$"))
XdtTrain <- cbind(XdtTrain,Sbj[,1])
colnames(XdtTrain)[67] <- c("Subject")
colnames(Ylb) <- c('ActivityLabel')
YlbNames <- sqldf("SELECT gALab.ActivityName
                FROM Ylb
                LEFT JOIN gALab
                  ON Ylb.ActivityLabel = gALab.ActivityID")
XdtTrain <- cbind(XdtTrain,YlbNames[,1])
colnames(XdtTrain)[68] <- c('Activity')

### bind the data frames together
mrgData <- rbind(XdtTest,XdtTrain)
# write out the cleran data set
write.csv(mrgData,file = "./tidyset.csv",row.names=FALSE,col.names=TRUE)
