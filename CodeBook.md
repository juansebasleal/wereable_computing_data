---
title: "CodeBook"
author: "Sebastian Leal"
date: "5/1/2020"
output: html_document
---

1. Pleae download the data found in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and place the contents of "UCI HAR Dataset" inside your project data folder.
2. We then load in memory variables for the files: activities, features, subjects, and x and y test and train data. We clean up feature names.
3. Then we merge everything in a single file, with the usage of row and column binding.
4. Then we extract only mean and standard dev variables.
5. Finally we generate average info by subject and activity.