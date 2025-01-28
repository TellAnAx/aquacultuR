#' ADC of a nutrient (ADCnut)
#' 
#' Function to calculate the Apparent Digestibility Coefficient of a nutrient
#' in the dry matter fraction of a compound diet.
#' 
#' @param es_diet numeric; value resembling the inclusion rate of external
#' standard in the experimental diet given to the livestock.
#' @param es_feces numeric; value resembling the inclusion rate of external
#' standard in the feces recovered during the digestibility trial.
#' @param nut_diet numeric; value representing the inclusion rate of the 
#' target nutrient in the diet. 
#' @param nut_feces numeric; value representing the inclusion rate of the 
#' target nutrient in the feces. 
#' 
#' @return returns a single numeric value which is the relative ADC for a
#' single nutrient in the diet. If the value is not within the interval [0,1],
#' an additional warning is returned.
#' 
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' 
#' @references Bureau, D. P., & Hua, K. (2006): Letter to the Editor of
#' Aquaculture. Aquaculture, 252, p.103–105.
#' 
#' 
#' @export
adc_nut <- function(es_diet, 
                    es_feces, 
                    nut_diet, 
                    nut_feces) {

  adc_nut <- (1 - (es_diet / es_feces) * (nut_feces / nut_diet))

  return(adc_nut)
}
