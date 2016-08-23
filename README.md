# jpname

Japanese Given Names (Masculine, Feminine & unisex) **(jpname)** 

Display a randomly selected a given name and search the meaning on namespedia


## Installation

You can install jpname from github with:

```R
# install.packages("devtools")
devtools::install_github("jmcimula/jpname")
```

## Key functions

* `jpgname()`: Function to display a randomly japanese names

## Example 

``` r
library(jpname) # for functions

#Using the function to select randomly a given name 

#> jpgname("male")
#$Name
#[1] "Yoshisuke"

#$Search
#[1] "Statistics and meaning of name YoshisukeUsage: 83% firstname, 17% surname.Yoshisuke first name was found 25 times in 6 different countries.Surname Yoshisuke is used at least 5 times in at least 2 countries. (USA,Kenya)Gender of firstname Yoshisuke is 0% feminine and 100% masculine."

```
