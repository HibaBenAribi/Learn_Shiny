# Install required packages if not already installed
install_packages <- c("readr", "dplyr", "ggplot2", "readxl", "shiny", "shinyFiles", "DT")
new_packages <- install_packages[!(install_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

# Load required packages
library(readr)
library(dplyr)
library(ggplot2)
library(readxl)
library(shiny)
library(shinyFiles)
library(DT)
