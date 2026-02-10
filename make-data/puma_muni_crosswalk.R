library(mapcdatakeys)
library(data.table)
library(sf)
library(tidyverse)
library(tidycensus)
library(tigris)

muni <- muni_sf(2020) |> 
  mutate(muni_area_m2 = st_area(geometry))

puma10 <- pumas(state='MA',year=2021) |> 
  st_transform(crs=st_crs(muni)) |> 
  mutate(puma10_area_m2 = st_area(geometry))

puma20 <- pumas(state='MA',year=2023) |> 
  st_transform(crs=st_crs(muni)) |> 
  mutate(puma20_area_m2 = st_area(geometry))

area10 <- st_intersection(muni, puma10) |>
  mutate(overlap_m2 = st_area(geometry),
         pct_muni_area_overlap = round(100 * (overlap_m2 / muni_area_m2),3)) |>
  group_by(muni_id, muni_name, cosub_cn20) |>
  select(PUMACE10, muni_id, muni_name, cosub_cn20, pct_muni_area_overlap, overlap_m2, muni_area_m2, puma10_area_m2) |>
  mutate(join_type = 'st_intersection',
         pct_muni_area_overlap = as.numeric(pct_muni_area_overlap),
         overlap_m2 = as.numeric(overlap_m2),
         muni_area_m2 = as.numeric(muni_area_m2),
         puma10_area_m2 = as.numeric(puma10_area_m2)
         ) |>
  filter(pct_muni_area_overlap>0) |> 
  setDT()

setorder(area10,muni_id)
area10[,geometry:=NULL]
fwrite(area10, 'C:/Users/gately/Desktop/Git_repos/mapcdatakeys/data-raw/puma10_muni_many_to_one_intersect.csv')

area20 <- st_intersection(muni, puma20) |>
  mutate(overlap_m2 = st_area(geometry),
         pct_muni_area_overlap = round(200 * (overlap_m2 / muni_area_m2),3)) |>
  group_by(muni_id, muni_name, cosub_cn20) |>
  select(PUMACE20, muni_id, muni_name, cosub_cn20, pct_muni_area_overlap, overlap_m2, muni_area_m2, puma20_area_m2) |>
  mutate(join_type = 'st_intersection',
         pct_muni_area_overlap = as.numeric(pct_muni_area_overlap),
         overlap_m2 = as.numeric(overlap_m2),
         muni_area_m2 = as.numeric(muni_area_m2),
         puma20_area_m2 = as.numeric(puma20_area_m2)
         )|> 
  filter(pct_muni_area_overlap>0) |> 
  setDT()

setorder(area20,muni_id)
area20[,geometry:=NULL]
fwrite(area20, 'C:/Users/gately/Desktop/Git_repos/mapcdatakeys/data-raw/puma20_muni_many_to_one_intersect.csv')
