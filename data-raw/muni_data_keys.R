#===============================================================================
# 0.0 Environment Setup
# 0.1 Load Relevant Libraries
library(usethis)
library(roxygen2)
library(devtools)
library(data.table)
library(tidycensus)
library(tidyverse)
library(sf)
options(scipen = 999)
set.seed(351)

# if cloning repo to local machine, set wd to the mapcdatakeys folder
# setwd("C:/Users/MAPCStaff/Desktop/GIT_Kontiki/mapcdatakeys/")

# Use this function to get the 'latest' ACS Municipal GEOID (aka cosub id) for the given new year.

# Run this entire script before moving on to next steps as listed in the attached .txt file.

# 0.2 User Input for ACS Years
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ~~~ USER INPUT REQUIRED ~~~ #
# Add last year of ACS data you wish to update into the "years" list below
years <- c(2020,2021,2022,2023)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# 0.3 Create function which reads in and cleans each new year of ACS data
acs_name <- function(acs_year){
  tidycensus::get_acs(
    geography = "county subdivision",
    table = "B01001",
    year = acs_year,
    state = 25,
    cache_table = T
  )  |>  
    filter(variable == "B01001_001", !str_detect(NAME, "County subdivisions not defined")) |> 
    mutate(
      NAME = gsub(pattern = " Town.*", "", NAME),
      NAME = gsub(pattern = " city.*", "", NAME),
      NAME = gsub(pattern = " town.*", "", NAME)
    ) |>  
    select(GEOID, NAME) |> 
    rename(muni_name = NAME) %>%  
    rename_with(., .cols = GEOID, .fn = function(x){paste0('cosub_5y', str_sub(as.character(acs_year), start = 3, end = 4))})
  }

#===============================================================================
# 1.0 All Muni Data Keys ------------------------------------------------------
# 1.1 Loads base muni_data_keys file
muni_data_keys_new <- read_csv("data-raw/muni_data_keys_new.csv")

# 1.2 Loop which reads each new year of ACS data. 
# Then appends the updated cosub_id to the base muni data keys file
for (i in years){
  # Load current year ACS table
  tmp <- acs_name(acs_year = i)
  
  # Join current year ACS to 
  muni_data_keys_new <- left_join(
    muni_data_keys_new,
    tmp,
    by = c("muni_name")
  )
  
  # Remove tmp file
  rm(tmp)
  
  # Print when finished with current year
  print(paste0("Finished updating ACS Year Ending in ", i))
}

# 1.3 Clean Parent Table and MPO fields
all_muni_data_keys <- muni_data_keys_new |> 
  select(muni_id, muni_name, starts_with("cosub_5y"), sort(tidyselect::peek_vars())) |>
  arrange(muni_id) |> 
  #Assigns MPO affiliation to municipalities
  mutate(
    mpo = case_when(
      muni_name == "Hanover" ~ "OCPC",
      muni_name == "Stoughton" ~ "OCPC",
      muni_name == "Pembroke" ~ "OCPC",
      muni_name == "Duxbury" ~ "OCPC",
      .default = rpa_acr
    ),
    mpo_name = case_when(
      muni_name == "Hanover" ~ "Old Colony Planning Council",
      muni_name == "Stoughton" ~ "Old Colony Planning Council",
      muni_name == "Pembroke" ~ "Old Colony Planning Council",
      muni_name == "Duxbury" ~ "Old Colony Planning Council",
      .default = rpa_name
    ),
    mpo_id = case_when(
      muni_name == "Hanover" ~ 399,
      muni_name == "Stoughton" ~ 399,
      muni_name == "Pembroke" ~ 399,
      muni_name == "Duxbury" ~ 399,
      .default = rpa_id
    )
   ) |>
  select(
    -c(rpa_alt)
  ) |> 
  relocate(mpo, mpo_name, mpo_id, .after = rpa_name) 

# Pull muni_id indicator to add to other muni-level tables
muni_id.tbl <- all_muni_data_keys |> select(muni_id, muni_name)

# Subset Tables which are collections of similarly linked variables
census_muni_keys <- all_muni_data_keys |>  select(muni_id, muni_name, starts_with("cosub"))

