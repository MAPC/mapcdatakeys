#' puma_sf
#'
#' Downloads a shapefile / sf object of Census Public Use Microdata Areas (PUMAs) from the tigris package.
#' 
#' New PUMA geographies are typically created 2-3 years after each decennial census. 
#' 
#' Census 5-year ACS and PUMS datasets will contain both the "old" and "new" PUMA codes when the 5-year period
#' spans the introduction year of the new PUMA geographies.
#' 
#' Selecting yr = 2020 for this function will produce the 2020 vintage PUMAs that first show up in the 2022 
#' ACS/PUMS datasets. In mixed-vintage PUMS datasets, there will be two different ID codes for the different PUMA
#' vintages: PUMACE10 for the 2010 vintage and PUMACE20 for the 2020 vintage, depending on when the household was
#' surveyed in the 5-year period. 
#' 
#' From 2023 onwards, the Census Bureau has recoded houesholds into the new 2020 
#' PUMA geographies, so crosswalking is not required.
#'
#' @param yr The vintage year for the geography (2010 or 2020).
#'
#' @returns An sf object projected into EPSG: 26986 - NAD83 / Massachusetts Mainland State Plane (meters)
#' @export
#' @examples #pending
puma_sf <- function(yr){
  if (yr == 2010) {
    sf <- tigris::pumas(state = 'MA', year = 2021) |>
      sf::st_transform(crs = 26986) |> 
      dplyr::select(PUMACE10, geometry) |>
      dplyr::mutate(puma10_area_m2 = as.numeric(sf::st_area(geometry)))
  }
  if (yr == 2020) {
    sf <- tigris::pumas(state = 'MA', year = 2023) |>
      sf::st_transform(crs = 26986) |> 
      dplyr::select(PUMACE20, geometry) |>
      dplyr::mutate(puma20_area_m2 = as.numeric(sf::st_area(geometry)))
  }
  return(sf)
}