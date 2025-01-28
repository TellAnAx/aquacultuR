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

  # calculate ADC
  adc_dm <- (1 - (es_feces - es_diet) / es_feces)

  # return result
  return(adc_dm)
}
