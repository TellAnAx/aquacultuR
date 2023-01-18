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
# last modified:  December 18th, 2021
#
#
#
###############################################################################




geomWeight <- function(initWeight, finalWeight){
  
  # Calculate the geometric mean bodyweight
  geomWeight = sqrt(initWeight * finalWeight) 
  
  # Return the result
  return(geomWeight)
}