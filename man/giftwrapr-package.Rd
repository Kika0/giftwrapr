\name{giftwrapr-package}
\alias{giftwrapr-package}
\docType{package}
\title{
  Jarvis march algorithm (C++)
}
\description{
  Package computes convex hull of a set of points
  
  given by dataframe or a list of vectors.
}
\details{
The package contains 3 functions. \verb+jarvis_march() computes convex hull of a set of points in the plane and returns dataframe of coordinates of the line segments forming the convex hull.  in_hull()` takes two arguments: a set of points and `jarvis_march()` output for a set of points (see examples) and returns True/False for each point whether it is inside the polygon. `plot_hull()` takes a set of points and outputs ggplot of their convex hull. See \man folder of the GitHub repository for more documentation.
}
\author{
Kristina Bratkova, kbratkov0@gmail.com.

Maintainer: Kristina Bratkova <kbratkov0@gmail.com>
}

\keyword{ package }

\examples{
jarvis_march(df=tree)
plot_hull(points=tree)
in_hull(points=tree,hull=jarvis_march(tree))
}
