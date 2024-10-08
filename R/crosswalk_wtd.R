#' Function to call desired weighted crosswalk for 2020 values in 2010 census geographies 
#'
#' @param geography Desired census geography. Can be either 'block', 'block group', 'tract' or 'county subdivision'
#' @param vintage Desired Census Year (either 2010, or 2020)
#'
#' @return Geographically weighted values for housing units and population by desired vintage and unit of geography
#' @export
#'
#' @examples
#' 
#' crosswalk_wtd(geography = 'block', vintage = 2010)
crosswalk_wtd <- function(geography, vintage = NULL){
  ifelse(geography == "block" & vintage == 2020, return(mapcdatakeys::census_xw_bl20),
         ifelse(geography == 'block group' & vintage == 2020, return(mapcdatakeys::census_xw_bg20),
                ifelse(geography == 'tract' & vintage == 2020, return(mapcdatakeys::census_xw_ct20),
                       ifelse(geography == 'county subdivision', return(mapcdatakeys::census_xw_mu),
                              ifelse(geography == "block" & vintage == 2010, return(mapcdatakeys::census_xw_bl10),
                                     ifelse(geography == "block group" & vintage == 2010, return(mapcdatakeys::census_xw_bg10),
                                            ifelse(geography == "tract" & vintage == 2010, return(mapcdatakeys::census_xw_ct10),
                              stop("Please enter valid geography name, one of: 'block', 'block group', 'tract' or 'county subdivision'"))))))))
}