community_type <- all_muni_data_keys |>  select(muni_id, muni_name, cmtyp08_id, cmtyp08, cmsbt08_id, cmsbt08)

rpa_data_keys <- all_muni_data_keys |>  select(muni_id, muni_name, rpa_id, rpa_acr, rpa_name, mpo, mpo_id, mpo_name)

mapc_data_keys <- all_muni_data_keys |> select(muni_id, muni_name, mapc, mmc, nsc, subrg_id, subrg_nm, subrg_acr, subrg_alt)

mbta_data_keys <- all_muni_data_keys |>  select(muni_id, muni_name, rta_acr, rta_name, mbta, mbta14, mbta51, mbta_other, mbta_cmtyp)

# 2010 Geography Crosswalks ----
# Source: IPUMS
# 2010 Blocks to 2020 Block Crosswalk
census_xw_bl10 <- read_csv("data-raw/bl10_2020xw.csv") |> 
  select(!c(ct_area, weight)) |> 
  dplyr::rename(
    bl10_id = geoid10,
    huch1020p = hu_chng_p,
    popch1020p = pop_chng_p,
    huch1020 = hu_chng,
    popch1020 = pop_chng
  )
# 2010 Block Group to 2020 Block Group
census_xw_bg10 <- read_csv("data-raw/bg10_2020xw.csv") |>  
  dplyr::rename(
    huch1020p = hu_chng_p,
    popch1020p = pop_chng_p,
    huch1020 = hu_chng,
    popch1020 = pop_chng
  )
# 2010 county to 2020 county
census_xw_ct10 <- read_csv("data-raw/ct10_2020xw.csv") |>  
  dplyr::rename(
    huch1020p = hu_chng_p,
    popch1020p = pop_chng_p,
    huch1020 = hu_chng,
    popch1020 = pop_chng
  )
# 2010 county to 2020 county
census_xw_mu <- read_csv("data-raw/muni_2020xw.csv") |> 
  select(!seq_id) |>  
  janitor::clean_names() |> 
  dplyr::rename(
    muni_name = basename,
    cosub_cn10 = geoid_2010,
    cosub_cn20 = geoid_2020,
    huch1020p = huch1020pc
  )

# 2020 Geography Crosswalks ----
# Source: IPUMS
#
census_xw_bl20 <- read_csv("data-raw/bl20_2010xw.csv") |>  
  select(!c(ct_area, weight)) |> 
  dplyr::rename(
    bl20_id = geoid20,
    huch1020p = hu_chng_p,
    popch1020p = pop_chng_p,
    huch1020 = hu_chng,
    popch1020 = pop_chng
  )
#
census_xw_bg20 <- read_csv("data-raw/bg20_2010xw.csv") |>  
  rename(
    huch1020p = hu_chng_p,
    popch1020p = pop_chng_p,
    huch1020 = hu_chng,
    popch1020 = pop_chng
  )
#
census_xw_ct20 <- read_csv("data-raw/ct20_2010xw.csv") |>  
  dplyr::rename(
    huch1020p = hu_chng_p,
    popch1020p = pop_chng_p,
    huch1020 = hu_chng,
    popch1020 = pop_chng
  )

# Geographic Crosswalks ----
# 1. Pure Geographic Crosswalk 
# Not a one to one crosswalk for several georgraphies. USE WITH CAUTION.
# TODO: 
# Add a flag for duplicate columns. 
# Add a column that directs to the areal or population overlap tables.
geog_xw_2010 <- read_csv("data-raw/2010_block_to_geo_crosswalk.csv")
geog_xw_2020 <- read_csv("data-raw/2020_block_to_geo_crosswalk.csv")

# 2. Areal Overlap Table for Geographic Crosswalks
# TODO:
# Column for ranking areal overlap.

# 3. Population Overlap Table for Geographic Crosswalks
# TODO:
# Column for ranking population overlap.

# 4. Land-use/Land Cover Exclusion Table for Geographic Crosswalks.
# Flag for presence within a geography
# Prisons, universities, airforce bases, etc.

