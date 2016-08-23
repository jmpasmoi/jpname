#' Amazing Random Selection About Japanese Given Names
#'
#'@param gender male, female or both
#'
#'@details
#'
#' Function to display a randomly japanese names
#'
#'@export
#'
#' @examples
#'
#' jpgname("female")
#' jpgname("male")
#' jpgname("both")
#'
jpgname <- function (gender){

  jp <- NULL

  if(tolower(gender) == "male" || tolower(gender) == "m" ||
        tolower(gender) == "boy" || tolower(gender) == "man"){ jp <- jp_male() }

  else if(tolower(gender) == "female" || tolower(gender) == "f" ||
     tolower(gender) == "girl" || tolower(gender) == "woman"){ jp <- jp_female() }

  else if(tolower(gender) == "both" || tolower(gender) == "b" ||
     tolower(gender) == "double" || tolower(gender) == "couple"){ jp <- jp_both() }
  else{stop("The entry does not correspond to the gender. Please use male, female or both")}

  x <- jp

  y <- paste("http://www.namespedia.com/details/",x,sep="")

  st <- httr::GET(y)

  if(st$status_code == 200) {

    y <- xml2::read_html(y)

    y <- rvest::html_nodes(y,"div div")

    y <- rvest::html_text(y)

    z <- y[3]

    b <- unlist(gregexpr("<",z))

    sch <- substr(z,2, b[1]-1)

  }else{

    sch <- "No details on namespedia"

  }

  resp <- list(Name = x, Search = sch)

  return (resp)

}
