#' Amazing Random Selection About Japanese Given Names
#'
#' @param gender male, female or both
#' @param random always true
#' @param name.length
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
jpgname <- function (gender, ..., random = TRUE, name.length = 4){


  f <- formals(jpgname)

  namesize <- names(f)

  nz <- do.call(missing, list(namesize[4]))

  if(nz == TRUE){ ex <- "abs"}
  else{

        if(name.length <= 11 && name.length > 1){ ex <- name.length
        }else{
          stop("Unexpected value. Please type positive integer between 2 and 11", call. = TRUE)
        }
  }


  if(is.atomic(gender) && !is.numeric(gender) && !grepl("[[:digit:]]", gender) && !trimws(gender)==""){


    for(i in 1:1e4){

      ch <- jpNameGenerator(gender)

      count <- nchar(ch)

      if(count == ex){ break }else{ next}
    }

  }else{ stop("The entry does not correspond to the gender. Please type either male, female or both")}

  x <- ch

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

    hrg <- y[7]

  }else{

    hrg <- "No hiragana found"
  }

  resp <- list(Hiragana = gsub("\n","",hrg), Romaji = trimws(x), length = nchar(trimws(x)), Description = sch)

  return (resp)
}

jpNameGenerator <- function(gender){

  if(tolower(gender) %in% c("male","m","boy","man")){ jp <- jp_male()}
  else if(tolower(gender) %in% c("female","f","girl","woman")){ jp <- jp_female()}
  else if(tolower(gender) %in% c("both","b","double","couple")){ jp <- jp_both()}
  else{ stop("The entry does not correspond to the gender. Please use male, female or both")}

  return(jp)
}
