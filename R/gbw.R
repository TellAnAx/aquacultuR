#' Geometric Bodyweight (GBW)
#' 
#' A function that calculates the geometric mean bodyweight.
#' 
#' 
#' @param ibw a numeric value that is providing the initial weight in
#' grams.
#' @param fbw a numeric value that is providing the final weight in
#' grams.
#' 
#' @return returns a numeric value that is the geometric bodyweight.
#' 
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' 
#' @importFrom dplyr mutate
#' 
#' @examples
#' data(weight2)
#' 
#' dplyr::mutate(weight2, GBW = gbw(W_start, W_end))
#' 
#' 
#' 
#' @export
gbw <- function(ibw, 
                fbw){
  
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(is.numeric(ibw), is.numeric(fbw))
  
  
  ## Ensure inputs have the same length
  input_lengths <- c(length(ibw), length(fbw))
  if (length(unique(input_lengths)) != 1) {
    stop("All input vectors must have the same length.")
  }
  
  
  ## Check whether inputs are >= 0
  if (any(ibw <= 0 | fbw <= 0)) {
    stop("Some input values are negative. The result cannot be calculated.")
  }
  
  
  # Calculations----
  ## Calculate the geometric mean bodyweight
  gbw = sqrt(ibw * fbw) 
  
  ## Return the result
  return(gbw)
}
