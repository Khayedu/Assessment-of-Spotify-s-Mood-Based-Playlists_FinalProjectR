# Khaneya Womack
#R Reproducability For Final Project
# Initialization --------------------------------------------------------------
#install.packages("spotifyr")
#install.packages("cluster")
#install.packages("fpc")
#install.packages("factoextra")
#install.packages("tidyverse")
#install.packages("knitr")
#install.packages("dplyr")
#install.packages("bruceR")
#install.packages("gmodels")

# Libraries ---------------------------------------------------------------

library(spotifyr)
library(tidyverse)
library(knitr)
library(ggplot2)
library(dplyr)
library(cluster) #Silhouette
library(fpc) #cluster.stats
library(factoextra) #fviz
library(bruceR) #scaler
library(gmodels) #Crosstable


# Startup Function --------------------------------------------------------

startup <- function() {
  
  # Getting the working directory
  wd <- getwd()
  
  # Creating extra directories --------------------------------------------------
  directories <- c("Data - Raw", "Data - Clean", "Results", "Scripts", 
                   "Figures")
  
  if (file.exists("ReadMe.txt")){
    print("Directories already exist")
  } else {
    dir.create("Data - Raw")
    dir.create("Data - Clean")
    dir.create("Results")
    dir.create("Scripts")
    dir.create("Figures")
    file.create("ReadMe.txt")
  }
  
  
  # Creating other scripts ------------------------------------------------------
  files <- c("DataClean.R","DataVis.R","DataAnalysis.R","Functions.R")
  
  if (file.exists(files[1])) {
    print("Files already exist")
  } else {
    file.create("Scripts/DataClean.R")
  }
  
  if (file.exists(files[2])) {
    print("Files already exist")
  } else {
    file.create("Scripts/DataVis.R")
  }
  
  if (file.exists(files[3])) {
    print("Files already exist")
  } else {
    file.create("Scripts/DataAnalysis.R")
  }
  
  if (file.exists(files[4])) {
    print("Files already exist")
  } else {
    file.create("Scripts/Functions.R")
  }
  
  
  # Sources -----------------------------------------------------------------
  
  source("Scripts/Functions.R")    
  
}

startup()

# Next we run DataClean.R, found in the scripts folder


