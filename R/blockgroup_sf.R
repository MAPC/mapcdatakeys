#' blockgroup_sf
#'
#' Downloads a shapefile / sf object of Census Block Groups from the tigris package
#' 
#' @param yr The vintage year for the geography (2010 or 2020)
#'
#' @returns An sf object projected into EPSG: 26986 - NAD83 / Massachusetts Mainland State Plane (meters)
#' 
#' @export
#'
#' @examples #pending
blockgroup_sf <- function(yr) {
  id <- paste0('bg', substr(yr, 3, 4), '_id')
  if (yr == 2010) {
    xw <- mapcdatakeys::bg_muni_xw_2010 |>
      dplyr::mutate({{id}} := as.character(get(id)))
    sf <- tigris::block_groups(state = 'MA', year = yr) |>
      dplyr::select(GEOID10, geometry) |>
      stats::setNames(c(id, 'geometry')) |>
      dplyr::left_join(xw, by = id) |>
      sf::st_as_sf() |>
      sf::st_transform(crs = 26986)
  }
  if (yr == 2020) {
    xw <- mapcdatakeys::bg_muni_xw_2020 |>
      dplyr::mutate({{id}} := as.character(get(id)))
    sf <- tigris::block_groups(state = 'MA', year = yr) |>
      dplyr::select(GEOID, geometry) |>
      stats::setNames(c(id, 'geometry')) |>
      dplyr::left_join(xw, by = id) |>
      sf::st_as_sf() |>
      sf::st_transform(crs = 26986)
  }
  return(sf)
}