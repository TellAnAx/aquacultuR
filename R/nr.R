#' Nutrient retention (NR)
#' 
#' Function to calculate the nutrient retention
#' 
#' @param ibw numeric; initial weight in grams
#' @param fbw numeric; final weight in grams
#' @param ibn numeric between 0 and 1; initial mass fraction of the target 
#' nutrient in the tissue of the experimental animal.
#' @param fbn numeric between 0 and 1; final mass fraction of the target 
#' nutrient in the tissue of the experimental animal.
#' 
#' @return a numeric value
#' 
#' @examples
#' # initial bodyweight = 10 g
#' # final bodyweight = 100 g
#' # initial mass fraction of N = 100 g/kg (10%)
#' # final mass fraction of N = 150 g/kg (15%)
#' # -> 14 g N have been taken up.
#' nr(ibw = 10, fbw = 100, ibn = 0.1, fbn = 0.15)
#' 
#' # multiple fish
#' nr(ibw = 10, fbw = c(93, 102, 99, 98, 101, 132), ibn = 0.1, fbn = 0.15)
#' 
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
  nr <- fbw * fbn - ibw * ibn
  
  return(nr)
}
