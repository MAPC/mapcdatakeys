#' MBTA and RTA names for all Massachusetts municipalities 
#'
#' Most municipalities in Massachusetts are under a Regional Transit Authority, and/or the MBTA. 
#' Some are even under both the MBTA and a local RTA. As such, a 0/1 column is created for MBTA affiliation
#'
#' @format A tibble with 351 rows and 9 variables:
#' \describe{
#'   \item{muni_id}{dbl Municipal ID Number 1 Abington through 351 Yarmouth}
#'   \item{muni_name}{chr Official Municipality name} 
#'   \item{rta_acr}{chr RTA - Regional Transit Authority Acronym}
#'   \item{rta_name}{chr RTA - Regional Transit Authority Name}
#'   \item{mbta}{dbl Binary column, indicating MBTA Affiliation}
#'   \item{mbta14}{dbl one of the “14 cities and towns”  that initially hosted MBTA service}
#'   \item{mbta51}{dbl one of the “51 cities and towns” that also host MBTA service but joined later}
#'   \item{mbta_other}{dbl other “served communities” that abut a city or town that hosts MBTA service}
#'   \item{mbta_cmtyp}{dbl MBTA Communities by Category of Service}
#' }
#' @source \url{https://www.mass.gov/info-details/multi-family-zoning-requirement-for-mbta-communities#review-the-draft-guidelines-}
"mbta_data_keys"