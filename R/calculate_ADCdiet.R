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


calculate_ADCdiet <- function(intstandard_diet, intstandard_feces) {

  ADC_diet <- (1 - (intstandard_feces - intstandard_diet) / intstandard_feces) * 100

  return(ADC_diet)

}
