#
#  TITLE: 
#         Function - calculate_RGR(initWeight, finalWeight, duration)
#
#  DESCRIPTION:
#         A function that calculates the Relative Growth Rate (RGR).
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




calculate_RGR <- function(initWeight, finalWeight, duration){
  
  # Calculate the relative growth rate
  result = (finalWeight - initWeight) / (duration * sqrt(finalWeight * initWeight))
  
  # Return the result
  return(result)
}