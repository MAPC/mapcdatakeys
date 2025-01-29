library(tidyverse)

# XW by Alexa and Zoe based on 
mapc_xw1 <- readxl::read_xlsx("C:/Users/aderosa/OneDrive - Metropolitan Area Planning Council/Shared Documents - Data Services/_Datasets (Final datasets only!)/_Crosswalks/Neighborhood-Muni Crosswalk.xlsx")

# first and second sheet of zipcode csv from Conor
mapc_zip1 <- readxl::read_xlsx("C:/Users/aderosa/Downloads/Zipcode_Neighborhood_Suburb_Town_crosswalk.xlsx", sheet = 1) |> 
  mutate(
    neighborhood = str_to_title(SuburbName),
    muni = str_to_title(ExciseGarageCity),
    state = "MA"
           ) |> 
  select(neighborhood, muni, state)
  
mapc_zip2 <- readxl::read_xlsx("C:/Users/aderosa/Downloads/Zipcode_Neighborhood_Suburb_Town_crosswalk.xlsx", sheet = 2) |> 
  janitor::clean_names() |> 
  filter(pc_type != "UNIQUE ORGANIZATION") |> 
  mutate(
    neighborhood = str_to_title(pa_name),
    muni = str_to_title(city_town),
    state = "MA"
  ) |> 
  select(neighborhood, muni, state)

# Mass GIS published xw
massgis_xw <- readxl::read_xlsx("C:/Users/aderosa/Downloads/TOWNNAME_LOOKUP(1)/TOWNNAME_LOOKUP/TOWNNAME_LOOKUP.xlsx") |> 
  janitor::clean_names() |> 
  select(alt_name, town) |> 
  rename(neighborhood = alt_name, muni = town) |> 
  mutate(state = "MA") |> 
  distinct()

# Join all tables
updated_xw <- mapc_xw1 |> 
  select(-c(ma_muni)) |> 
  rbind(massgis_xw, mapc_zip1, mapc_zip2) |> 
  mutate(
    ma_muni = ifelse(state == "MA", TRUE, FALSE)
  ) |> 
  distinct()

# write .csv to folder
write.csv(updated_xw, "data-raw/neighborhood_muni_xw.csv")
  