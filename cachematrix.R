## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# creates a matrix with functions to get and set values and solve
makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y) {
    # assign value in an environment different from the current environment
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  
  # returns a list
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
  
}


## Write a short comment describing this function
# solves the inverse from makeCacheMatrix
cacheSolve <- function(x, ...) {

  # checking to see if mean has already been computed
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  # print(data, ...)
  m <- solve(data, ...)
  x$setsolve(m)
  
  # return matrix inverse of 'x'
  m
  
}


