#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

#include<Rcpp.h>
using namespace Rcpp;

// create Point structure for x,y coordinates
struct Point
{
    double x;
    double y;
    Point(double _x, double _y)
    {
        x=_x;
        y=_y;
    }
    bool operator<(Point p)
    {
        if(x < p.x)
            return true;
        if (x == p.x && y > p.y)
            return true;
        return false;
    }
};

// [[Rcpp::export]]
std::vector<std::vector<double> > convex_hull(std::vector<std::vector<double> > v)
{
// convert to a vector of points
std::vector<Point> p;
for (int h=0; h < v.size(); h++)
{
    p.push_back(Point(v[h][0],v[h][1]));
}

// create a copy of the points input
std::vector<Point> P;
std::copy(p.begin(),p.end(),back_inserter(P));
// define vectors of Points that form the convex hull
std::vector<Point> hull;
// find leftmost point
std::sort (p.begin(),p.end());
hull.push_back(p[0]);
p.erase(p.begin());

// declare all variables
    std::vector<double> pair; // if 0, then the pair are points on the hull
    std::vector<bool> line_less; // true when point is below the line
    std::vector<bool> line_greater; // true when point is above the line
    std::vector<double> dist; // calculate distance to the nearest next point in case of collinearity
    int new_point; // index of next point on the hull
// create a line and check inequality
    for (int j=0; j < p.size(); j++)
    {
        // remove all from line_less
        line_less.clear();
        for (int i=0; i < P.size(); i++)
        {
            // check inequality for the line 
            if (hull[hull.size()-1].x-p[j].x!=0)
            {
                line_less.push_back(P[i].y<((hull[hull.size()-1].y-p[j].y)/(hull[hull.size()-1].x-p[j].x))*(P[i].x-p[j].x)+p[j].y -pow(10,-10)) ;
            }
            else
            {
                line_less.push_back(P[i].x<p[j].x+pow(10,-10));
                }
            }
        pair.push_back(std::count(line_less.begin(), line_less.end(), true));
        }
    
    // append to convex hull
    for (int k=0; k < pair.size(); k++)
    {
        if (pair[k]==0)
        {
            // calculate Euclidean distance from (hull[hull.size()-1].x,hull[hull.size()-1].y)
            dist.push_back(sqrt(pow(hull[hull.size()-1].x-p[k].x,2)+pow(hull[hull.size()-1].y-p[k].y,2)));
            }
        else
        {
            // very large distance
            dist.push_back(pow(10,6));
            }
        }
    new_point = std::distance(std::begin(dist), std::min_element(std::begin(dist), std::end(dist)));
    hull.push_back(p[new_point]);
    // remove from p
    p.erase(p.begin()+new_point); 
    
    // clear pair and dist to be used for the next point on the hull
    pair.clear();
    dist.clear();  
    
    while ((hull[0].x!=hull[hull.size()-1].x) or (hull[0].y!=hull[hull.size()-1].y))
    {
    // create a line and check inequality
    for (int j=0; j < p.size(); j++)
    {
        // remove all from line_less and line_greater
        line_less.clear();
        line_greater.clear();
        for (int i=0; i < P.size(); i++)
        {
            // check inequality for the line 
            if (hull[hull.size()-1].x-p[j].x!=0)
            {
                line_less.push_back(P[i].y<((hull[hull.size()-1].y-p[j].y)/(hull[hull.size()-1].x-p[j].x))*(P[i].x-p[j].x)+p[j].y -pow(10,-10)) ;
                line_greater.push_back(P[i].y>((hull[hull.size()-1].y-p[j].y)/(hull[hull.size()-1].x-p[j].x))*(P[i].x-p[j].x)+p[j].y +pow(10,-10)) ;
            }
            else
            {
                line_less.push_back(P[i].x<p[j].x -pow(10,-10));
                 line_greater.push_back(P[i].x>p[j].x +pow(10,-10));
                }
            }
        pair.push_back(std::count(line_less.begin(), line_less.end(), true) * std::count(line_greater.begin(), line_greater.end(), true));
        }
        // append to convex hull
        if (std::count(pair.begin(),pair.end(),0)!=0)
        {
            if (std::count(pair.begin(),pair.end(),0)>=2)
            {
                for (int k=0; k < pair.size(); k++)
                {
                    if (pair[k]==0)
                    {
                        // calculate Euclidean distance from (hull[hull.size()-1].x,hull[hull.size()-1].y)
                        dist.push_back(sqrt(pow(hull[hull.size()-1].x-p[k].x,2)+pow(hull[hull.size()-1].y-p[k].y,2)));
                    }
                else
                {
                    // very large distance
                    dist.push_back(pow(10,6));
                    }
                }
                new_point = std::distance(std::begin(dist), std::min_element(std::begin(dist), std::end(dist)));
                hull.push_back(p[new_point]);
                // remove from p
                p.erase(p.begin()+new_point); 
                }
            else
            {
                new_point=std::distance(pair.begin(),std::find(pair.begin(),pair.end(),0));
                hull.push_back(p[new_point]);
                // remove from p
                p.erase(p.begin()+new_point);
                }
    // clear pair and dist to be used for the next point on the hull
    pair.clear();
    dist.clear(); 
        } // end if (pair has at least one zero value)
        else
        {
            new_point=0;
            hull.push_back(hull[new_point]);
            }
                
        } // end while loop
    
    // convert to a vector of vectors
    std::vector<std::vector<double> > HULL;
    for (int l=0; l < hull.size(); l++)
    {
        HULL.push_back({hull[l].x,hull[l].y});
    }
                
    return HULL;
}
