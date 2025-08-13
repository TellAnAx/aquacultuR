#' Geometric Mean Bodyweight (GMBW)
#' 
#' A function that calculates the geometric mean of the initial and final 
#' bodyweight.
#' 
#' 
#' @param ibw a numeric value that is providing the initial weight in
#' grams.
#' @param fbw a numeric value that is providing the final weight in
#' grams.
#' 
#' @return returns a numeric value that is the geometric mean bodyweight.
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
#' dplyr::mutate(weight2, GMBW = gbw(W_start, W_end))
#' 
#' 
#' 
#' @export
gbw <- function(ibw, 
                fbw){
  
  # Checks----
  ## Check whether inputs are NA
  stopifnot("Inputs must not be NA!" = any(!is.na(ibw, fbw)))
  
  
  ## Check whether inputs are numeric
  stopifnot("Inputs must be numeric!" = any(is.numeric(c(ibw, fbw))))
  
  
  ## Check whether inputs are < 0
  stopifnot("Inputs are < 0! Result cannot be calculated." = all(c(ibw, fbw) >= 0))
  
  
  # Check whether inputs are == 0
  if(any(c(ibw, fbw)) == 0)
    warning("Inputs are == 0! The result is not meaningful.")
  
  
  ## Check whether inputs have the same length
  length_ratio <- c(length(ibw), length(fbw)) / length(ibw)
  if (any(length_ratio != 1))
    message("Inputs have different lengths.")

  
  
  # Calculations----
  gbw = sqrt(ibw * fbw) 
  
  return(gbw)
}
