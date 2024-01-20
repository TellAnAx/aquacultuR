#
# TITLE:
#
#
# DESCRIPTION:
#
#
#
#
# written by: Anıl Axel Tellbüscher
#
# date written:: December 23rd, 2022
# last modified: December 23rd, 2022
#
#
#
###############################################################################


calculate_ADCdiet <- function(diet_IS, feces_IS) {

  # calculate ADC
  ADC_diet <- (1 - (feces_IS - diet_IS) / feces_IS) * 100

  # return result
  return(ADC_diet)
}
