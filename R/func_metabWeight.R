#
#  TITLE: 
#         Function - metabWeight(initWeight, finalWeight)
#
#  DESCRIPTION:
#         A function that calculates the metabolic bodyweight.
#
#
#
# written by: Anil Axel Tellbuescher
#
# date written:   December 18th, 2021
# last modified:  December 18th, 2021
#
#
#
###############################################################################




metabWeight <- function(initWeight, finalWeight, geomWeight = NULL){
  
  if(is.null(geomWeight) == TRUE){
    
    # Calculate the geometric mean bodyweight using initWeight and finalWeight
    metabWeight <- sqrt(initWeight * finalWeight) ^ 0.8
    
  } else {
    
    metabWeight <- geomWeight ^ 0.8
  }
  
  # Return the result
  return(metabWeight)
}