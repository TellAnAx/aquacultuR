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



calculate_ADCnutr <- function(intstandard_diet, intstandard_feces, nutrient_diet, nutrient_feces) {

  ADC_nutr <- (1 - (intstandard_diet / intstandard_feces) * (nutrient_feces / nutrient_diet)) * 100

  return(ADC_nutr)

}
