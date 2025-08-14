#' Nutrient retention (NR)
#' 
#' Function to calculate the nutrient retention
#' 
#' @param ibw numeric; value that is providing the initial weight in grams
#' @param fbw numeric; value that is providing the final weight in grams
#' @param nut_start numeric; value between 0 and 1 that provides the initial
#' inclusion rate of the target nutrient in the tissue of the experimental animal.
#' @param nut_end numeric; value between 0 and 1 that provides the final inclusion
#' rate of the target nutrient in the tissue of the experimental animal.
#' 
#' @return a numeric value
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @export
retention <- function(ibw,
               nut_start,
               fbw,
               nut_end) {
  # Check for numeric and non-missing
  if (any(is.na(c(ibw, fbw, nut_start, nut_end)))) 
    stop("Inputs must not be NA")
  
  if (!all(sapply(list(ibw, fbw, nut_start, nut_end), is.numeric))) 
    stop("All inputs must be numeric")

  
  # Warn if any value is <= 0
  if (ibw <= 0) warning("ibw is zero or negative; result may not be meaningful")
  if (fbw <= 0) warning("fbw is zero or negative; result may not be meaningful")
  if (nut_start <= 0) warning("nut_start is zero or negative; result may not be meaningful")
  if (nut_end <= 0) warning("nut_end is zero or negative; result may not be meaningful")
  
  retention <- fbw * nut_end - ibw * nut_start
  
  return(retention)
}
