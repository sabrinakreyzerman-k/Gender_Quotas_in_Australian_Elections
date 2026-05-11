#### Preamble ####
# Purpose: Create table for Gender, Parties, and Elected MPs
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
## Create table for Gender, Parties, and Elected MPs ##

#| message: false
#| echo: false
#| label: tbl-gender_party
#| tbl-cap: Number of MPs broken down by gender and party

combined_politician_dataset |> 
  filter(partySimplifiedName == "Liberals" | partySimplifiedName == "Labor") |>
  group_by(gender, partySimplifiedName) |>
  count() |>
  ungroup() |>
  mutate(percentage = round(n / sum(n) * 100, 2)) |>
  kable(
    col.names = c("Gender", "Party", "Number of MPs",	"Percentage of MPs"),
    booktabs = TRUE)