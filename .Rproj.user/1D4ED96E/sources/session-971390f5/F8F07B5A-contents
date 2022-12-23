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



calculate_ADCingr <- function(ADC_test, ADC_ref, inclusion_ingr, nutrient_ref, nutrient_ingr) {

  ADC_ingr <- ( ADC_test + ( ((1-inclusion_ingr) * nutrient_ref) / (inclusion_ingr * nutrient_ingr) ) * (ADC_test - ADC_ref) ) * 100

  return(ADC_ingr)

}
