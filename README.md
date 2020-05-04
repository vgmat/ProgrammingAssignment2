# Project Title: Peer-graded Assignment: Programming Assignment 2: 
#Lexical Scoping

In this Programming Assignment I use the scoping rules of the R language and how they can be manipulated to preserve state inside of an R object.

## Getting Started

Example: Caching the Mean of a Vector
In this example we introduce the <<- operator which can be used to assign a value to an object in an environment that is different from the current environment. Below are two functions that are used to create a special object that stores a numeric vector and cache's its mean.

The first function, makeVector creates a special "vector", which is really a list containing a function to

1. set the value of the vector
2. get the value of the vector
3. set the value of the mean
4. get the value of the mea

```
makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}



