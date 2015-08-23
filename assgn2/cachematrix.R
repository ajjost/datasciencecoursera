## This function computes the inverse of an matrix by inverting and
## caching the matrix or retrieving the inverted matrix by comparing 
## with the cache.


## This function creates a matrix object that gets and caches any invertable
## matrix passed to it until the object calling it finishes
makeCacheMatrix <- function(x = matrix()) {
        ##reset
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        ## get matrix from parent, get inverse and cache
        get <- function() x
        setinverse <- function(solve) inv <<- solve
        getmatrix <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse= getinverse)
}


## This function computes the inverse of the matrix returned by makeCacheMatrix
## If the inverse has already been calculated then it retrieves it from the cache
## otherwise, it calculates it

cacheSolve <- function(x=matrix(), ...) {
        ## checks to see if cached, if so returns cached data
               inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
         ## calculates and stores inverted cache if it's new      
        matrix <- x$get()
        inv <- solve(matrix, ...)
        x$setinverse(inv)
        return(inv)
}
