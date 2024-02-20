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



calculate_ADCnutr <- function(diet_IS, 
                              feces_IS, 
                              diet_NUTR, 
                              feces_NUTR) {

  ADC_nutr <- (1 - (diet_IS / feces_IS) * (feces_NUTR / diet_NUTR))

  return(ADC_nutr)

}
