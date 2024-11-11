#
# TITLE:
#
#
# DESCRIPTION:
#
#
#
#
# written by: Anil Axel Tellbuescher
#
# date written:: December 23rd, 2022
# last modified: December 23rd, 2022
#
#
#
###############################################################################





#' Apparent Digestibility Coefficient of a single nutrient in a feed ingredient
#' (ADCingr)
#' 
#' Function to calculate the Apparent Digestibility Coefficient (ADC) of a
#' nutrient in a compound diet.
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param diet_IS a numeric value, resembling the inclusion rate of internal
#' standard in the experimental diet given to the livestock.
#' @param feces_IS a numeric value, resembling the inclusion rate of internal
#' standard in the feces recovered during the digestibility trial.
#' @param diet_NUTR a numeric value representing the inclusion rate of the 
#' target nutrient in the diet. 
#' @param feces_NUTR a numeric value representing the inclusion rate of the 
#' target nutrient in the feces. 
#' @return returns a single numeric value which is the relative ADC for a
#' single nutrient in the diet. If the value is not within the interval [0,1],
#' an additional warning is returned.
#' 
#' @note %% ~~further notes~~
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
#' @export calculate_ADCnutr
calculate_ADCnutr <- function(diet_IS, 
                              feces_IS, 
                              diet_NUTR, 
                              feces_NUTR) {

  ADC_nutr <- (1 - (diet_IS / feces_IS) * (feces_NUTR / diet_NUTR))

  return(ADC_nutr)
}
