#' Census FIPS Codes for the County Subdivision level
#'
#' These data keys represent annually/decadally changing Census FIPS codes.
#' 
#' @format A tibble with 351 rows and 16 variables:
#' \describe{
#'   \item{muni_id}{dbl Municipal ID Number 1 Abington through 351 Yarmouth}
#'   \item{muni_name}{chr Official Municipality name} 
#'   \item{cosub_5yXX}{dbl the County Subdivision FIPS Code for the 5-year ACS starting from 2005-09 through 2015-19. These will update as and when a new 5-year ACS is released. The 'XX' represents a 2-digit year code. for Example, '19' represents 2019}
#'   \item{cosub_cnXX}{dbl the County Subdivision FIPS Code for the 10-year Census starting from 2000 through 2020. These will update as and when a new Census is released. The 'XX' represents a 2-digit year code. for Example, '20' represents 2020}
#' }
"census_muni_keys"
