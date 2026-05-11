#### Preamble ####
# Purpose: Download Australian election data
# Author: Inessa De Angelis
# Date: 7 May 2026
# Contact: inessa.deangelis@mail.utoronto.ca 
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(AustralianPoliticians)

#### Download data ####
## Download politician data ##
politician_data <- get_auspol("all") 

## Download party data ##
party_data <- get_auspol("allbyparty")

## Download MP data ##
mp_data <- get_auspol("mps")

#### Save datasets ####
write_csv(politician_data, "Data/Raw/politician_data.csv")
write_csv(party_data, "Data/Raw/party_data.csv")
write_csv(mp_data, "Data/Raw/mp_data.csv")
