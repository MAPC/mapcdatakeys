#' Weighted crosswalk for 2020 & 2010 Census Block values in 2010 block boundaries
#'
#' This crosswalk provides 2020 & 2010 block level data on Housing Units and Population in 2010 census block geographies
#' for easy cross-comparison.
#' 
#' @format A tibble with 157,506 rows and 10 variables:
#' \describe{
#'   \item{bl10_id}{dbl 2010 Census Block FIPS Code}
#'   \item{hu_2020}{dbl 2020 Housing Unit counts in 2010 block geography} 
#'   \item{pop_2020}{dbl 2020 Population counts in 2010 block geography}
#'   \item{ohu_2020}{dbl 2020 Occupied Housing Unit counts in 2010 block geography}
#'   \item{hu_2010}{dbl 2010 Housing Unit counts in 2010 block geography} 
#'   \item{pop_2010}{dbl 2010 Population counts in 2010 block geography}
#'   \item{huch1020}{dbl Change in housing unit counts from 2010 to 2020}
#'   \item{huch1020p}{dbl Percent change in housing unit counts from 2010 to 2020}
#'   \item{popch1020}{dbl Change in population from 2010 to 2020}
#'   \item{popch1020p}{dbl Percent change in population from 2010 to 2020}
#' }
"census_xw_bl10"
