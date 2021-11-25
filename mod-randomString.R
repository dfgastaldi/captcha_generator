# Random string generator
randomStringGenerator <- function() {
  pw <- paste0(
    sample(LETTERS[-15], 1),#Letter "O" excluded, to avoid confusion with zero
    sample(1:9         , 1),
    sample(LETTERS[-15], 1),#Letter "O" excluded, to avoid confusion with zero
    sample(1:9         , 1)
  )
  
  return(pw)
}
LETTERS[-15]
