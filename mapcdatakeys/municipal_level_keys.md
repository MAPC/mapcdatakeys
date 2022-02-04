## Municipal Level Keys

These data keys represent annually/decadally changing Census FIPS codes,
regional aggregation levels, RPA affiliations, MAPC subregions, Boston
Globe Regions, MBTA and or RTA affiliation and information, and the
different MAPC coalitions.

## Available Data Keys:

These data keys are available either as an entire set, or conveniently
broken up into relevant groups.

### The Entire Set

``` mapcdatakeys::all_muni_data_keys```
These data keys represent annually/decadally changing Census FIPS codes, regional aggregation levels, RPA affiliations, MAPC subregions, Boston Globe Regions, MBTA and or RTA affiliation and information, and the different MAPC coalitions.


```r
head(mapcdatakeys::all_muni_data_keys)
```

    ## # A tibble: 6 x 47
    ##   muni_id muni_name cosub_5y19 cosub_5y18 cosub_5y17 cosub_5y16 cosub_5y15
    ##     <dbl> <chr>          <dbl>      <dbl>      <dbl>      <dbl>      <dbl>
    ## 1       1 Abington  2502300170 2502300170 2502300170 2502300170 2502300170
    ## 2       2 Acton     2501700380 2501700380 2501700380 2501700380 2501700380
    ## 3       3 Acushnet  2500500520 2500500520 2500500520 2500500520 2500500520
    ## 4       4 Adams     2500300555 2500300555 2500300555 2500300555 2500300555
    ## 5       5 Agawam    2501300840 2501300840 2501300840 2501300840 2501300840
    ## 6       6 Alford    2500300975 2500300975 2500300975 2500300975 2500300975
    ## # ... with 40 more variables: cosub_5y14 <dbl>, cosub_5y13 <dbl>,
    ## #   cosub_5y12 <dbl>, cosub_5y11 <dbl>, cosub_5y10 <dbl>, cosub_5y09 <dbl>,
    ## #   cosub_cn00 <dbl>, cosub_cn10 <dbl>, cosub_cn20 <dbl>, muni_upper <chr>,
    ## #   mapc <dbl>, reg164 <dbl>, county_id <dbl>, county <chr>, cmtyp08_id <dbl>,
    ## #   cmtyp08 <chr>, cmsbt08_id <dbl>, cmsbt08 <chr>, rpa_id <dbl>,
    ## #   rpa_name <chr>, rpa_acr <chr>, rpa_alt <chr>, region_id <dbl>,
    ## #   region <chr>, subrg_id <dbl>, subrg_nm <chr>, subrg_acr <chr>, ...

### Census FIPS Codes

``` mapcdatakeys::census_muni_keys```
These data keys represent annually/decadally changing Census FIPS codes.


```r
head(mapcdatakeys::census_muni_keys)
```

    ## # A tibble: 6 x 16
    ##   muni_id muni_name cosub_5y19 cosub_5y18 cosub_5y17 cosub_5y16 cosub_5y15
    ##     <dbl> <chr>          <dbl>      <dbl>      <dbl>      <dbl>      <dbl>
    ## 1       1 Abington  2502300170 2502300170 2502300170 2502300170 2502300170
    ## 2       2 Acton     2501700380 2501700380 2501700380 2501700380 2501700380
    ## 3       3 Acushnet  2500500520 2500500520 2500500520 2500500520 2500500520
    ## 4       4 Adams     2500300555 2500300555 2500300555 2500300555 2500300555
    ## 5       5 Agawam    2501300840 2501300840 2501300840 2501300840 2501300840
    ## 6       6 Alford    2500300975 2500300975 2500300975 2500300975 2500300975
    ## # ... with 9 more variables: cosub_5y14 <dbl>, cosub_5y13 <dbl>,
    ## #   cosub_5y12 <dbl>, cosub_5y11 <dbl>, cosub_5y10 <dbl>, cosub_5y09 <dbl>,
    ## #   cosub_cn00 <dbl>, cosub_cn10 <dbl>, cosub_cn20 <dbl>

### MAPC Sub Regions and Coalition Affiliations

``` mapcdatakeys::mapc_data_keys```
These data keys represent the MAPC affiliation for the 351 municipalities in Massachusetts. Other indicators such as MAPC Sub Regions, and coalitions such as the Metro Mayors' Coalition, and the North Shore Coalition are also indicated. A few are members of more than one Sub Region, and thus the 'subrg_alt' column indicates the secondary Sub Region in such cases.


```r
head(mapcdatakeys::mapc_data_keys)
```

    ## # A tibble: 6 x 9
    ##   muni_id muni_name  mapc   mmc   nsc subrg_id subrg_nm      subrg_acr subrg_alt
    ##     <dbl> <chr>     <dbl> <dbl> <dbl>    <dbl> <chr>         <chr>     <chr>    
    ## 1       1 Abington      0     0     0       NA <NA>          <NA>      <NA>     
    ## 2       2 Acton         1     0     0      356 Minuteman Ad~ MAGIC     <NA>     
    ## 3       3 Acushnet      0     0     0       NA <NA>          <NA>      <NA>     
    ## 4       4 Adams         0     0     0       NA <NA>          <NA>      <NA>     
    ## 5       5 Agawam        0     0     0       NA <NA>          <NA>      <NA>     
    ## 6       6 Alford        0     0     0       NA <NA>          <NA>      <NA>

