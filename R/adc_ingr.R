#' ADC of a feed ingredient (ADCingr)
#'
#' Function to calculate the Apparent Digestibility Coefficient of a nutrient
#' contained in a feed ingredient of a compound diet. The calculation of the
#' ADCingr is based on equation 4 proposed by Bureau & Hua (2006).
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
#' @param dm_ref a numeric value in the interval [0,1] (default: 1) that 
#' represents the dry matter content of the reference diet.
#' @param dm_ingr a numeric value in the interval [0,1] (default: 1) that
#' represents the dry matter content of the tested feed ingredient.
#' @param incl_ingr a numeric value in the interval [0,1] (default: 0.3) that 
#' represents the inclusion rate of the ingredient in the test diet for which 
#' the Apparent Digestibility Coefficient (ADC) of the nutrient in an 
#' ingredient will be calculated.
#'
#' @return returns a single numeric value in the interval [0, 1], which is the
#' relative ADC for the diet. If the value is not within the interval, an
#' additional warning is returned.
#'
#' @examples
#' # Example from Bureau et al. (1999) - Blood meal 2
#' 
#' # reference feed dry matter: 0.928 (92.8%)
#' # reference feed nutrient mass frac.: 0.45 (45%)
#' # reference feed apparent digestibility coef.: 0.923 (92.3%)
#' # test feed apparent digestibility coef.: 0.902 (90.2%)
#' # test ingredient dry matter: 0.895 (89.5%)
#' # test ingredient nutrient mass frac.: 0.846 (84.6%)
#' 
#' adc_ingr(adc_ref = 0.923, 
#'          nut_ref = 0.45, 
#'          dm_ref = 0.928,
#'          adc_test = 0.902, 
#'          nut_ingr = 0.846,
#'          dm_ingr = 0.895)
#'
#' @author Anıl Axel Tellbüscher
#'
#' @references Bureau, D. P., & Hua, K. (2006): Letter to the Editor of
#' Aquaculture. Aquaculture, 252, p.103–105.
#' @references Bureau, D. P., Harris, A. M., & Cho, C. Y. (1999): Apparent 
#' digestibility of rendered animal protein ingredients for rainbow trout 
#' (Oncorhynchus mykiss). Aquaculture 180, p.345-358.
#'
#' @export
adc_ingr <- function(adc_test,
                     adc_ref,
                     nut_ref,
                     nut_ingr,
                     dm_ref = 1,
                     dm_ingr = 1,
                     incl_ingr = 0.3) {
  # Checks----
  ## Ensure inputs are numeric
  stopifnot(
    is.numeric(adc_test),
    is.numeric(adc_ref),
    is.numeric(nut_ref),
    is.numeric(nut_ingr),
    is.numeric(incl_ingr),
    is.numeric(dm_ref),
    is.numeric(dm_ingr)
  )
  
  
  ## Ensure all inputs have the same length
  input_lengths <- c(
    length(adc_test),
    length(adc_ref),
    length(nut_ref),
    length(nut_ingr),
    length(incl_ingr),
    length(dm_ref),
    length(dm_ingr)
  )
  if (length(unique(input_lengths)) != 1) {
    warning("Input vectors do not have the same length. The matching might be
            incorrect.")
  }
  
  
  ## Warn if inputs are < 0
  if (any(adc_test < 0 |
          adc_ref < 0 |
          nut_ref < 0 |
          nut_ingr < 0 |
          incl_ingr < 0 |
          dm_ref < 0 |
          dm_ingr < 0)) {
    warning("Some input values are negative. The result is not meaningful.")
  }
  
  
  
  # Calculations----
  adc_ingr <- adc_test + ((adc_test - adc_ref) * 
                            (((1 - incl_ingr) * nut_ref * dm_ref) /
                            (incl_ingr * nut_ingr * dm_ingr)))
  
  
  if (adc_ingr > 1) {
    warning("ADC > 1")
  }
  
  
  return(adc_ingr)
}
