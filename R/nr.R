#' Nutrient retention (NR)
#' 
#' Function to calculate the nutrient retention
#' 
#' @param ibw numeric; value that is providing the initial weight in grams
#' @param fbw numeric; value that is providing the final weight in grams
#' @param ibn numeric; value between 0 and 1 that provides the initial
#' mass fraction of the target nutrient in the tissue of the experimental animal.
#' @param fbn numeric; value between 0 and 1 that provides the final mass fraction
#' of the target nutrient in the tissue of the experimental animal.
#' 
#' @return a numeric value
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @export
nr <- function(ibw,
               fbw,
               ibn,
               fbn) {

  # Checks----
  ## Check whether inputs are NA
  if (any(is.na(c(ibw, fbw, ibn, fbn)))) 
    stop("Inputs must not be NA!")


  ## Check whether inputs are non-numeric
  if (any(!is.numeric(c(ibw, fbw, ibn, fbn))))
    stop("Inputs must be numeric!")


  ## Check whether inputs are within the range
  if (any(ibw <= 0)) 
    warning("ibw is <= 0! The result is not meaningful.")
  if (any(fbw <= 0)) 
    warning("fbw is <= 0! The result is not meaningful.")
  if (any(ibn < 0 | ibn > 1)) 
    warning("ibn is out of range! The result is not meaningful.")
  if (any(fbn < 0 | fbn > 1)) 
    warning("fbn is out of range! The result is not meaningful.")


  ## Check whether inputs are of same length
  length_ratio <- c(length(ibw), length(fbw), length(ibn), length(fbn)) / length(ibw)
  if(any(length_ratio != 1))
    message("Inputs differ in length.")



  # Calculations----
  retention <- fbw * fbn - ibw * ibn
  
  return(retention)
}
