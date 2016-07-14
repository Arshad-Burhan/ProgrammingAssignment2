##Below are two functions which can be used to find the inverse of a matrix more efficiently 
##when you are dealing with large data sets.

##makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## makeCacheMatrix is a function that returns a list of functions
##It Contains the following functions:
## * setMatrix      set the value of a matrix
## * getMatrix      get the value of a matrix
## * setInverse     set the value of inverse of the matrix
## * getInverse     get the value of inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
     setMatrix<- function(y)
         {
             x <<- y
            inverse <<- NULL
         }
  
     getMatrix <- function()
         {
           x  
         } 
     setInverse <- function(solve)
         {
           inverse<<- solve
         }
     getInverse <- function()
         {
           inverse
         }
list(setMatrix = setMatrix, getMatrix = getMatrix,
     setInverse= setInverse, getInverse = getInverse)
     
}



## The following function calculates the inverse of the special "matrix" created with the 
##above function.However, it first checks to see if the inverse has already been calculated.
## If so, it gets the inverse from the cache and skips the computation.
## Otherwise, it calculates the inverse of the matrix and sets the value of the inverse 
##in the cache via the setInverse function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse<- x$getInverse()
  
      if(!is.null(inverse)) 
              {
               message("getting cached data")
               return(inverse)
             }     
  
      matrix <- x$getMatrix()
      inverse<- solve(matrix, ...)
      x$setInverse(inverse)
      
      inverse
}
