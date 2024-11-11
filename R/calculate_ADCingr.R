# date written:: December 23rd, 2022
# last modified: December 23rd, 2022
#
#
#
###############################################################################

#' Apparent Digestibility Coefficient of a feed ingredient (ADCingr)
#' 
#' Function to calculate the Apparent Digestibility Coefficient (ADC) of a feed
#' ingredient that is part of a compound diet.
#' 
#' @param ADC_test a numeric value in the interval [0,1] that represents the
#' Apparent Digestibility Coefficient (ADC) of the diet that contains the
#' ingredient to be tested.
#' @param ADC_ref a numeric value in the interval [0,1] that represents the
#' Apparent Digestibility Coefficient (ADC) of the reference diet without the
#' ingredient to be tested.
#' @param nutr_ref a numeric value in the interval [0,1] that represents the
#' inclusion rate of the nutrient in the reference diet.
#' @param nutr_ingr a numeric value in the interval [0,1] that represents the
#' inclusion rate of the nutrient in the test diet for which the Apparent
#' Digestibility Coefficient (ADC) of the nutrient in the ingredient will be
#' calculated.
#' @param incl_ingr a numeric value in the interval [0,1] that represents the
#' inclusion rate of the ingredient in the test diet for which the Apparent
#' Digestibility Coefficient (ADC) of the nutrient in an ingredient will be
#' calculated.
#' @return returns a single numeric value which is the relative ADC for the
#' diet. If the value is not within the interval [0,1], an additional warning
#' is returned.
#' 
#' @note The calculation of the ADCingr is based on the equation proposed by Bureau
#' and Hua (2006).
#' 
#' @author Anıl Axel Tellbüscher
#' 
#' @seealso %% ~~objects to See Also as \code{\link{help}}, ~~~
#' 
#' @references Bureau, D. P., & Hua, K. (2006): Letter to the Editor of
#' Aquaculture. Aquaculture, 252, p.103–105.
#' 
#' @examples
#' 
#' 
#' @export calculate_ADCingr
calculate_ADCingr <- function(ADC_test, 
                              ADC_ref, 
                              nutr_ref, 
                              nutr_ingr,
                              incl_ingr
                              ) {
  
  # calculate ADC
  ADC_ingr <- ( ADC_test + ( ((1-incl_ingr) * nutr_ref) / (incl_ingr * nutr_ingr) ) * (ADC_test - ADC_ref) )

  
  if(ADC_ingr > 1) {
    warning("ADC above 1")
  }
    
  # return result
  return(ADC_ingr)

}
