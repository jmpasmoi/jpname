# jpname

Japanese Given Names (Masculine, Feminine & unisex)

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
#$Hiragana
#[1] "たけよし"

#$Romaji
#[1] "Takeyoshi"

#$length
#[1] 9

#$Description
#[1] "Statistics and meaning of name TakeyoshiUsage: 82% firstname, 18% surname.Takeyoshi first name was found 67 times in 3 different countries.Surname Takeyoshi is used at least 14 times in at least 4 countries.Name written with Chinese letters: 竹义 (pinyin: zhú yì)"
```

You can also specify the length of name in the search

``` r
#> jpgname("both",name.length = 6)
#$Hiragana
#[1] "まさき"

#$Romaji
#[1] "Masaki"

#$length
#[1] 6

#$Description
#[1] "Statistics and meaning of name MasakiUsage: 65% firstname, 35% surname.Masaki first name was found 1198 times in 29 different countries.Surname Masaki is used at least 625 times in at least 18 countries.Gender of firstname Masaki is 1% feminine and 99% masculine.Name written with Chinese letters: 正己 (pinyin: zhēng jǐ)"

#> jpgname("female",name.length = 5)
#$Hiragana
#[1] "りょた"

#$Romaji
#[1] "Ryota"

#$length
#[1] 5

#$Description
#[1] "Statistics and meaning of name RyotaUsage: 89% firstname, 11% surname.Ryota first name was found 369 times in 17 different countries.Surname Ryota is used at least 44 times in at least 4 countries.Origin of this name is Japanese.Gender of firstname Ryota is 9% feminine and 91% masculine."
```

### Author

Jean Marie Cimula

## Licence

GPL (>= 2)
