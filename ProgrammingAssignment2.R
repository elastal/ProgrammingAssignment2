# set working directory
setwd("C:/Users/bop5/Documents/Test_R/ProgrammingAssignment2")

# This function creates a matrix and initializes a null variable "s" to store the solution.
# The function also has methods to set, get, set the solution, and get the solution for the matrix.
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  s <- NULL
  set <- function(y) {
    x <<- y # assigns the input matrix to x
    s <<- NULL # sets the solution variable to null
  }
  get <- function() x # method to return the matrix
  setsolve <- function(solve) s <<- solve # method to set the solution
  getsolve <- function() s # method to get the solution
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

# This function checks if the solution variable has a value.
# If it does, it prints a message and returns the solution.
# If not, it gets the matrix and solves it using the 'solve' function, 
# assigns the solution to the variable 's' and returns the solution.
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}