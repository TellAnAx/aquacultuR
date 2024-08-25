#
#  TITLE: 
#         Function - geomWeight(initWeight, finalWeight)
#
#  DESCRIPTION:
#         A function that calculates the geometric mean bodyweight.
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




calculate_geomWeight <- function(initWeight, finalWeight){
  
  # Calculate the geometric mean bodyweight
  result = sqrt(initWeight * finalWeight) 
  
  # Return the result
  return(result)
}