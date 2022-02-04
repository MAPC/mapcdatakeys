
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{mapcdatakeys}`

<!-- badges: start -->
<!-- badges: end -->

This package contains two kinds of components:

### Data Keys

These data keys are created at the municipal, census block, block group
and tract level. As Census geographies can change between two decadal
counts, they have two kinds of crosswalks - geographical, and weighted.
For these, we provide two functions described below.

*Please raise an issue if you would like any additions, or alterations
to this package which we can incorporate.*

Detailed descriptions of each geographic level of data keys can be found
on their individual pages below:

-   [Municipal Level Keys](municipal_level_keys.md)

-   [Keys for Census Geographies](census_geog_keys.md)

### Functions to call crosswalks

These two functions are used to call specific crosswalks based on either
their vintage, and/or the relevant geographic unit.

-   [Crosswalk Functions](crosswalk_functions.md)

This package obtains standardized data keys for four different
geographic levels in Massachusetts.

## Installation

You can install the released version of `{mapcdatakeys}` with:

``` r
# install.packages("devtools")
devtools::install_github("MAPC/mapcdatakeys")
```

## Examples for

Load the package with this line:

``` r
library(mapcdatakeys)

head(mapcdatakeys::mbta_data_keys)
#> # A tibble: 6 x 9
#>   muni_id muni_name rta_acr rta_name    mbta mbta14 mbta51 mbta_other mbta_cmtyp
#>     <dbl> <chr>     <chr>   <chr>      <dbl>  <dbl>  <dbl>      <dbl> <chr>     
#> 1       1 Abington  BAT     Brockton ~     1      0      0          1 Commuter ~
#> 2       2 Acton     LRTA    Lowell Re~     1      0      0          1 Commuter ~
#> 3       3 Acushnet  SRTA    Southeast~     0      0      0          0 <NA>      
#> 4       4 Adams     BRTA    Berkshire~     0      0      0          0 <NA>      
#> 5       5 Agawam    PVTA    Pioneer V~     0      0      0          0 <NA>      
#> 6       6 Alford    BRTA    Berkshire~     0      0      0          0 <NA>
```

Incredible help from Desiree De Leon and Alison Hill from their
[rstudio4edu handbook, chapter
12](https://rstudio4edu.github.io/rstudio4edu-book/data-pkg.html)
