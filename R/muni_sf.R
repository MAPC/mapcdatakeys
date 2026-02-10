#' muni_sf
#'
#' Downloads a shapefile / sf object of Massachusetts municipal boundaries from the tigris package
#' 
#' @param yr The vintage year for the geography (2010 or 2020)
#'
#' @returns An sf object projected into EPSG: 26986 - NAD83 / Massachusetts Mainland State Plane (meters)
#' 
#' @export
#'
#' @examples #pending
muni_sf <- function(yr) {
  id <- paste0('cosub_cn', substr(yr, 3, 4))
  if (yr == 2010) {
    sf <- tigris::county_subdivisions(state = 'MA', year = yr) |>
      dplyr::mutate(GEOID10 = as.numeric(GEOID10)) |>
      dplyr::select(GEOID10, geometry) |>
      stats::setNames(c(id, 'geometry')) |>
      sf::st_as_sf()
    
  }
  if (yr == 2020) {
    sf <- sf::st_as_sf(tigris::county_subdivisions(state = 'MA', year = yr)) |>
      dplyr::mutate(GEOID = as.numeric(GEOID)) |>
      dplyr::select(GEOID, geometry) |>
      stats::setNames(c(id, 'geometry')) |>
      sf::st_as_sf()
  }
  
  ms <- mapcdatakeys::all_muni_data_keys |>
    dplyr::select(muni_id, muni_name, id) |>
    dplyr::left_join(sf, by = id) |>
    dplyr::mutate({{id}} := as.character(get(id))) |>
    sf::st_as_sf()
  msp <- sf::st_transform(ms, crs = 26986)
  
  return(msp)
}