#
#  TITLE: 
#         Function - calculate_metabWeight(initWeight, finalWeight)
#
#  DESCRIPTION:
#         A function that calculates the metabolic bodyweight.
#
#
#
# written by: Anil Axel Tellbuescher
#
# date written:   December 18th, 2021
# last modified:  August 25th, 2024
#
#
#
###############################################################################




calculate_metabWeight <- function(initWeight, finalWeight, geomWeight = NULL){
  
  if(is.null(geomWeight) == TRUE){
    
    # Calculate the geometric mean bodyweight using initWeight and finalWeight
    result <- sqrt(initWeight * finalWeight) ^ 0.8
    
  } else {
    
    result <- geomWeight ^ 0.8
  }
  
  # Return the result
  return(result)
}