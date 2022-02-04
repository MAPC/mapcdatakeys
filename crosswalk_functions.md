## Crosswalk Functions

These two functions are used to call the two respective kinds of
crosswalks available in this package - weighted, and nested crosswalks.

### Weighted Crosswalks

`mapcdatakeys::crosswalk_wtd(geography, vintage)`

This is a function to call desired weighted crosswalk for population and
housing unit values in desired census geographies and vintage.

It requires two arguments:

-   **geography:** It can either be ‘block’, ‘block group’, ‘tract’, or
    ‘county subdivision’

-   **vintage:** Currently available for either 2010 or 2020 census
    geographies. For municipalities, either vintage will provide the
    same data.

##### Example: 2020 and 2010 values for housing units and population for 2010 Census Tract geographies (ct10_id)

``` r
head(mapcdatakeys::crosswalk_wtd(geography = 'tract', vintage = 2010))
```

    ## # A tibble: 6 x 10
    ##       ct10_id hu_2020 hu_2010 pop_2020 pop_2010 ohu_2020 huch1020p popch1020p
    ##         <dbl>   <dbl>   <dbl>    <dbl>    <dbl>    <dbl>     <dbl>      <dbl>
    ## 1 25001010100    4983    4494     3670     2942     2199     10.9        24.7
    ## 2 25001010206    4256    4305     3569     2750     1797     -1.14       29.8
    ## 3 25001010208    2998    3077     2451     2003     1249     -2.57       22.4
    ## 4 25001010304    2750    2706     2672     2421     1311      1.63       10.4
    ## 5 25001010306    3359    3254     3078     2535     1491      3.23       21.4
    ## 6 25001010400    2457    2359     3346     2999     1633      4.15       11.6
    ## # ... with 2 more variables: huch1020 <dbl>, popch1020 <dbl>

##### Example: 2020 and 2010 values for housing units and population for 2020 Census Block Group geographies (bg20_id)

``` r
head(mapcdatakeys::crosswalk_wtd(geography = 'block group', vintage = 2020))
```

    ## # A tibble: 6 x 9
    ##        bg20_id hu_2010 hu_2020 pop_2010 pop_2020 huch1020p   popch1020p huch1020
    ##          <dbl>   <dbl>   <dbl>    <dbl>    <dbl> <chr>       <chr>         <dbl>
    ## 1 250010101001    1136    1271      763      992 11.8838028~ 30.013106~      135
    ## 2 250010101002     921     957      494      637 3.90879478~ 28.947368~       36
    ## 3 250010101003     786     877      569      642 11.5776081~ 12.829525~       91
    ## 4 250010101004     791     960      516      729 21.3653603~ 41.279069~      169
    ## 5 250010101005     860     918      600      664 6.74418604~ 10.666666~       58
    ## 6 250010102061     996    1002      660      926 0.60240963~ 40.303030~        6
    ## # ... with 1 more variable: popch1020 <dbl>

### Geographic Crosswalks

`mapcdatakeys::crosswalk_wtd(geography, vintage)`

This is a function to call desired nested crosswalk for census
geographies and vintage.

It requires one argument:

-   **year:** Currently available for either 2010 or 2020 census
    geographies.

##### Example: 2020 block assignment files and nested geographies for block, block group, tract, municipality, county, and state for Massachusetts.

``` r
head(mapcdatakeys::crosswalk_geog(year = 2020))
```

    ## # A tibble: 6 x 10
    ##   bl20_id   bg20_id ct20_id cosub_cn20 muni_id muni_name county statefp countyfp
    ##     <dbl>     <dbl>   <dbl>      <dbl>   <dbl> <chr>     <chr>    <dbl> <chr>   
    ## 1 2.50e14   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 2 2.50e14   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 3 2.50e14   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 4 2.50e14   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 5 2.50e14   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 6 2.50e14   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## # ... with 1 more variable: cousubfp <chr>
