library(tidyverse)

all_muni_data_keys <- read_csv("data-raw/muni_data_keys_new.csv") %>% arrange(muni_id)

census_muni_keys <- all_muni_data_keys %>% select(muni_id, muni_name, starts_with("cosub"))

community_type <- all_muni_data_keys %>% select(muni_id, muni_name, cmtyp08_id, cmtyp08, cmsbt08_id, cmsbt08)

rpa_data_keys <- all_muni_data_keys %>% select(muni_id, muni_name, rpa_id, rpa_acr, rpa_name, rpa_alt)

mapc_data_keys <- all_muni_data_keys %>% select(muni_id, muni_name, mapc, mmc, nsc, subrg_id, subrg_nm, subrg_acr, subrg_alt)

mbta_data_keys <- all_muni_data_keys %>% select(muni_id, muni_name, rta_acr, rta_name, mbta, mbta14, mbta51, mbta_other, mbta_cmtyp)


# 2010 Geographies
census_xw_bl10 <- read_csv("data-raw/bl10_2020xw.csv") %>% 
  select(!c(ct_area, weight)) %>% rename(bl10_id = geoid10) %>% 
  rename(huch1020p = hu_chng_p,
         popch1020p = pop_chng_p,
         huch1020 = hu_chng,
         popch1020 = pop_chng)
census_xw_bg10 <- read_csv("data-raw/bg10_2020xw.csv") %>% 
  rename(huch1020p = hu_chng_p,
         popch1020p = pop_chng_p,
         huch1020 = hu_chng,
         popch1020 = pop_chng)
census_xw_ct10 <- read_csv("data-raw/ct10_2020xw.csv") %>% 
  rename(huch1020p = hu_chng_p,
         popch1020p = pop_chng_p,
         huch1020 = hu_chng,
         popch1020 = pop_chng)
census_xw_mu <- read_csv("data-raw/muni_2020xw.csv") %>% select(!seq_id) %>% 
  janitor::clean_names() %>% 
  rename(muni_name = basename,
         cosub_cn10 = geoid_2010,
         cosub_cn20 = geoid_2020,
         huch1020p = huch1020pc)

# 2020 Geographies
census_xw_bl20 <- read_csv("data-raw/bl20_2010xw.csv") %>% 
  select(!c(ct_area, weight)) %>% rename(bl20_id = geoid20) %>% 
  rename(huch1020p = hu_chng_p,
         popch1020p = pop_chng_p,
         huch1020 = hu_chng,
         popch1020 = pop_chng)
census_xw_bg20 <- read_csv("data-raw/bg20_2010xw.csv") %>% 
  rename(huch1020p = hu_chng_p,
         popch1020p = pop_chng_p,
         huch1020 = hu_chng,
         popch1020 = pop_chng)
census_xw_ct20 <- read_csv("data-raw/ct20_2010xw.csv") %>% 
  rename(huch1020p = hu_chng_p,
         popch1020p = pop_chng_p,
         huch1020 = hu_chng,
         popch1020 = pop_chng)



geog_xw_2010 <- read_csv("data-raw/2010_block_to_geo_crosswalk.csv")
geog_xw_2020 <- read_csv("data-raw/2020_block_to_geo_crosswalk.csv")


usethis::use_data(census_muni_keys, all_muni_data_keys, community_type, rpa_data_keys, mapc_data_keys, mbta_data_keys,
                  census_xw_bl10, census_xw_bg10, census_xw_ct10, 
                  census_xw_bl20, census_xw_bg20, census_xw_ct20, 
                  geog_xw_2010, geog_xw_2020, census_xw_mu,
                  overwrite = TRUE)
