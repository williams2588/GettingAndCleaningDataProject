setwd("~/Projects/datasciencecoursera/GettingAndCleaningData/UCI HAR Dataset")

#read features to use as column names
namesdf <- read.table("features.txt")
namesv <- namesdf$V2
#get rid of dashes and parentheses
namesv <- gsub("[-,()]","",namesv)

#Find columns that contain "mean" or "std"
names2v <- grep("[Mm]ean|[Ss]td", namesv)

#get activity labels as a vector
activitiesLabdf <- read.table("activity_labels.txt")
activitiesLabv <- activitiesLabdf$V2

#read in the test data
Xtestdf <- read.table("test/X_test.txt", col.names = namesv, colClasses = "numeric", nrows = 2947, comment.char = "")
#subset Mean and Standard Deviation variables from test data
Xtestdf <- Xtestdf[names2v]
#read in the test subject table
subjectTestdf <- read.table("test/subject_test.txt", col.names = c("Subject"), colClasses = "numeric")
subjectTestv <- subjectTestdf$Subject
#read in the test activities data
activityTestdf <- read.table("test/Y_test.txt", col.names = c("Activity"), colClasses = "numeric")
activityTestv <- activityTestdf$Activity

#convert the activity codes to labels
activityLabTestv <-sapply(activityTestv, function(x) activitiesLabv[x])

#bind the test subject and activity labels to the test data and rename columns
XtestAll <- cbind(subjectTestv, activityLabTestv, Xtestdf)
names(XtestAll)[1] <- "Subject"
names(XtestAll)[2] <- "Activity"

#read in the training data
Xtraindf <- read.table("train/X_train.txt", col.names = namesv, colClasses = "numeric", nrows = 7352, comment.char = "")
#subset Mean and Standard Deviation variables from test data
Xtraindf <- Xtraindf[names2v]
#read in the training subject table
subjectTraindf <- read.table("train/subject_train.txt", col.names = c("Subject"), colClasses = "numeric")
subjectTrainv <- subjectTraindf$Subject
#read in the training activities data
activityTraindf <- read.table("train/Y_train.txt", col.names = c("Activity"), colClasses = "numeric")
activityTrainv <- activityTraindf$Activity

#convert the activity codes to labels
activityLabTrainv <-sapply(activityTrainv, function(x) activitiesLabv[x])

#bind the training subject and activity labels to the training data and rename columns
XtrainAll <- cbind(subjectTrainv, activityLabTrainv, Xtraindf)
names(XtrainAll)[1] <- "Subject"
names(XtrainAll)[2] <- "Activity"

XAll <- rbind(XtestAll, XtrainAll)

#Aggregate by Subject and Activity and calculate mean for other variables
attach(XAll)
XAll2 <- aggregate(XAll, by=list(Activity, Subject), FUN=mean, na.rm=TRUE)

#Drop extra columns
XAll2$Subject <- NULL
XAll2$Activity <- NULL

#Rename grouping columns
names(XAll2)[1] <- "Activity"
names(XAll2)[2] <- "Subject"

write.csv(Xall2,"ActivityRecognitionSummaryStats.csv")



