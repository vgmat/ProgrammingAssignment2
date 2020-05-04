# Project Title: Peer-graded Assignment: Programming Assignment 2: 
#Lexical Scoping

In this Programming Assignment I use the scoping rules of the R language and how they can be manipulated to preserve state inside of an R object.

Getting Started

Example: Caching the Mean of a Vector
In this example we introduce the <<- operator which can be used to assign a value to an object in an environment that is different from the current environment. Below are two functions that are used to create a special object that stores a numeric vector and cache's its mean.


1. set the value of the vector
2. get the value of the vector
3. set the value of the mean
4. get the value of the mean

This function create a special object that stores a numeric vector.

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
The following function cachemean calculates the mean of the special "vector" created with the above function.
```
cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}


Next  I create makeCacheMatrix I Assume the input x as a matrix and then set the solved value "soln" as a null  then I changed every reference to "mean" to "solve"

```
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  soln <- NULL
  set <- function(y) {
    x <<- y
    soln <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) soln <<- solve
  getsolve <- function() soln
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

```
Next I create cacheSolve funtion to sove the equations.Here I changed "mean" to "solve" and "m" to "soln"

```
cacheSolve <- function(x, ...) {
  soln <- x$getsolve()
  if(!is.null(soln)) {
    message("getting inversed matrix")
    return(soln)
  }
  data <- x$get()
  soln <- solve(data, ...)
  x$setsolve(soln)
  soln
}

Here is the output of my functions

```
my_matrix <- makeCacheMatrix(matrix(c(2, 5, 3, 7), nrow=2,ncol=2,byrow=TRUE))

```
my_matrix$get()

Output

        [,1] [,2]
[1,]    2    5
[2,]    3    7


cacheSolve(my_matrix)

Output

# [,1] [,2]
# [1,]   -7    5
# [2,]    3   -2
