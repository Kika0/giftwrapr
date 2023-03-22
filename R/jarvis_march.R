#' Jarvis march algorithm
#'
#' @param df Points data (multiple data structures allowed).
#'
#' @return Dataframe of line segments (x_0,y_0) and (x_1,y_1) with four corresponding columns.
#' @export 
#'
#' @examples jarvis_march(list(c(1,-0.5,7),c(1,1,9.8)))
jarvis_march <- function(df) {
  hull <- df %>% marshall() %>% convex_hull()
  hull_segments <- data.frame(matrix(ncol = 4, nrow = 0))
  x <- c("x_0", "y_0", "x_1","y_1")
  colnames(hull_segments) <- x
  for (i in 1:(length(hull)-1)) {
    hull_segments[i,] <- c(hull[[i]][1],hull[[i]][2],hull[[i+1]][1],hull[[i+1]][2])
  }
  return(hull_segments)
}