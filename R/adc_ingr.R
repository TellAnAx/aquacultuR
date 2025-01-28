#' ADC of a feed ingredient (ADCingr)
#' 
#' Function to calculate the Apparent Digestibility Coefficient of a nutrient 
#' contained in a feed ingredient of a compound diet.
#' 
#' @param adc_test a numeric value in the interval [0,1] that represents the
#' Apparent Digestibility Coefficient (ADC) of the diet that contains the
#' ingredient to be tested.
#' @param adc_ref a numeric value in the interval [0,1] that represents the
#' Apparent Digestibility Coefficient (ADC) of the reference diet without the
#' ingredient to be tested.
#' @param nut_ref a numeric value in the interval [0,1] that represents the
#' inclusion rate of the nutrient in the reference diet.
#' @param nut_ingr a numeric value in the interval [0,1] that represents the
#' inclusion rate of the nutrient in the test diet for which the Apparent
#' Digestibility Coefficient (ADC) of the nutrient in the ingredient will be
#' calculated.
#' @param incl_ingr a numeric value in the interval [0,1] that represents the
#' inclusion rate of the ingredient in the test diet for which the Apparent
#' Digestibility Coefficient (ADC) of the nutrient in an ingredient will be
#' calculated.
#' 
#' @return returns a single numeric value which is the relative ADC for the
#' diet. If the value is not within the interval [0,1], an additional warning
#' is returned.
#' 
#' @note The calculation of the ADCingr is based on the equation proposed by Bureau
#' and Hua (2006).
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' 
#' @references Bureau, D. P., & Hua, K. (2006): Letter to the Editor of
#' Aquaculture. Aquaculture, 252, p.103–105.
#' 
#' 
#' 
#' @export
adc_ingr <- function(adc_test, 
                     adc_ref, 
                     nut_ref, 
                     nut_ingr,
                     incl_ingr) {
  
  # calculate ADC
  adc_ingr <- ( adc_test + ( ((1-incl_ingr) * nut_ref) / (incl_ingr * nut_ingr) ) * (adc_test - adc_ref) )

  
  if(adc_ingr > 1) {
    warning("ADC > 1")
  }
    
  # return result
  return(adc_ingr)

}
