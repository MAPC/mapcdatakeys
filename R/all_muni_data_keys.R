#' The entire set of aggregated Municipal level data keys for easy use 
#'
#' These data keys represent annually/decadally changing Census FIPS codes, regional aggregation levels, RPA affiliations,
#' MAPC subregions, Boston Globe Regions, MBTA and or RTA affiliation and information, and the different MAPC coalitions.
#'
#' @format A tibble with 351 rows and 47 variables:
#' \describe{
#'   \item{muni_id}{dbl Municipal ID Number 1 Abington through 351 Yarmouth}
#'   \item{muni_name}{chr Official Municipality name} 
#'   \item{cosub_5yXX}{dbl the County Subdivision FIPS Code for the 5-year ACS starting from 2005-09 through 2016-20. These will update as and when a new 5-year ACS is released. The 'XX' represents a 2-digit year code. for Example, '19' represents 2019}
#'   \item{cosub_cnXX}{dbl the County Subdivision FIPS Code for the 10-year Census starting from 2000 through 2020. These will update as and when a new Census is released. The 'XX' represents a 2-digit year code. for Example, '20' represents 2020}
#'   \item{muni_upper}{chr The name of the Municipality in UPPER CASE}
#'   \item{mapc}{dbl Binary indicating MAPC affiliation}
#'   \item{reg164}{dbl Binary indicating whether part of the 164 Metro Boston Region}
#'   \item{county_id}{dbl County ID number. This is NOT the FIPS code}
#'   \item{county}{chr County Name}
#'   \item{cmtyp08_id}{dbl 2008 Community Type ID Number}
#'   \item{cmtyp08}{chr 2008 Community Type Name}
#'   \item{cmsbt08_id}{dbl 2008 Community Sub-Type ID Number}
#'   \item{cmsbt08}{chr 2008 Community Sub-Type Name}
#'   \item{rpa_id}{dbl Regional Planning Authority ID}
#'   \item{rpa_name}{chr Regional Planning Authority Name}
#'   \item{rpa_acr}{chr Regional Planning Authority Acronym}
#'   \item{rpa_alt}{chr Secondary Regional Planning Authority}
#'   \item{region_id}{dbl Geographic Region in Massachusetts ID}
#'   \item{region}{chr Geographic Region in Massachusetts Name}
#'   \item{subrg_id}{dbl MAPC Subregion ID}
#'   \item{subrg_nm}{chr MAPC Subregion Name}
#'   \item{subrg_acr}{chr MAPC Subregion Acronym}
#'   \item{subrg_alt}{chr Secondary MAPC Subregion}
#'   \item{bg_region}{chr Boston Globe Region}
#'   \item{rta_acr}{chr RTA - Regional Transit Authority Acronym}
#'   \item{rta_name}{chr RTA - Regional Transit Authority Name}
#'   \item{mbta}{dbl Binary column, indicating MBTA Affiliation}
#'   \item{mbta14}{dbl one of the “14 cities and towns”  that initially hosted MBTA service}
#'   \item{mbta51}{dbl one of the “51 cities and towns” that also host MBTA service but joined later}
#'   \item{mbta_other}{dbl other “served communities” that abut a city or town that hosts MBTA service}
#'   \item{mbta_cmtyp}{dbl MBTA Communities by Category of Service}
#'   \item{mmc}{dbl Whether part of the Metro Mayors' Coalition}
#'   \item{nsc}{dbl Whether part of the North Shore Coalition}
#'   \item{csa}{chr Combined Statistical Area}
#'   \item{msa}{chr Metropolitan or Micropolitan Statistical Area}
#' }
"all_muni_data_keys"