# Neighborhood to Municipality Crosswalk ---
nbhd_muni_xw <- read_csv("data-raw/nbhd_muni_xw.csv") |>
  dplyr::rename(muni_name = muni) |> 
  left_join(
    muni_id.tbl,
    by = c("muni_name")
  )

# ZIP Code to Municipality Crosswalk ---
zip_muni_xw <- read_csv("data-raw/zip_muni_xw.csv") |> 
  mutate(
    zip = str_pad(as.character(zip), width = 5, side = "left", pad = "0")
  ) |> 
  dplyr::rename(
    muni_name = muni
  ) |> 
  left_join(
    muni_id.tbl,
    by = c("muni_name")
  )

# Functions that load spatial objects of common boundaries

muni_sf <- function(yr) {
  
  if(yr==2010){var <- 'H001001'}
  if(yr==2020){var <- 'H1_001N'}
  
  id <- paste0('cosub_cn',substr(yr,3,4))
  
  sfm <-
    get_decennial(
      year = yr,
      state = 'MA',
      geography = 'county subdivision',
      variables = var,
      geometry = T
    ) |> 
    mutate(GEOID = as.numeric(GEOID)) |> 
    select(GEOID, geometry) |> 
    setNames(c(id,'geometry'))
  
  ms <- mapcdatakeys::all_muni_data_keys |> 
    select(muni_id, muni_name, id) |> 
    left_join(sfm, by = id) 
  
  return(ms)
}

block_sf <- function(yr) {
 
  id <- paste0('bl',substr(yr,3,4),'_id')
  
  sf <- tigris::blocks(state='MA', year=yr) |> 
    mutate(GEOID10 = as.numeric(GEOID10)) |> 
    select(GEOID10, geometry) |> 
    setNames(c(id,'geometry'))
  
  return(blk)
}

blockgroup_sf <- function(yr) {
  
  if(yr==2010){var <- 'H001001'}
  if(yr==2020){var <- 'H1_001N'}
  
  id <- paste0('bg',substr(yr,3,4),'_id')
  
  sf <-
    get_decennial(
      year = yr,
      state = 'MA',
      geography = 'block group',
      variables = var,
      geometry = T
    ) |> 
    mutate(GEOID = as.numeric(GEOID)) |> 
    select(GEOID, geometry) |> 
    setNames(c(id,'geometry'))
  
  xw <- paste0('geog_xw_',yr)
  
  bg <- get(xw) |> 
    select(-county,-statefp,-countyfp,-cousubfp) |> 
    left_join(sf, by = id) 
  
  return(bg)
}

tract_sf <- function(yr) {
  
  if(yr==2010){var <- 'H001001'}
  if(yr==2020){var <- 'H1_001N'}
  
  id <- paste0('ct',substr(yr,3,4),'_id')
  
  sf <-
    get_decennial(
      year = yr,
      state = 'MA',
      geography = 'tract',
      variables = var,
      geometry = T
    ) |> 
    mutate(GEOID = as.numeric(GEOID)) |> 
    select(GEOID, geometry) |> 
    setNames(c(id,'geometry'))
  
  xw <- paste0('geog_xw_',yr)
  
  ct <- get(xw) |> 
    select(-county,-statefp,-countyfp,-cousubfp) |> 
    left_join(sf, by = id) 
  
  return(ct)
}

ej_sf <- readRDS('data-raw/environmental_justice_blockgroups_2020_shapefile.rds')


# ~~~ USER INPUT REQUIRED ~~~~ #
# If you define any new or additional tables, please add them to the list below.
usethis::use_data(census_muni_keys, all_muni_data_keys, community_type, rpa_data_keys,
                  mapc_data_keys, mbta_data_keys, census_xw_bl10, census_xw_bg10,
                  census_xw_ct10, census_xw_bl20, census_xw_bg20, census_xw_ct20, 
                  geog_xw_2010, geog_xw_2020, census_xw_mu, nbhd_muni_xw, zip_muni_xw, ej_sf, muni_sf, block_sf, blockgroup_sf, tract_sf,
                  overwrite = TRUE, internal = FALSE)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

#Check for errors in compiling the package
devtools::check(document=FALSE)
