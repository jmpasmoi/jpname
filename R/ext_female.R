.ml.env <- new.env()

.read.ml <- function() {

  filename <- system.file("jpname", "female.txt", package="jpname")

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
#'@export
jp_female <- function (ind){

  if (is.null(.ml.env$ml.data)) .ml.env$ml.data <- .read.ml()

  ml <- .ml.env$ml.data

  if (missing(ind)) {

    n <- length(ml)

    ind <- sample(1:n, 1)
  }

  v <- ml[ind]

  return(v)

}
##' @rdname jp_female
##' @param x Default object for \code{print} method
##' @param width Optional column width parameter
##' @param ... Other optional arguments
print.jp_female <- function(x, width = NULL, ...) {
  if (is.null(width)) width <- 0.9 * getOption("width")
  if (width < 10) stop("'width' must be greater than 10", call.=FALSE)
  invisible(sapply(strwrap(x, width), cat, "\n"))
}
