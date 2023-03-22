#' Function returns TRUE/FALSE if the point is on the convex hull.
#'
#' @param points Points to be checked.
#' @param hull Convex hull of a set of points as returned by jarvis_march() function.
#'
#' @return Boolean for each point.
#' @export
#'
#' @examples
in_hull <- function(points,hull) {
  hull_bool <- c()
  for (i in 1:length(points)) {
    # point is in hull when x(1) and y(2) coordinates match of one of points in the convex hull
    hull_bool[i] <- (points[1,i] %in% (hull[,1] %>% as_vector())) & (points[2,i] %in% (hull[,2] %>% as_vector()))
  }
  return(hull_bool)
}
