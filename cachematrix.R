setwd("J:/COURSERA MATERIALS/R Programming")
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
#The following function calculates the mean of the special "vector" 
#created with the above function.

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
## I Assume the input x as a matrix
## and then set the solved value "soln" as a null
## then I changed every reference to "mean" to "solve"
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
##
## Here I changed "mean" to "solve" and "m" to "soln"
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
