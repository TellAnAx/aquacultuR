#' Nutrient Efficiency Ratio (NER)
#' 
#' Function to calculate the Nutrient Efficiency Ratio (NER)
#' 
#' All input values must be provided in the same unit.
#' 
#' @param ibw a numeric value for the initial weight (either average
#' weight of the individuals or the total biomass) of the livestock at the
#' beginning of the feeding trial.
#' @param fbw a numeric value for the final weight (either average
#' weight of the individuals or the total biomass) of the livestock at the end
#' of the feeding trial.
#' @param fi numeric; value providing the total feed intake in grams during the 
#' experiment.
#' @param dm numeric; value within the interval of (0,1), indicating the dry matter
#' content of the feed.
#' @param nut_f numeric; value within the interval of (0,1), indicating the 
#' inclusion rate of the nutrient of interest in the feed fed.
#' 
#' @return returns a single numeric value
#' 
#' 
#' @author Anıl Axel Tellbüscher 
#' 
#' @examples
#' # Calculate the NER using the initial and final weight
#' ner(ibw = 1, fbw = 10, fi = 24, nut_f = 0.5)
#' 
#' 
#' @export
ner <- function(ibw, 
                fbw, 
                fi,
                dm = 1,
                nut_f) {
  
  # Checks----
  ## Check for NA values
  if(any(is.na(c(ibw, fbw, fi, dm, nut_f))))
    stop("Inputs must not be NA!")
  
  
  ## Check for non-numeric values
  if(any(!is.numeric(c(ibw, fbw, fi, dm, nut_f))))
    stop("Inputs must be numeric!")
  
  
  ## Check for c(fi, dm, nut_f) == 0
  if(any(c(fi, dm, nut_f) == 0))
    stop("Inputs must not be zero! Result cannot be calculated.")
  
  
  ## Check for negative values
  if(any(c(ibw, fbw, fi, nut_f, dm) < 0))
    warning("Inputs are negative. Result is not meaningful.")
  
  
  ## Check for dm > 1
  if(dm > 1)
    warning("DM is >100%. The result is not meaningful.")
  
  
  ## Check ibw > fbw
  if (ibw > fbw)
    warning("ibw is greater than fbw.")
  
  
  ## Check for inputs of differing length
  length_ratios <- c(length(ibw), length(fbw), 
                     length(fi), length(nut_f), length(dm)) / length(dm)
  if(!all(length_ratios == 1))
    message("Inputs have different lengths.")
  


  # Calculations----
  ag <- fbw - ibw  
  
  ner <- ag / (fi * dm * nut_f)
  
  return(ner)
}
