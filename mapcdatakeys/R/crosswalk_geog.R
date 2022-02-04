#' Function to call desired nested geographies for blocks for both 2010 and 2020 
#'
#' @param year Desired Census Year
#'
#' @return Call nested geographies for Census Blocks
#' @export
#'
#' @examples
#' 
#' crosswalk_geog(year = 2010)
crosswalk_geog <- function(year){
  ifelse(year == 2010, return(mapcdatakeys::geog_xw_2010),
         ifelse(year == 2020, return(mapcdatakeys::geog_xw_2020),
                stop("Please enter valid Census Year: 2010, or 2020")))
}