### MAPC Community Types

``` mapcdatakeys::community_type```
In order to support planning, analysis, and policy development, the Metropolitan Area Planning Council has created a classification system of municipalities in Massachusetts. MAPC has identified five basic community types across the state, four of which can be subdivided further to yield nine sub-types. The criteria used to define Community Types include land use and housing patterns, recent growth trends, and projected development patterns. The Community Type system can be used to understand how demographic, economic, land use, energy, and transportation trends affect the Commonwealth's diverse communities.


```r
head(mapcdatakeys::community_type)
```

    ## # A tibble: 6 x 6
    ##   muni_id muni_name cmtyp08_id cmtyp08           cmsbt08_id cmsbt08             
    ##     <dbl> <chr>          <dbl> <chr>                  <dbl> <chr>               
    ## 1       1 Abington         377 Developing Suburb        387 Maturing New Englan~
    ## 2       2 Acton            379 Maturing Suburb          386 Established Suburb/~
    ## 3       3 Acushnet         377 Developing Suburb        387 Maturing New Englan~
    ## 4       4 Adams            377 Developing Suburb        387 Maturing New Englan~
    ## 5       5 Agawam           377 Developing Suburb        387 Maturing New Englan~
    ## 6       6 Alford           381 Rural Town               381 Rural Town

### RPA Affiliations

``` mapcdatakeys::rpa_data_keys```
These data keys represent the different RPA affiliations for the 351 municipalities in Massachusetts. A few are members of more than one RPA, and thus the 'rpa_alt' column indicates the secondary RPA in such cases.


```r
head(mapcdatakeys::rpa_data_keys)
```

    ## # A tibble: 6 x 6
    ##   muni_id muni_name rpa_id rpa_acr rpa_name                              rpa_alt
    ##     <dbl> <chr>      <dbl> <chr>   <chr>                                 <chr>  
    ## 1       1 Abington     399 OCPC    Old Colony Planning Council           <NA>   
    ## 2       2 Acton        352 MAPC    Metropolitan Area Planning Council    <NA>   
    ## 3       3 Acushnet     401 SRPEDD  Southeastern Regional Planning & Eco~ <NA>   
    ## 4       4 Adams        390 BRPC    Berkshire County Regional Planning C~ <NA>   
    ## 5       5 Agawam       400 PVPC    Pioneer Valley Planning Commission    <NA>   
    ## 6       6 Alford       390 BRPC    Berkshire County Regional Planning C~ <NA>

### MBTA and RTA Affiliations

``` mapcdatakeys::mbta_data_keys```
Most municipalities in Massachusetts are under a Regional Transit Authority, and/or the MBTA. Some are even under both the MBTA and a local RTA. As such, a 0/1 column is created for MBTA affiliation


```r
head(mapcdatakeys::mbta_data_keys)
```

    ## # A tibble: 6 x 9
    ##   muni_id muni_name rta_acr rta_name    mbta mbta14 mbta51 mbta_other mbta_cmtyp
    ##     <dbl> <chr>     <chr>   <chr>      <dbl>  <dbl>  <dbl>      <dbl> <chr>     
    ## 1       1 Abington  BAT     Brockton ~     1      0      0          1 Commuter ~
    ## 2       2 Acton     LRTA    Lowell Re~     1      0      0          1 Commuter ~
    ## 3       3 Acushnet  SRTA    Southeast~     0      0      0          0 <NA>      
    ## 4       4 Adams     BRTA    Berkshire~     0      0      0          0 <NA>      
    ## 5       5 Agawam    PVTA    Pioneer V~     0      0      0          0 <NA>      
    ## 6       6 Alford    BRTA    Berkshire~     0      0      0          0 <NA>

### Census Data Vintage Crosswalk

``` mapcdatakeys::census_xw_mu```
This crosswalk provides 2020 & 2010 Massachusetts Municipalities level data on Housing Units and Population for easy cross-comparison.


```r
head(mapcdatakeys::census_xw_mu)
```

    ## # A tibble: 6 x 12
    ##   muni_id cosub_cn20 cosub_cn10 muni_name pop_2010 pop_2020 popch1020 popch1020p
    ##     <dbl>      <dbl>      <dbl> <chr>        <dbl>    <dbl>     <dbl>      <dbl>
    ## 1      20 2500103690 2500103690 Barnstab~    45193    48916      3723       8.24
    ## 2      36 2500107175 2500107175 Bourne       19754    20452       698       3.53
    ## 3      41 2500107980 2500107980 Brewster      9820    10318       498       5.07
    ## 4      55 2500112995 2500112995 Chatham       6125     6594       469       7.66
    ## 5      75 2500116775 2500116775 Dennis       14207    14674       467       3.29
    ## 6      86 2500119295 2500119295 Eastham       4956     5752       796      16.1 
    ## # ... with 4 more variables: hu_2010 <dbl>, hu_2020 <dbl>, huch1020 <dbl>,
    ## #   huch1020p <dbl>
