## These two functions allow for the caching of the inverse of a matrix,
## reducing the cost of repeated inverse calculations.

## This function creates a special matrix, which is a list containing a function
## to do the following:
## - set the values of the matrix
## - get the values of the matrix
## - set the value of the inverse
## - get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i
  
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## The function returns the inverse of any invertible matrix, by either:
## - returning the cached inverse if available
## - computing the inverse and caching this inverse

cacheSolve <- function(x, ...) {
  i <- x$getInverse()
  
  if(!is.null(i)){
    message("Getting cached data")
    return(i)
  }
  
  matrix <- x$get()
  i <- solve(matrix, ...)
  x$setInverse(i)
  
  i
}
