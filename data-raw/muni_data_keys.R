library(tidyverse)

muni_data_keys <- read_csv("data-raw/muni_data_keys_new.csv") %>% arrange(muni_id)

census_muni_keys <- muni_data_keys %>% select(muni_id, muni_name, starts_with("cosub"))

community_type <- muni_data_keys %>% select(muni_id, muni_name, cmtyp08_id, cmtyp08, cmsbt08_id, cmsbt08)

rpa_data_keys <- muni_data_keys %>% select(muni_id, muni_name, rpa_id, rpa_acr, rpa_name, rpa_alt)

mapc_data_keys <- muni_data_keys %>% select(muni_id, muni_name, mapc, mmc, nsc, subrg_id, subrg_nm, subrg_acr, subrg_alt)

mbta_data_keys <- muni_data_keys %>% select(muni_id, muni_name, rta_acr, rta_name, mbta, mbta14, mbta51, mbta_other, mbta_cmtyp)

usethis::use_data(census_muni_keys, muni_data_keys, community_type, rpa_data_keys, mapc_data_keys, mbta_data_keys,
                  overwrite = TRUE)
