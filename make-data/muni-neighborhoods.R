library(tidyverse)

# we shouldn't need to run this script again, for future updates start from the file output by this script and add new rows

# XW by Alexa and Zoe based on
mapc_xw1 <- readxl::read_xlsx("C:/Users/aderosa/OneDrive - Metropolitan Area Planning Council/Shared Documents - Data Services/_Datasets (Final datasets only!)/_Crosswalks/Archive/Neighborhood-Muni Crosswalk.xlsx")

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
  distinct() |> 
  mutate(
    ma_muni = ifelse(state == "MA", TRUE, FALSE)
  ) |> 
  group_by(neighborhood) |> 
  #identifying and flagging duplicates
  mutate(
    dup_count = n(),
    duplicate = ifelse(dup_count > 1, TRUE, FALSE)
  ) |> 
  select(-c(dup_count))

# write .csv to folder
write.csv(updated_xw, "data-raw/neighborhood_muni_xw.csv")
# write .csv to DS sharepoint
writexl::write_xlsx(updated_xw, "C:/Users/aderosa/OneDrive - Metropolitan Area Planning Council/Shared Documents - Data Services/_Datasets (Final datasets only!)/_Crosswalks/neighborhood_muni_xw.xlsx")
  