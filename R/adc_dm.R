#' ADC of DM
#' 
#' Function to calculate the Apparent Digestibility Coefficient (ADC) of the dry 
#' matter fraction of a compound diet.
#' 
#' @param es_diet a numeric value, resembling the inclusion rate of external
#' standard in the experimental diet given to the livestock.
#' @param es_feces a numeric value, resembling the inclusion rate of external
#' standard in the feces recovered during the digestibility trial.
#' 
#' @return returns a single numeric value which is the relative ADC for the
#' dry matter content of the diet. If the value is not within the interval [0,1], 
#' an additional warning is returned.
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @references Bureau, D. P., & Hua, K. (2006): Letter to the Editor of
#' Aquaculture. Aquaculture, 252, p.103–105.
#' 
#' @export
adc_dm <- function(es_diet, es_feces) {
  
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(is.numeric(es_diet), is.numeric(es_feces))
  
  
  ## Ensure inputs have the same length
  if (length(es_diet) != length(es_feces)) {
    stop("Error: inputs must be of the same length.")
  }
  
  
  ## Check whether inputs are > 0
  if (any(es_diet < 0 | es_feces < 0)) {
    warning("Some input values are negative. The result may not be meaningful.")
  }
  
  
  # Calculations----
  adc_dm <- 1 - (es_diet / es_feces)
  return(adc_dm)
}
