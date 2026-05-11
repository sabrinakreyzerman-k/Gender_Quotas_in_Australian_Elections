#### Preamble ####
# Purpose: Graph female MPs over time
# Author: Sabrina Kreyzerman
# Date: 11 May 2026
# Contact: sabrina.kreyzerman@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  #

#### Workspace setup ####
## Load packages ##
library(tidyverse)

## Read in datasets ##
cleaned_politician_data <- read_csv("Data/Clean/cleaned_politicians_data.csv")
cleaned_party_data <- read_csv("Data/Clean/cleaned_party_data.csv")
cleaned_mp_data <- read_csv("Data/Clean/cleaned_mp_data.csv")
combined_politician_dataset <- read_csv("Data/Clean/combined_politician_dataset.csv")

#### Executing purpose ####
## Graph female MPs over time ##