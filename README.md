GettingAndCleaningDataProject =============================

The is a repository for project files used in the Getting and Cleaning
Data course taught by Jeff Leek, PhD on Coursera.

The goal of the project was to produce a tidy dataset from a set of data
files derived from experiments in which the detailed movements of human
volunteers were captured using the embedded accelerometers and gyroscope
of a Samsung Galaxy II smartphone.

The tidy dataset is composed of the mean values summarized by volunteer
and activity of all individual mean and standard deviation measures of
the source data.  The tidy dataset includes both training and test data
from the experiments.  Details about the source data can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+
Smartphones.

The included script run_analysis.R will produce the tidy dataset using
R, the statistical computing software. The script assumes that the
source data
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%
20HAR%20Dataset.zip) has been downloaded and unzipped into the the
working directory of the R session.
