#' ADC of a feed ingredient (ADCingr)
#' 
#' Function to calculate the Apparent Digestibility Coefficient of a nutrient 
#' contained in a feed ingredient of a compound diet. The calculation of the 
#' ADCingr is based on the equation proposed by Bureau and Hua (2006).
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
#' @return returns a single numeric value in the interval [0, 1], which is the relative ADC for the
#' diet. If the value is not within the interval, an additional warning
#' is returned.
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
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(is.numeric(adc_test), is.numeric(adc_ref),
            is.numeric(nut_ref), is.numeric(nut_ingr),
            is.numeric(incl_ingr))
  
  
  ## Ensure all inputs have the same length
  input_lengths <- c(length(adc_test), length(adc_ref), length(nut_ref), length(nut_ingr), length(incl_ingr))
  if (length(unique(input_lengths)) != 1) {
    stop("All input vectors must have the same length.")
  }
  
  
  ## Warn if inputs are < 0
  if (any(adc_test < 0 | adc_ref < 0 | nut_ref < 0 | nut_ingr < 0 | incl_ingr < 0)) {
    warning("Some input values are negative. The result may not be meaningful.")
  }
  
  
  
  # Calculations----
  adc_ingr <- ( adc_test + ( ((1-incl_ingr) * nut_ref) / (incl_ingr * nut_ingr) ) * (adc_test - adc_ref) )

  
  if(adc_ingr > 1) {
    warning("ADC > 1")
  }
  
  
  return(adc_ingr)
}
