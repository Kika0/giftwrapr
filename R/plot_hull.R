#' Plot hull of points and their convex hull polygon
#'
#' @param points A set of points given by a list of two vectors or a dataframe.
#'
#' @return Ggplot of the points and their convex hull.
#' @export
#'
#' @examples
plot_hull <- function(points) {
  
  # define some nice colours (Basquiat)
  red='#C11432'
    blue='#009ADA'
      green='#66A646'
        yellow='#FDD10A'
# run jarvis_march
hull <- jarvis_march(points)
# marshall points data
df <- points %>% marshall() %>% t() %>% as.data.frame()
colnames(df) <- c("X","Y")
      p <- ggplot() + 
            geom_polygon(hull, mapping = aes(x=x_0,y=y_0),alpha=0.7,color=red,fill=yellow,linewidth=1.5) +
            geom_point(data=df, mapping = aes(x=X,y=Y),color=green,size=2) +
         geom_point(hull,mapping = aes(x=x_0,y=y_0),color=blue,size=2) +
        geom_segment(hull,mapping = aes(x=x_0,y=y_0,xend=x_1,yend=y_1),color=red) +
        xlab("X") +
        ylab("Y") +
         theme_minimal()
 return(p)         
}

          