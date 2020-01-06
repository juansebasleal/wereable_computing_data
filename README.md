---
title: "README.md"
author: "Sebastian Leal"
date: "5/1/2020"
output: html_document
---

Three are the main files of this project. Its purpose is allowing you to clean the data related to the "Human Activity Recognition Using Smartphones Data Set" that you can find here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* run_analysis.R: Is the one that does the dirty work. It read the data and manipulates it to get a clean data set:
    * Merges all data avaiable into a single one
    * Extracts only mean an std dev for each measurement
    * Assign descriptive names for activities (sleeping, lying, etc.)
    * Assing descriptive names for each column
    * Generates the average of each variable for each activity and each subject
* CodeBook.R: Contains details about the tidy data generated.
* final_data.txt: Contains the tidy data