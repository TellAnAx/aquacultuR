#' Nutrient retention (NR)
#' 
#' Function to calculate the nutrient retention
#' 
#' @param ibw numeric; initial weight in grams
#' @param fbw numeric; final weight in grams
#' @param ibn numeric; initial mass fraction of the target nutrient in the tissue 
#' of the experimental animal. The value must be between 0 and 1.
#' @param fbn numeric; final mass fraction of the target nutrient in the tissue 
#' of the experimental animal. The value must be between 0 and 1.
#' @param feed numeric; mass of feed given
#' @param nut_diet numeric; mass fraction of nutrient in the diet. The value must
#' be between 0 and 1.
#' 
#' @return a numeric value. Multiply by 100 to convert into percentage.
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
               fbn,
               feed,
               nut_diet) {

  # Checks----
  ## Check whether inputs are NA
  if (any(is.na(c(ibw, fbw, ibn, fbn, feed, nut_diet)))) 
    stop("Inputs must not be NA!")


  ## Check whether inputs are non-numeric
  if (any(!is.numeric(c(ibw, fbw, ibn, fbn, feed, nut_diet))))
    stop("Inputs must be numeric!")
  
  
  ## Check whether feed|nut_diet == 0
  if(any(feed == 0 | nut_diet == 0))
    stop("Input must not be zero! Result cannot be calculated.")


  ## Check whether inputs are within the range
  if (any(ibw <= 0)) 
    warning("ibw is <= 0! The result is not meaningful.")
  if (any(fbw <= 0)) 
    warning("fbw is <= 0! The result is not meaningful.")
  if (any(feed < 0)) 
    warning("feed is < 0! The result is not meaningful.")
  if (any(ibn < 0 | ibn > 1)) 
    warning("ibn is out of range! The result is not meaningful.")
  if (any(fbn < 0 | fbn > 1)) 
    warning("fbn is out of range! The result is not meaningful.")
  if (any(nut_diet < 0 | nut_diet > 1)) 
    warning("nut_diet is out of range! The result is not meaningful.")


  ## Check whether inputs are of same length
  length_ratio <- c(length(ibw), length(fbw), length(ibn), 
                    length(fbn), length(feed), length(nut_diet)) / length(ibw)
  if(any(length_ratio != 1))
    message("Inputs differ in length.")



  # Calculations----
  nr <- (fbw * fbn - ibw * ibn) / (feed * nut_diet)
  
  return(nr)
}
