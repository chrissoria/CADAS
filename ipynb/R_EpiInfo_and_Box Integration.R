# ###########################################################
# Read and write Epi Info 7 data
# Author: Roger Mir
# Date: 02/01/2023
#############################################################

LIBRARY_PATH <- "C:\\R\\R-4.1.2"
.libPaths(LIBRARY_PATH)

library(openxlsx)
if(!require(dplyr)) install.packages("dplyr")
library(dplyr) 
if(!require(boxr)) install.packages('boxr')
library(boxr)
if(!require(rjson)) install.packages('rjson')
library(rjson)
library(purrr)
if(!require(tidyverse)) install.packages('tidyverse')
library(tidyverse)
library(jsonlite)

box_auth(client_id="mxdvciefwrb4oprmnbfdfjw6en09krh6", client_secret="AlnAvyrDpaBmrqv4vyYEaR5LPJDrDqb9") # Connecting to Google Box account
box_ls()

box_setwd("212415225785") # Set working directory on Box platform
box_ls()

# Download all files from the current Box folder
box_fetch(dir_id = box_getwd(), local_dir = "C:\\Users\\jca6\\Desktop\\EpiInfo Box API Data", recursive = FALSE, overwrite = FALSE, delete = FALSE)

# ######################################################################
# The codes below, rename all files in the local computer directory    #
########################################################################
working_dir <- 'C:/Users/jca6/Desktop/EpiInfo Box API Data/' # Set the local directory
working_dir
file_name_txt <- list.files(working_dir, pattern = "*.txt", full.names = TRUE) # Read current file names w/full path
file_name_txt # Display file names with path

file_name_json <- gsub(".txt$", ".json", file_name_txt) # create a list of file names w/ json extension
file_name_json  # Display new file names

file.rename(file_name_txt, file_name_json) # Rename OLD file name to NEW file names


############################################################################
# Read all json files in a folder and append them to a single Excel file   #
############################################################################
files_json <- dir(working_dir, pattern = "*.json")
files_json

data <- files_json %>%
  map_df(~fromJSON(file.path(working_dir, .), flatten = TRUE))

write.xlsx(data, 'C:\\Users\\jca6\\Desktop\\EpiInfo Box API Data\\All_jsondata.xlsx', sheetName="Healthy_Homes")





