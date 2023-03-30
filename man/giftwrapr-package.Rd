\name{giftwrapr-package}
\alias{giftwrapr-package}
\docType{package}
\title{
  Jarvis march algorithm (C++)
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Package computes convex hull of a set of points.

The package contains three functions.  \code{jarvis_march} computes convex hull of a set of points and returns dataframe of coordinates of the line segments forming the convex hull.  \code{in_hull} takes two arguments a set of points and \code{jarvis_march} output for a set of points and returns True/False of whether point is one of the points forming the convex hull.  \code{plot_hull} takes a set of points and outputs ggplot of their convex hull. See \man folder of the GitHub repository with examples and more documentation.
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
