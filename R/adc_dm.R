#' ADC of DM
#' 
#' Function to calculate the Apparent Digestibility Coefficient (ADC) of the dry 
#' matter fraction of a compound diet.
#' 
#' @param std_diet a numeric value, resembling the inclusion rate of
#' standard in the experimental diet given to the livestock.
#' @param std_feces a numeric value, resembling the inclusion rate of
#' standard in the feces recovered during the digestibility trial.
#' 
#' @return returns a single numeric value in the interval [0, 1], which is the relative ADC for the
#' dry matter content of the diet. If the value is not within the interval, 
#' an additional warning is returned.
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @references Bureau, D. P., & Hua, K. (2006): Letter to the Editor of
#' Aquaculture. Aquaculture, 252, p.103–105.
#' 
#' @export
adc_dm <- function(std_diet, std_feces) {
  
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(is.numeric(std_diet), is.numeric(std_feces))
  
  
  ## Ensure inputs have the same length
  if (length(std_diet) != length(std_feces)) {
    stop("All input vectors must have the same length.")
  }
  
  
  ## Check whether inputs are > 0
  if (any(std_diet < 0 | std_feces < 0)) {
    warning("Some input values are negative. The result may not be meaningful.")
  }
  
  
  # Calculations----
  adc_dm <- 1 - (std_diet / std_feces)
  return(adc_dm)
}
