myFunction <- function(){
  x <- rnorm(100)
  print(x)
  mean(x)
}

second <- function(x){
  x + rnorm(length(x))
}
