# giftwrapr

The functions of repository compute Jarvis march algorithm for a convex hull of distinct points. The main idea of the algorithm is following: for a line passing though two points on the convex hull, all the other points lie on one side of the line. For more detail see the pseudo code in [Python_gift_wrap.ipynb](./man/Python_gift_wrap.ipynb). The [data](./data/examples.RData) has examples of datasets of different data structures and [Examples.ipynb](./man/Examples.ipynb) demonstartes how the functions on the package can be used on these examples. 

Other documentation includes:
- [C++_assignment.ipynb](./man/C++_assignment.ipynb) is C++ assignment jupyter notebook documenting implementation of Pyton code in C++ and other tasks not related to Jarvis march algorithm.
- [Five_Rs.pdf](./man/Five_Rs.pdf) discusses five R's of good programming: reproducibility, replicability, re-runability, repeatability and reusability.
---
- install the package by running
```r
library(devtools)
devtools::install_github("Kika0/giftwrapr")
```
- once installed, load the package 
```r
library(giftwrapr)
```

NOTE: In terms of computational complexity and runtime, this algorithm and code is not the most effective. If the aim is speed, Graham's scan algorithm has optimal computational complexity for finding the convex hull of points in the plane and has been implemented in [Python](DC00/Polya) and [C++](allfii/ConvexHull).
