## These two functions work in tandem to enable caching for a square matrix
## inversion calculation.

## This function takes a matrix, stores it in a cache variable
## and provides a list of setter and getter functions.
## It acts as a wrapper around the matrix, retaining the inverse in cache

makeCacheMatrix <- function(x = matrix()) {
  inverseX <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inverseX <<- inverse
  getInverse <- function() inverseX
  list( set = set, get = get, setIntverse = setInverse, getInverse = getInverse )
}


## This function takes a list returned by makeCacheMatrix and
## returns matrix inverse, getting it from cache if possible.
## If the matrix inverse has not been previously computed (and hence not present in cache)
## then it computes the inverse, stores it in cache and returns the newly computed value

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverseX <- x$getInverse
  if ( !is.null(inverseX) ) {
    message(inverseX)
    message("getting cached data")
    return(inverseX)
  }
  data <- x$get()
  inverseX <- solve(X, ...)
  x$setInverse(inverseX)
  inverseX
}
