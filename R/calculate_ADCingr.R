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
