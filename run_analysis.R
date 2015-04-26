# Version 2.0
# This file should be run from its directory and the sub-directory 'data'
# should contain the downloaded raw data set 
# 2 libraries are required for data subsetting and SQL selection
library(dplyr)
library(sqldf)

# read in global labels - activity names and feature names
gALab <- read.csv("data/activity_labels.txt",sep="",header=F)
colnames(gALab) <- c('ActivityID','ActivityName')
gFeat <- read.csv("data/features.txt",sep="",header=F)
colnames(gFeat) <- c('FeatureID','FeatureName')

# make global feature labels usable for column names
# this is done in a particular sequence 
# column names will be used to select only the needed columns
gFeat <- as.data.frame(sapply(gFeat,gsub,pattern='-mean\\(\\)-',replacement="Mean"))
gFeat <- as.data.frame(sapply(gFeat,gsub,pattern='-mean\\(\\)',replacement="Mean"))
gFeat <- as.data.frame(sapply(gFeat,gsub,pattern='-std\\(\\)-',replacement="Std"))
gFeat <- as.data.frame(sapply(gFeat,gsub,pattern='-std\\(\\)',replacement="Std"))
# lastly the unnecessary columns get correct but irrelevant names
gFeat$FeatureName <- make.names(gFeat$FeatureName, unique=T)

# read in test data and process this set first
Xdt <- read.csv("data/test/X_test.txt",sep="")
Ylb <- read.csv("data/test/y_test.txt",sep="")
Sbj <- read.csv("data/test/subject_test.txt",sep="")
colnames(Ylb) <- c('ActivityLabel')

# insert column names in Test data and select only columns further needed
colnames(Xdt) <- gFeat$FeatureName
XdtTest <- select(Xdt,matches("Mean[XYZ]$|Mean$|Std[XYZ]$|Std$"))
# attach subject information to this data set
XdtTest <- cbind(XdtTest,Sbj[,1])
colnames(XdtTest)[67] <- c('Subject')
# attach activity labels to the data set
# first prepare descriptive activity names
YlbNames <- sqldf("SELECT gALab.ActivityName
                FROM Ylb
                LEFT JOIN gALab
                ON Ylb.ActivityLabel = gALab.ActivityID")
# then add activity labels to the data set
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

### bind the processed test and training data frames together
mrgData <- rbind(XdtTest,XdtTrain)

# summarise data - first group, then summarise (mean) on columns grouped by
groupMrgData <- mrgData %>% group_by(Subject,Activity)
meanMrgData <- groupMrgData %>% summarise_each(funs(mean))

# write out the clean data set - the requirement is to use write.table()
# write.csv(mrgData,file = "./tidyset.csv",row.names=FALSE,col.names=TRUE)
write.table(meanMrgData,file = "./tidydataset.txt",row.names=FALSE,col.names=TRUE,sep=",")
