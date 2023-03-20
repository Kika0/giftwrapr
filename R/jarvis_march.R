# jarvis march
jarvis_march <- function(df) {
  hull <- convex_hull(df)
  hull_segments <- data.frame(matrix(ncol = 4, nrow = 0))
  x <- c("x_0", "y_0", "x_1","y_1")
  colnames(hull_segments) <- x
  for (i in 1:(length(hull)-1)) {
    hull_segments[i,] <- c(hull[[i]][1],hull[[i]][2],hull[[i+1]][1],hull[[i+1]][2])
  }
  return(hull_segments)
}