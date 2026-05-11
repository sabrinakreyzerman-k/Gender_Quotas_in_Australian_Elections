#### Preamble ####
# Purpose: Test Australian Politicians Package
# Author: Inessa De Angelis
# Date: 7 May 2026
# Contact: inessa.deangelis@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 
  # 01-download_data.R

#### Workspace setup ####
## Load packages ##
library(tidyverse)

## Read in datasets ##
politician_data <- read_csv("Data/Raw/politician_data.csv")
party_data <- read_csv("Data/Raw/party_data.csv")
mp_data <- read_csv("Data/Raw/mp_data.csv")

#### Clean data ####
## Select relevant columns ##
clean_politician_data <- politician_data |>
  rename(name = displayName) |>
  select(uniqueID, name, gender, birthDate, member)

clean_party_data <- party_data |>
  select(uniqueID, partyAbbrev, partyName, partySimplifiedName)

clean_mp_data <- mp_data |>
  rename(year_elected = mpFrom) |>
  select(uniqueID, year_elected)

## Convert date of MP from to year only ##
clean_mp_data$year_elected <-year(clean_mp_data$year_elected)

#### Save dataset ####
write_csv(clean_politician_data, "Data/Clean/cleaned_politicians_data.csv")
write_csv(clean_party_data, "Data/Clean/cleaned_party_data.csv")
write_csv(clean_mp_data, "Data/Clean/cleaned_mp_data.csv")

#### Match up datasets ####
clean_politician_data <- clean_politician_data |>
  left_join(clean_party_data, by = "uniqueID")

clean_politician_data <- clean_politician_data |>
  left_join(clean_mp_data, by = "uniqueID")

#### Save match up dataset ####
write_csv(clean_politician_data, "Data/Clean/combined_politician_dataset.csv")
