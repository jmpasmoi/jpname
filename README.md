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
#[1] "Shozo"

#$Search
#[1] "Statistics and meaning of name ShozoUsage: 91% firstname, 9% surname.Shozo first name was found 289 times in 16 different countries.Surname Shozo is used at least 27 times in at least 5 countries.Gender of firstname Shozo is 0% feminine and 100% masculine."

#$Katakana
#[1] "ショゾ"

#$Hiragana
#[1] "しょぞ"
```

## Licence

GPL (>= 2)

