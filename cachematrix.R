## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## the fun below creates a short cut to store data that otherwise will take a long 
## time to compute repeatedly. This fun store the special inverse of a matrix. 
## Let's consider the fun as a container where variables are arranged. 

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
        set <- function(y){
                x <<- y # the double arrow capable to modify varials 
                inv <<- NULL # double arrow assign a value to an object outside
                #its current eviron
        }
        get <- function() {x}
        setinverse <- function(inverse) {inv <<- inverse}
        getinverse <- function(){inv}
        list(set = set, get = get, 
             setinverse = setinverse, 
             getinverse = getinverse)
}


## Write a short comment describing this function
## the fun cashesolve takes an assigned matrix variable as its argument.
## it returns the inverse of the special matrix

## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
                inv <- x$getinverse()
        if (!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        matrix <- x$get()
        inv <- solve(matrix, ...)
        x$setinverse(inv)
        inv
}
