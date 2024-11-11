#
# date written:: December 23rd, 2022
# last modified: December 23rd, 2022
#
#
#
###############################################################################




#' Apparent Digestibility Coefficient
#' 
#' Function to calculate the Apparent Digestibility Coefficient (ADC) of the dry 
#' matter fraction of a compound diet.
#' 
#' %% ~~ If necessary, more details than the description above ~~
#' 
#' @param diet_IS a numeric value, resembling the inclusion rate of internal
#' standard in the experimental diet given to the livestock.
#' @param feces_IS a numeric value, resembling the inclusion rate of internal
#' standard in the feces recovered during the digestibility trial.
#' @return returns a single numeric value which is the relative ADC for the
#' diet. If the value is not within the interval [0,1], an additional warning
#' is returned.
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
#' 
#' 
#' @export calculate_ADCdiet
calculate_ADCdiet <- function(diet_IS, feces_IS) {

  # calculate ADC
  ADC_diet <- (1 - (feces_IS - diet_IS) / feces_IS)

  # return result
  return(ADC_diet)
}
