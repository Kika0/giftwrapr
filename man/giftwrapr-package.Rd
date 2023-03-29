\name{giftwrapr-package}
\alias{giftwrapr-package}
\docType{package}
\title{
  Jarvis march algorithm (C++)
}
\description{
  Package computes convex hull of a set of points.
}
\details{
The package contains three functions. jarvis_march computes convex hull of a set of points and returns dataframe of coordinates of the line segments forming the convex hull.  in_hull takes two arguments: a set of points and jarvis_march output of a set of points and returns True/False of whether point is one of the points forming the convex hull. plot_hull takes a set of points and outputs ggplot of their convex hull. See `\man` folder of the GitHub repository with examples and more documentation.
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
