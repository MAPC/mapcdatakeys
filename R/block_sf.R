#' block_sf
#'
#' Downloads a shapefile / sf object of Census Blocks from the tigris package
#' 
#' @param yr The vintage year for the geography (2010 or 2020)
#'
#' @returns An sf object projected into EPSG: 26986 - NAD83 / Massachusetts Mainland State Plane (meters)
#' 
#' @export
#'
#' @examples #pending
block_sf <- function(yr) {
  id <- paste0('bl', substr(yr, 3, 4), '_id')
  if (yr == 2010) {
    sf <- tigris::blocks(state = 'MA', year = yr) |>
      dplyr::mutate(GEOID10 = as.numeric(GEOID10)) |>
      dplyr::select(GEOID10, geometry) |>
      stats::setNames(c(id, 'geometry'))
    blk <- mapcdatakeys::geog_xw_2010 |>
      dplyr::select(eval(id), muni_id, muni_name) |>
      dplyr::left_join(sf, by = id) |>
      dplyr::mutate({{id}} := as.character(get(id))) |>
      sf::st_as_sf()
    blk <- sf::st_transform(blk, crs = 26986)
    return(blk)
  }
  if (yr == 2020) {
    sf <- tigris::blocks(state = 'MA', year = yr) |>
      dplyr::mutate(GEOID = as.numeric(GEOID20)) |>
      dplyr::select(GEOID, geometry) |>
      stats::setNames(c(id, 'geometry'))
    blk <- mapcdatakeys::geog_xw_2020 |>
      dplyr::select(eval(id), muni_id, muni_name) |>
      dplyr::left_join(sf, by = id) |>
      dplyr::mutate({{id}} := as.character(get(id))) |>
      sf::st_as_sf()
    blk <- sf::st_transform(blk, crs = 26986)
    return(blk)
  }
}