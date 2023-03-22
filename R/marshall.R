#' Accept and marshall different data structures as input.
#'
#' @param data Points input.
#'
#' @return Data in suitable data structure or error.
#' @export
#'
#' @examples
marshall <- function(data) {
  if (class(data)=="data.frame") {
    if (nrow(data)==2 | ncol(data)==2) {
      if (ncol(data)==2) {
      data <-   data %>% t() # transpose the data to have two rows
      }
    }
    else {
      stop("The data structure is dataframe. Either number of rows or columns must be equal to 2 (corresponding to x,y coordinates respectively)")
      
    }
  }
  
  else if (class(data)=="list") {
    if (length(data)==2) {
    data <-   data %>% data.frame() %>%  t() %>% data.frame() #transpose the data to have two rows
    }
    else {
      stop("List must have two vectors of the same length as data.")
    }
  }
  else {stop(paste0("Data structure ",typeof(data), " is not supported. Convert the data to list of vectors or a dataframe.") )}
  return(data)
}
