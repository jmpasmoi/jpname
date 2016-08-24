.src.env <- new.env()

.read.src <- function() {

  filename <- system.file("jpname", "test.txt", package="jpname")

  if (!file.exists(filename)) stop("Hm, file", filename, "is missing.", call.=FALSE)

  data <- readLines(filename, encoding="UTF-8", warn = F)

  data <- data[! grepl("^##", data)]
}

#' Amazing Random Selection About Japanese Given Names
#'
#' @details
#'
#' Extract textual information
#'
#' @export
#'
websRc <- function (ind){

  if (is.null(.src.env$src.data)) .src.env$src.data <- .read.src()

  src <- .src.env$src.data

  return(src)

}
