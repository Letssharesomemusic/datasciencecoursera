makeCacheMatrix<- function(x=matrix()){
  inv<- NULL
  set<- function(y){
    x<<-y
    inv<<- NULL
  }
  get<- function(){x}
  setInverse<- function(inverse){inv <<-inverse}
  getInverse<- function() {inv}
  list(set= set, get= get, setInverse=setInverse, getInverse=getInverse)
}

cachesolve<- function(x, ...){
  inv<- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  mat<- x$get()
  inv<- solve(mat, ...)
  x$setInverse(inv)
  inv
}

source("C:/Users/alexg/Desktop/specdata/makeCacheMatrix.R")
pmatrix<- makeCacheMatrix(matrix(1:16, nrow = 4, ncol=4))
pmatrix$get()
pmatrix$getInverse()

pmatrix<- makeCacheMatrix(matrix(1:4, nrow = 2, ncol = 2))
pmatrix$get()
cachesolve(pmatrix)