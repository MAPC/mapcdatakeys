## Keys for Census Geographies

Municipal boundaries in Massachusetts have not changed since 1938 when
the construction of the Quabbin Reservoir resulted in the
disincorporation of several towns.

Census geographies such as tracts, block groups, and blocks however may
change for every census to accommodate the changing landscape of
population and housing unit changes. As such for longitudinal comparison
a weighted crosswalk between census geographies at the same hierarchy
level is useful.

Additionally, a nested crosswalk between census geographies, and
municipalities is also useful for getting geographic distributions.

These set of data keys and crosswalks provide for the above two kinds of
data, and are described in detail below.

## Available Data Keys:

### Weighted Crosswalks

#### Census Blocks

``` mapcdatakeys::census_xw_bl10```
This crosswalk provides 2020 & 2010 block level data on Housing Units and Population in **2010 census block geographies** for easy cross-comparison.


```r
head(mapcdatakeys::census_xw_bl10)
```

    ## # A tibble: 6 x 10
    ##   bl10_id hu_2020 ohu_2020 pop_2020 hu_2010 pop_2010 huch1020p popch1020p
    ##     <dbl>   <dbl>    <dbl>    <dbl>   <dbl>    <dbl>     <dbl>      <dbl>
    ## 1 2.50e14     684      607     1207     226      455    203.        165. 
    ## 2 2.50e14      37       36      224      59      177    -37.8        26.3
    ## 3 2.50e14     172       21       45     182       52     -5.49      -13.5
    ## 4 2.50e14     847      822     2068     187      595    353.        248. 
    ## 5 2.50e14     686      457     1367     712     2247     -3.65      -39.2
    ## 6 2.50e14     508      429      821       0        0      0           0  
    ## # ... with 2 more variables: huch1020 <dbl>, popch1020 <dbl>

``` mapcdatakeys::census_xw_bl20```
This crosswalk provides 2020 & 2010 block level data on Housing Units and Population in **2020 census block geographies** for easy cross-comparison.


```r
head(mapcdatakeys::census_xw_bl20)
```

    ## # A tibble: 6 x 9
    ##   bl20_id hu_2010 pop_2010 hu_2020 pop_2020 huch1020p popch1020p huch1020
    ##     <dbl>   <dbl>    <dbl>   <dbl>    <dbl>     <dbl>      <dbl>    <dbl>
    ## 1 2.50e14       0        0       0        0     NA          NA          0
    ## 2 2.50e14      18        6      20       15     -8.44      -59.5       -2
    ## 3 2.50e14       0        0       0        0     NA          NA          0
    ## 4 2.50e14       0        0       0        0     NA          NA          0
    ## 5 2.50e14       0        0       0        0     NA          NA          0
    ## 6 2.50e14       0        0       0        0     NA          NA          0
    ## # ... with 1 more variable: popch1020 <dbl>

#### Census Block Groups

``` mapcdatakeys::census_xw_bg10```
This crosswalk provides 2020 & 2010 Block Group level data on Housing Units and Population in **2010 census Block Group geographies** for easy cross-comparison.


```r
head(mapcdatakeys::census_xw_bg10)
```

    ## # A tibble: 6 x 10
    ##        bg10_id hu_2020 hu_2010 pop_2020 pop_2010 ohu_2020 huch1020p popch1020p
    ##          <dbl>   <dbl>   <dbl>    <dbl>    <dbl>    <dbl>     <dbl>      <dbl>
    ## 1 250010101001    1271    1136      995      763      607    11.9         30.4
    ## 2 250010101002     957     921      638      494      377     3.91        29.1
    ## 3 250010101003     877     786      643      569      397    11.6         13.0
    ## 4 250010101004     960     791      729      516      439    21.4         41.3
    ## 5 250010101005     918     860      665      600      379     6.74        10.8
    ## 6 250010102061     999     996      926      660      449     0.301       40.3
    ## # ... with 2 more variables: huch1020 <dbl>, popch1020 <dbl>

``` mapcdatakeys::census_xw_bg20```
This crosswalk provides 2020 & 2010 Block Group level data on Housing Units and Population in **2020 census Block Group geographies** for easy cross-comparison.


```r
head(mapcdatakeys::census_xw_bg20)
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

#### Census Tracts

``` mapcdatakeys::census_xw_ct10```
This crosswalk provides 2010 & 2020 Census Tract level data on Housing Units and Population in **2010 census Census Tract** geographies for easy cross-comparison.


```r
head(mapcdatakeys::census_xw_ct10)
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

``` mapcdatakeys::census_xw_ct20```
This crosswalk provides 2020 & 2010 Block Group level data on Housing Units and Population in **2020 census Census Tract** for easy cross-comparison.


```r
head(mapcdatakeys::census_xw_ct20)
```

    ## # A tibble: 6 x 9
    ##       ct20_id hu_2010 hu_2020 pop_2010 pop_2020 huch1020p    popch1020p huch1020
    ##         <dbl>   <dbl>   <dbl>    <dbl>    <dbl> <chr>        <chr>         <dbl>
    ## 1 25001010100    4494    4983     2942     3664 10.88117489~ 24.541128~      489
    ## 2 25001010206    4306    4263     2750     3566 -0.99860659~ 29.672727~      -43
    ## 3 25001010208    3076    3001     2003     2454 -2.43823146~ 22.516225~      -75
    ## 4 25001010304    2705    2749     2421     2672 1.626617375~ 10.367616~       44
    ## 5 25001010306    3254    3356     2535     3080 3.134603564~ 21.499013~      102
    ## 6 25001010400    2359    2459     3000     3345 4.239084357~ 11.5            100
    ## # ... with 1 more variable: popch1020 <dbl>

### Geographic Crosswalks

#### 2010 Block Assigments

``` mapcdatakeys::geog_xw_2010```
This crosswalk provides an easy way to categorize the 2010 blocks into various geographies


```r
head(mapcdatakeys::geog_xw_2010)
```

    ## # A tibble: 6 x 10
    ##   bl10_id   bg10_id ct10_id cosub_cn10 muni_id muni_name county statefp countyfp
    ##     <dbl>     <dbl>   <dbl>      <dbl>   <dbl> <chr>     <chr>    <dbl> <chr>   
    ## 1 2.50e15   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 2 2.50e15   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 3 2.50e15   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 4 2.50e15   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 5 2.50e15   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## 6 2.50e15   2.50e11 2.50e10 2500155500     242 Province~ Barns~      25 001     
    ## # ... with 1 more variable: cousubfp <chr>

#### 2020 Block Assigments

``` mapcdatakeys::geog_xw_2020```
This crosswalk provides an easy way to categorize the 2020 blocks into various geographies


```r
head(mapcdatakeys::geog_xw_2020)
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
