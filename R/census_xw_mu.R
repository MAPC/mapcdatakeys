#' Weighted crosswalk for 2010 & 2020 Census values for Massachusetts Municipalities
#'
#' This crosswalk provides 2020 & 2010  Massachusetts Municipalities level data on Housing Units and Population
#' for easy cross-comparison.
#' 
#' @format A tibble with 107,278 rows and 9 variables:
#' \describe{
#'   \item{muni_id}{dbl Municipal ID Number 1 Abington through 351 Yarmouth}
#'   \item{cosub_cn20}{dbl 2020 County Subdivision FIPS Code}
#'   \item{cosub_cn10}{dbl 2010 County Subdivision FIPS Code}
#'   \item{muni_name}{chr Official Municipality name} 
#'   \item{hu_2020}{dbl 2020 Housing Unit counts in 2010 block geography} 
#'   \item{pop_2020}{dbl 2020 Population counts in 2010 block geography}
#'   \item{hu_2010}{dbl 2010 Housing Unit counts in 2010 block geography} 
#'   \item{pop_2010}{dbl 2010 Population counts in 2010 block geography}
#'   \item{huch1020}{dbl Change in housing unit counts from 2010 to 2020}
#'   \item{huch1020p}{dbl Percent change in housing unit counts from 2010 to 2020}
#'   \item{popch1020}{dbl Change in population from 2010 to 2020}
#'   \item{popch1020p}{dbl Percent change in population from 2010 to 2020}
#' }
"census_xw_mu"
