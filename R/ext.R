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
#'Below the way you should execute this function
#'
#' jpgname("female")
#' jpgname("male")
#' jpgname("both")
#'
jpgname <- function (gender, ..., random = TRUE, ignore.repeat = TRUE, length.min = 4){

  jp <- NULL

  if(
        tolower(gender) == "male" ||
        tolower(gender) == "m" ||
        tolower(gender) == "boy" ||
        tolower(gender) == "man"
   ){

          jp <- jp_male()


    }else if(

      tolower(gender) == "female" ||
      tolower(gender) == "f" ||
      tolower(gender) == "girl" ||
      tolower(gender) == "woman"
    ){

         jp <- jp_female()

    }else if(

      tolower(gender) == "both" ||
      tolower(gender) == "b" ||
      tolower(gender) == "double" ||
      tolower(gender) == "couple"
    ){

      jp <- jp_both()


    }else{

      stop("The entry does not correspond to the gender. Please use male, female or both")

    }

  x <- jp

  y <- paste(websRc()[1],x,sep="")

  st <- httr::GET(y)

  if(st$status_code == 200){

    y <- xml2::read_html(y)

    y <- rvest::html_nodes(y,"div div")

    y <- rvest::html_text(y)

    z <- y[3]

    b <- unlist(gregexpr("<",z))

    sch <- substr(z,2, b[1]-1)

  }else{

    sch <- "No details on namespedia"

  }


  y <- paste(websRc()[2],x,sep="")

  st <- httr::GET(y)

  if(st$status_code == 200){

    y <- xml2::read_html(y)
    y <- rvest::html_nodes(y,"table tr td")
    y <- rvest::html_text(y)

    ktk <- y[5]
    hrg <- y[7]

  }else{

    hrg <- "No hiragana found"
    ktk <- "No katakana found"
  }


  resp <- list(Name = trimws(x), Search = sch, Katakana = gsub("\n","",ktk), Hiragana = gsub("\n","",hrg))

  return (resp)

}
